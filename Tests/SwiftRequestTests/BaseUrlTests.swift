import XCTest
@testable import SwiftRequest

class BaseUrlTests: XCTestCase {
    
    func testInitUrl() {
        let url = URL(string: "https://www.google.com")!
        let baseUrl = BaseUrl(url)
        
        XCTAssertEqual(baseUrl.url, url)
        XCTAssertNil(baseUrl.scheme)
        XCTAssertNil(baseUrl.host)
        XCTAssertNil(baseUrl.path)
        XCTAssertNil(baseUrl.method)
        XCTAssertNil(baseUrl.cachePolicy)
        XCTAssertNil(baseUrl.timeoutInterval)
        XCTAssertNil(baseUrl.query)
        XCTAssertNil(baseUrl.headers)
        XCTAssertNil(baseUrl.body)
        XCTAssertNil(baseUrl.bodyStream)
        XCTAssertNil(baseUrl.httpShouldHandleCookies)
        XCTAssertNil(baseUrl.httpShouldUsePipelining)
        XCTAssertNil(baseUrl.allowsCellularAccess)
        XCTAssertNil(baseUrl.allowsConstrainedNetworkAccess)
        XCTAssertNil(baseUrl.allowsExpensiveNetworkAccess)
        XCTAssertNil(baseUrl.networkServiceType)
    }
    
    func testInitString() {
        let url = "https://www.google.com"
        let baseUrl = BaseUrl(url)
        
        XCTAssertEqual(baseUrl.url?.absoluteString, url)
        XCTAssertNil(baseUrl.scheme)
        XCTAssertNil(baseUrl.host)
        XCTAssertNil(baseUrl.path)
        XCTAssertNil(baseUrl.method)
        XCTAssertNil(baseUrl.cachePolicy)
        XCTAssertNil(baseUrl.timeoutInterval)
        XCTAssertNil(baseUrl.query)
        XCTAssertNil(baseUrl.headers)
        XCTAssertNil(baseUrl.body)
        XCTAssertNil(baseUrl.bodyStream)
        XCTAssertNil(baseUrl.httpShouldHandleCookies)
        XCTAssertNil(baseUrl.httpShouldUsePipelining)
        XCTAssertNil(baseUrl.allowsCellularAccess)
        XCTAssertNil(baseUrl.allowsConstrainedNetworkAccess)
        XCTAssertNil(baseUrl.allowsExpensiveNetworkAccess)
        XCTAssertNil(baseUrl.networkServiceType)
    }
    
}

extension BaseUrlTests {
    
    static var allTests = [
        ("testInitUrl", testInitUrl),
        ("testInitString", testInitString)
    ]
    
}
