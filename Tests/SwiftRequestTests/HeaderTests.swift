import XCTest
@testable import SwiftRequest

class HeaderTests: XCTestCase {
    
    func testInit() {
        let headerName: Header.Name = "Name"
        let headerValue: Header.Value = "Value"
        let name = "Name"
        let value = "Value"
        
        var header = Header(name: headerName, value: headerValue)
        XCTAssertEqual(header.headers, [Header(name: "Name", value: "Value")])
        XCTAssertNil(header.url)
        XCTAssertNil(header.scheme)
        XCTAssertNil(header.host)
        XCTAssertNil(header.path)
        XCTAssertNil(header.method)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.timeoutInterval)
        XCTAssertNil(header.query)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.body)
        XCTAssertNil(header.bodyStream)
        XCTAssertNil(header.httpShouldHandleCookies)
        XCTAssertNil(header.httpShouldUsePipelining)
        XCTAssertNil(header.allowsCellularAccess)
        XCTAssertNil(header.allowsConstrainedNetworkAccess)
        XCTAssertNil(header.allowsExpensiveNetworkAccess)
        XCTAssertNil(header.networkServiceType)
        
        header = Header(name: name, value: value)
        XCTAssertEqual(header.headers, [Header(name: "Name", value: "Value")])
        XCTAssertNil(header.url)
        XCTAssertNil(header.scheme)
        XCTAssertNil(header.host)
        XCTAssertNil(header.path)
        XCTAssertNil(header.method)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.timeoutInterval)
        XCTAssertNil(header.query)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.body)
        XCTAssertNil(header.bodyStream)
        XCTAssertNil(header.httpShouldHandleCookies)
        XCTAssertNil(header.httpShouldUsePipelining)
        XCTAssertNil(header.allowsCellularAccess)
        XCTAssertNil(header.allowsConstrainedNetworkAccess)
        XCTAssertNil(header.allowsExpensiveNetworkAccess)
        XCTAssertNil(header.networkServiceType)
        
        header = Header(name: headerName, value: value)
        XCTAssertEqual(header.headers, [Header(name: "Name", value: "Value")])
        XCTAssertNil(header.url)
        XCTAssertNil(header.scheme)
        XCTAssertNil(header.host)
        XCTAssertNil(header.path)
        XCTAssertNil(header.method)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.timeoutInterval)
        XCTAssertNil(header.query)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.body)
        XCTAssertNil(header.bodyStream)
        XCTAssertNil(header.httpShouldHandleCookies)
        XCTAssertNil(header.httpShouldUsePipelining)
        XCTAssertNil(header.allowsCellularAccess)
        XCTAssertNil(header.allowsConstrainedNetworkAccess)
        XCTAssertNil(header.allowsExpensiveNetworkAccess)
        XCTAssertNil(header.networkServiceType)
        
        header = Header(name: name, value: headerValue)
        XCTAssertEqual(header.headers, [Header(name: "Name", value: "Value")])
        XCTAssertNil(header.url)
        XCTAssertNil(header.scheme)
        XCTAssertNil(header.host)
        XCTAssertNil(header.path)
        XCTAssertNil(header.method)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.timeoutInterval)
        XCTAssertNil(header.query)
        XCTAssertNil(header.cachePolicy)
        XCTAssertNil(header.body)
        XCTAssertNil(header.bodyStream)
        XCTAssertNil(header.httpShouldHandleCookies)
        XCTAssertNil(header.httpShouldUsePipelining)
        XCTAssertNil(header.allowsCellularAccess)
        XCTAssertNil(header.allowsConstrainedNetworkAccess)
        XCTAssertNil(header.allowsExpensiveNetworkAccess)
        XCTAssertNil(header.networkServiceType)
    }
    
    func testReplaceDefault() {
        let header = Header(name: "name", value: "value")
        XCTAssertFalse(header.shouldReplace)
    }
    
    func testReplaceTrue() {
        let header = Header(name: "name", value: "value", shouldReplace: true)
        XCTAssertTrue(header.shouldReplace)
    }
    
    func testReplaceFalse() {
        let header = Header(name: "name", value: "value", shouldReplace: false)
        XCTAssertFalse(header.shouldReplace)
    }
    
    func testInitHeaders() {
        let headers = Headers {
            Header(name: "Name", value: "Value")
        }
        XCTAssertEqual(headers.headers, [Header(name: "Name", value: "Value")])
        XCTAssertNil(headers.url)
        XCTAssertNil(headers.scheme)
        XCTAssertNil(headers.host)
        XCTAssertNil(headers.path)
        XCTAssertNil(headers.method)
        XCTAssertNil(headers.cachePolicy)
        XCTAssertNil(headers.timeoutInterval)
        XCTAssertNil(headers.query)
        XCTAssertNil(headers.cachePolicy)
        XCTAssertNil(headers.body)
        XCTAssertNil(headers.bodyStream)
        XCTAssertNil(headers.httpShouldHandleCookies)
        XCTAssertNil(headers.httpShouldUsePipelining)
        XCTAssertNil(headers.allowsCellularAccess)
        XCTAssertNil(headers.allowsConstrainedNetworkAccess)
        XCTAssertNil(headers.allowsExpensiveNetworkAccess)
        XCTAssertNil(headers.networkServiceType)
    }
    
    func testIf() {
        var someOptional: String?
        var headers = Headers {
            if let someOptional = someOptional {
                Header(name: "item1", value: someOptional)
            }
        }
        XCTAssertEqual(headers.items, [])
        
        someOptional = "someValue"
        headers = Headers {
            if let someOptional = someOptional {
                Header(name: "item1", value: someOptional)
            }
        }
        XCTAssertEqual(headers.items, [
            Header(name: "item1", value: "someValue")
        ])
    }
}

extension HeaderTests {
    
    static var allTests = [
        ("testInit", testInit),
        ("testInitHeaders", testInitHeaders),
        ("testReplaceDefault", testReplaceDefault),
        ("testReplaceTrue", testReplaceTrue),
        ("testReplaceFalse", testReplaceFalse),
        ("testIf", testIf)
    ]
    
}
