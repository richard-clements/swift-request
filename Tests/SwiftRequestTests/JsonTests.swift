import XCTest
@testable import SwiftRequest

class JsonTests: XCTestCase {
    
    func testInitObject() {
        struct CodedObject: Encodable, Equatable {
            let value: Int
        }
        
        let object = CodedObject(value: 1)
        let json = Json(object)
        XCTAssertEqual(json.data, object)
    }
    
    func testInitJson() {
        let json = Json {
            [
                [
                    "key1": "value1",
                    "key2": "value2"
                ]
            ]
        }
        XCTAssertEqual(json.data, [
            [
                "key1": "value1",
                "key2": "value2",
            ]
        ])
    }
}

extension JsonTests {
    
    static var allTests = [
        ("testInitObject", testInitObject),
        ("testInitJson", testInitJson)
    ]
    
}
