import XCTest
@testable import SwiftRequest

class MultipartFormTests: XCTestCase {
    
    func testInitString() {
        let formData = MultipartFormData(name: "name", value: "Value")
        XCTAssertEqual(formData.name, "name")
        XCTAssertEqual(formData.value, "Value".data(using: .utf8)!)
    }
    
    func testInitData() {
        var value: Int = 8
        let data = withUnsafeBytes(of: &value) { Data($0) }
        let formData = MultipartFormData(name: "name", value: data)
        XCTAssertEqual(formData.name, "name")
        XCTAssertEqual(formData.value, data)
    }
    
    func testMultipart() {
        let form = MultipartForm {
            MultipartFormData(name: "name", value: "Value")
            MultipartFormData(name: "name2", value: "Value 2")
        }
        XCTAssertEqual(form.children.count, 2)
        XCTAssertEqual(form.children[0].name, "name")
        XCTAssertEqual(form.children[1].name, "name2")
    }
    
    func testIf() {
        var addPart = false
        var form = MultipartForm {
            if addPart {
                MultipartFormData(name: "name", value: "Value")
            }
        }
        XCTAssertTrue(form.children.isEmpty)
        
        addPart = true
        form = MultipartForm {
            if addPart {
                MultipartFormData(name: "name", value: "Value")
            }
        }
        XCTAssertEqual(form.children.count, 1)
        XCTAssertEqual(form.children[0].name, "name")
    }
    
    #if canImport(UniformTypeIdentifiers)
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, macCatalyst 14.0, watchOS 7.0, *)
    func testContentTypeAuto() {
        let file = URL(string: "file://somefile/path.mp3")!
        let part = MultipartFormFile(name: "name", file: file)
        XCTAssertEqual(part.contentType, "audio/mpeg")
    }
    #endif
}

extension MultipartFormTests {
    
    static var nonConstrainedTests = [
        ("testInitString", testInitString),
        ("testInitData", testInitData),
        ("testMultipart", testMultipart),
        ("testIf", testIf),
    ]
    
    static var constrainedTests: [(String, (MultipartFormTests) -> () -> ())] {
        #if canImport(UniformTypeIdentifiers)
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, macCatalyst 14.0, watchOS 7.0, *) {
            return [("testContentTypeAuto", testContentTypeAuto)]
        } else {
            return []
        }
        #else
        return []
        #endif
    }
    
    static var allTests = nonConstrainedTests + constrainedTests
}
