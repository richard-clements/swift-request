import XCTest
@testable import SwiftRequest

class SchemeTests: XCTestCase {
    
    func testInit() {
        let scheme = Scheme("scheme")
        XCTAssertEqual(scheme.scheme, "scheme")
        XCTAssertNil(scheme.url)
        XCTAssertNil(scheme.host)
        XCTAssertNil(scheme.port)
        XCTAssertNil(scheme.path)
        XCTAssertNil(scheme.method)
        XCTAssertNil(scheme.headers)
        XCTAssertNil(scheme.cachePolicy)
        XCTAssertNil(scheme.timeoutInterval)
        XCTAssertNil(scheme.query)
        XCTAssertNil(scheme.cachePolicy)
        XCTAssertNil(scheme.body)
        XCTAssertNil(scheme.bodyStream)
        XCTAssertNil(scheme.httpShouldHandleCookies)
        XCTAssertNil(scheme.httpShouldUsePipelining)
        XCTAssertNil(scheme.allowsCellularAccess)
        XCTAssertNil(scheme.allowsConstrainedNetworkAccess)
        XCTAssertNil(scheme.allowsExpensiveNetworkAccess)
        XCTAssertNil(scheme.networkServiceType)
    }
    
}

extension SchemeTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
