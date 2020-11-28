import XCTest
@testable import SwiftRequest

class BodyTests: XCTestCase {
    
    var createdUrls = [URL]()
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        try createdUrls.forEach { try FileManager.default.removeItem(at: $0) }
    }
    
    func testInitJson() {
        struct JsonObject: Encodable {
            let value1: String
            let value2: Int
        }
        
        let jsonObject = JsonObject(value1: "value1", value2: 2)
        let body = Body(builder: { Json(jsonObject) })
        XCTAssertEqual(body.body?.dataFunction(), try! JSONEncoder().encode(jsonObject))
        XCTAssertNil(body.url)
        XCTAssertNil(body.scheme)
        XCTAssertNil(body.host)
        XCTAssertNil(body.path)
        XCTAssertNil(body.method)
        XCTAssertNil(body.cachePolicy)
        XCTAssertNil(body.timeoutInterval)
        XCTAssertNil(body.query)
        XCTAssertNil(body.headers)
        XCTAssertNil(body.bodyStream)
        XCTAssertNil(body.httpShouldHandleCookies)
        XCTAssertNil(body.httpShouldUsePipelining)
        XCTAssertNil(body.allowsCellularAccess)
        XCTAssertNil(body.allowsConstrainedNetworkAccess)
        XCTAssertNil(body.allowsExpensiveNetworkAccess)
        XCTAssertNil(body.networkServiceType)
    }
    
    func testInitMultipart() {
        let multipartForm = MultipartForm {
            MultipartFormData(name: "name1", value: "Value 1", contentType: "application/content1", transferEncoding: "transfer-encoding1")
            MultipartFormData(name: "name2", value: "Value 2", contentType: "application/content2")
            MultipartFormData(name: "name3", value: "Value 3", transferEncoding: "transfer-encoding2")
            MultipartFormData(name: "name4", value: "Value 4")
        }
        let body = Body(builder: { multipartForm })
        
        XCTAssertNil(body.body?.dataFunction())
        
        let data = body.body?.dataFunction("Boundary12345").flatMap { String(data: $0, encoding: .utf8) }
        XCTAssertEqual(data, """
        --Boundary12345\r\nContent-Disposition: form-data; name="name1"\r\nContent-Type: application/content1\r\nContent-Transfer-Encoding: transfer-encoding1\r\n\r\nValue 1\r\n--Boundary12345\r\nContent-Disposition: form-data; name="name2"\r\nContent-Type: application/content2\r\n\r\nValue 2\r\n--Boundary12345\r\nContent-Disposition: form-data; name="name3"\r\nContent-Transfer-Encoding: transfer-encoding2\r\n\r\nValue 3\r\n--Boundary12345\r\nContent-Disposition: form-data; name="name4"\r\n\r\nValue 4\r\n--Boundary12345--\r\n
        """)
        XCTAssertNil(body.url)
        XCTAssertNil(body.scheme)
        XCTAssertNil(body.host)
        XCTAssertNil(body.path)
        XCTAssertNil(body.method)
        XCTAssertNil(body.cachePolicy)
        XCTAssertNil(body.timeoutInterval)
        XCTAssertNil(body.query)
        XCTAssertNil(body.headers)
        XCTAssertNil(body.bodyStream)
        XCTAssertNil(body.httpShouldHandleCookies)
        XCTAssertNil(body.httpShouldUsePipelining)
        XCTAssertNil(body.allowsCellularAccess)
        XCTAssertNil(body.allowsConstrainedNetworkAccess)
        XCTAssertNil(body.allowsExpensiveNetworkAccess)
        XCTAssertNil(body.networkServiceType)
    }
    
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
    func testInitMultipartFile() {
        var intData = 123456789
        let data = withUnsafeBytes(of: &intData) { Data($0) }
        let fileManager = FileManager.default
        let url = fileManager.temporaryDirectory.appendingPathComponent("testdata.data")
        fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
        createdUrls.append(url)
        let multipartForm = MultipartForm {
            MultipartFormFile(name: "file", file: url, contentType: "application/number", transferEncoding: "Int")
        }
        let body = Body(builder: { multipartForm })
        var expectedData = """
        --Boundary12345\r\nContent-Disposition: form-data; name="file"\r\nContent-Type: application/number\r\nContent-Transfer-Encoding: Int\r\n\r\n
        """.data(using: .utf8)
        expectedData?.append(data)
        expectedData?.append("\r\n--Boundary12345--\r\n".data(using: .utf8) ?? Data())
        XCTAssertEqual(body.body?.dataFunction("Boundary12345"), expectedData)
        XCTAssertNil(body.url)
        XCTAssertNil(body.scheme)
        XCTAssertNil(body.host)
        XCTAssertNil(body.path)
        XCTAssertNil(body.method)
        XCTAssertNil(body.cachePolicy)
        XCTAssertNil(body.timeoutInterval)
        XCTAssertNil(body.query)
        XCTAssertNil(body.headers)
        XCTAssertNil(body.bodyStream)
        XCTAssertNil(body.httpShouldHandleCookies)
        XCTAssertNil(body.httpShouldUsePipelining)
        XCTAssertNil(body.allowsCellularAccess)
        XCTAssertNil(body.allowsConstrainedNetworkAccess)
        XCTAssertNil(body.allowsExpensiveNetworkAccess)
        XCTAssertNil(body.networkServiceType)
    }
    
    func testMultipartEither() {
        var displayContentType = true
        let multipartForm1 = MultipartForm {
            if displayContentType {
                MultipartFormData(name: "name1", value: "Value 1", contentType: "application/content1")
            } else {
                MultipartFormData(name: "name1", value: "Value 1")
            }
        }
        let body1 = Body(builder: { multipartForm1 })
        let data1 = body1.body?.dataFunction("Boundary12345").flatMap { String(data: $0, encoding: .utf8) }
        XCTAssertEqual(data1, """
        --Boundary12345\r\nContent-Disposition: form-data; name="name1"\r\nContent-Type: application/content1\r\n\r\nValue 1\r\n--Boundary12345--\r\n
        """)
        
        displayContentType = false
        let multipartForm2 = MultipartForm {
            if displayContentType {
                MultipartFormData(name: "name1", value: "Value 1", contentType: "application/content1")
            } else {
                MultipartFormData(name: "name1", value: "Value 1")
            }
        }
        let body2 = Body(builder: { multipartForm2 })
        let data2 = body2.body?.dataFunction("Boundary12345").flatMap { String(data: $0, encoding: .utf8) }
        XCTAssertEqual(data2, """
        --Boundary12345\r\nContent-Disposition: form-data; name="name1"\r\n\r\nValue 1\r\n--Boundary12345--\r\n
        """)
    }
}

extension BodyTests {
    
    static var allTests = [
        ("testInitJson", testInitJson),
        ("testInitMultipart", testInitMultipart),
        ("testInitMultipartFile", testInitMultipartFile),
        ("testMultipartEither", testMultipartEither)
    ]
    
}
