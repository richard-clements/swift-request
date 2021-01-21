import XCTest
@testable import SwiftRequest

class TimeoutPolicyTests: XCTestCase {
    
    func testInit() {
        let timeout = TimeoutPolicy(23)
        XCTAssertEqual(timeout.timeoutInterval, 23)
        XCTAssertNil(timeout.url)
        XCTAssertNil(timeout.host)
        XCTAssertNil(timeout.port)
        XCTAssertNil(timeout.scheme)
        XCTAssertNil(timeout.path)
        XCTAssertNil(timeout.method)
        XCTAssertNil(timeout.headers)
        XCTAssertNil(timeout.cachePolicy)
        XCTAssertNil(timeout.query)
        XCTAssertNil(timeout.cachePolicy)
        XCTAssertNil(timeout.body)
        XCTAssertNil(timeout.bodyStream)
        XCTAssertNil(timeout.httpShouldHandleCookies)
        XCTAssertNil(timeout.httpShouldUsePipelining)
        XCTAssertNil(timeout.allowsCellularAccess)
        XCTAssertNil(timeout.allowsConstrainedNetworkAccess)
        XCTAssertNil(timeout.allowsExpensiveNetworkAccess)
        XCTAssertNil(timeout.networkServiceType)
    }
    
}

extension TimeoutPolicyTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
