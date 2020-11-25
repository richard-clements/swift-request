import XCTest
@testable import SwiftRequest

class PathTests: XCTestCase {
    
    func testInit() {
        let path = Path("directory1/directory2//directory3")
        XCTAssertEqual(path.path, "/directory1/directory2/directory3")
        XCTAssertNil(path.host)
        XCTAssertNil(path.url)
        XCTAssertNil(path.scheme)
        XCTAssertNil(path.headers)
        XCTAssertNil(path.cachePolicy)
        XCTAssertNil(path.timeoutInterval)
        XCTAssertNil(path.query)
        XCTAssertNil(path.cachePolicy)
        XCTAssertNil(path.body)
        XCTAssertNil(path.bodyStream)
        XCTAssertNil(path.method)
        XCTAssertNil(path.httpShouldHandleCookies)
        XCTAssertNil(path.httpShouldUsePipelining)
        XCTAssertNil(path.allowsCellularAccess)
        XCTAssertNil(path.allowsConstrainedNetworkAccess)
        XCTAssertNil(path.allowsExpensiveNetworkAccess)
        XCTAssertNil(path.networkServiceType)
    }
    
    func testPaths() {
        let path = Paths {
            Path("directory1")
            Path("directory2")
            Path("directory3/directory4///")
        }
        XCTAssertEqual(path.path, "/directory1/directory2/directory3/directory4")
    }
    
}

extension PathTests {
    
    static var allTests = [
        ("testInit", testInit),
        ("testPaths", testPaths)
    ]
    
}
