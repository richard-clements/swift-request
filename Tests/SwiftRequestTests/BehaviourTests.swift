import XCTest
@testable import SwiftRequest

class BehaviourTests: XCTestCase {
    
    func testInit() {
        for flag in [true, false] {
            var behaviour = Behaviour(httpShouldHandleCookies: flag)
            XCTAssertEqual(behaviour.httpShouldHandleCookies, flag)
            XCTAssertNil(behaviour.httpShouldUsePipelining)
            XCTAssertNil(behaviour.allowsCellularAccess)
            XCTAssertNil(behaviour.allowsConstrainedNetworkAccess)
            XCTAssertNil(behaviour.allowsExpensiveNetworkAccess)
            
            behaviour = Behaviour(httpShouldUsePipelining: flag)
            XCTAssertEqual(behaviour.httpShouldUsePipelining, flag)
            XCTAssertNil(behaviour.httpShouldHandleCookies)
            XCTAssertNil(behaviour.allowsCellularAccess)
            XCTAssertNil(behaviour.allowsConstrainedNetworkAccess)
            XCTAssertNil(behaviour.allowsExpensiveNetworkAccess)
            
            behaviour = Behaviour(allowsCellularAccess: flag)
            XCTAssertEqual(behaviour.allowsCellularAccess, flag)
            XCTAssertNil(behaviour.httpShouldUsePipelining)
            XCTAssertNil(behaviour.httpShouldHandleCookies)
            XCTAssertNil(behaviour.allowsConstrainedNetworkAccess)
            XCTAssertNil(behaviour.allowsExpensiveNetworkAccess)
            
            behaviour = Behaviour(allowsConstrainedNetworkAccess: flag)
            XCTAssertEqual(behaviour.allowsConstrainedNetworkAccess, flag)
            XCTAssertNil(behaviour.httpShouldUsePipelining)
            XCTAssertNil(behaviour.allowsCellularAccess)
            XCTAssertNil(behaviour.httpShouldHandleCookies)
            XCTAssertNil(behaviour.allowsExpensiveNetworkAccess)
            
            behaviour = Behaviour(allowsExpensiveNetworkAccess: flag)
            XCTAssertEqual(behaviour.allowsExpensiveNetworkAccess, flag)
            XCTAssertNil(behaviour.httpShouldUsePipelining)
            XCTAssertNil(behaviour.allowsCellularAccess)
            XCTAssertNil(behaviour.allowsConstrainedNetworkAccess)
            XCTAssertNil(behaviour.httpShouldHandleCookies)
        }
        
        XCTAssertNil(Behaviour().url)
        XCTAssertNil(Behaviour().scheme)
        XCTAssertNil(Behaviour().host)
        XCTAssertNil(Behaviour().path)
        XCTAssertNil(Behaviour().method)
        XCTAssertNil(Behaviour().cachePolicy)
        XCTAssertNil(Behaviour().timeoutInterval)
        XCTAssertNil(Behaviour().query)
        XCTAssertNil(Behaviour().headers)
        XCTAssertNil(Behaviour().body)
        XCTAssertNil(Behaviour().bodyStream)
        XCTAssertNil(Behaviour().httpShouldHandleCookies)
        XCTAssertNil(Behaviour().httpShouldUsePipelining)
        XCTAssertNil(Behaviour().allowsCellularAccess)
        XCTAssertNil(Behaviour().allowsConstrainedNetworkAccess)
        XCTAssertNil(Behaviour().allowsExpensiveNetworkAccess)
        XCTAssertNil(Behaviour().networkServiceType)
    }
    
}

extension BehaviourTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
