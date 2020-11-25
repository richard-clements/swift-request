import XCTest
@testable import SwiftRequest

class HostTests: XCTestCase {
    
    func testInit() {
        let host = Host("host")
        XCTAssertEqual(host.host, "host")
        XCTAssertNil(host.url)
        XCTAssertNil(host.scheme)
        XCTAssertNil(host.path)
        XCTAssertNil(host.method)
        XCTAssertNil(host.headers)
        XCTAssertNil(host.cachePolicy)
        XCTAssertNil(host.timeoutInterval)
        XCTAssertNil(host.query)
        XCTAssertNil(host.cachePolicy)
        XCTAssertNil(host.body)
        XCTAssertNil(host.bodyStream)
        XCTAssertNil(host.httpShouldHandleCookies)
        XCTAssertNil(host.httpShouldUsePipelining)
        XCTAssertNil(host.allowsCellularAccess)
        XCTAssertNil(host.allowsConstrainedNetworkAccess)
        XCTAssertNil(host.allowsExpensiveNetworkAccess)
        XCTAssertNil(host.networkServiceType)
    }
    
}

extension HostTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
