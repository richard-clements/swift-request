import XCTest
@testable import SwiftRequest

class BodyStreamTests: XCTestCase {
    
    func testInit() {
        let inputStream = InputStream()
        let bodyStream = BodyStream(inputStream)
        
        XCTAssertEqual(bodyStream.bodyStream, inputStream)
        XCTAssertNil(bodyStream.url)
        XCTAssertNil(bodyStream.scheme)
        XCTAssertNil(bodyStream.host)
        XCTAssertNil(bodyStream.path)
        XCTAssertNil(bodyStream.method)
        XCTAssertNil(bodyStream.cachePolicy)
        XCTAssertNil(bodyStream.timeoutInterval)
        XCTAssertNil(bodyStream.query)
        XCTAssertNil(bodyStream.headers)
        XCTAssertNil(bodyStream.body)
        XCTAssertNil(bodyStream.httpShouldHandleCookies)
        XCTAssertNil(bodyStream.httpShouldUsePipelining)
        XCTAssertNil(bodyStream.allowsCellularAccess)
        XCTAssertNil(bodyStream.allowsConstrainedNetworkAccess)
        XCTAssertNil(bodyStream.allowsExpensiveNetworkAccess)
        XCTAssertNil(bodyStream.networkServiceType)
    }
    
}

extension BodyStreamTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
