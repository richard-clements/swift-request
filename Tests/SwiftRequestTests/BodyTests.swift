import XCTest
@testable import SwiftRequest

class BodyTests: XCTestCase {
    
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
            MultipartFormData(name: "name1", value: "Value 1")
            MultipartFormData(name: "name2", value: "Value 2")
        }
        let body = Body(builder: { multipartForm })
        
        XCTAssertNil(body.body?.dataFunction())
        
        let data = body.body?.dataFunction("Boundary12345").flatMap { String(data: $0, encoding: .utf8) }
        XCTAssertEqual(data, """
        --Boundary12345\r\nContent-Disposition: form-data; name="name1"\r\n\r\nValue 1\r\n--Boundary12345\r\nContent-Disposition: form-data; name="name2"\r\n\r\nValue 2\r\n--Boundary12345--\r\n
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
}

extension BodyTests {
    
    static var allTests = [
        ("testInitJson", testInitJson),
        ("testInitMultipart", testInitMultipart)
    ]
    
}
