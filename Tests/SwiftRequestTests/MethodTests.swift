import XCTest
@testable import SwiftRequest

class MethodTests: XCTestCase {
    
    func testInit() {
        let verbs = [
            Method.Verb.get,
            Method.Verb.put,
            Method.Verb.patch,
            Method.Verb.post,
            Method.Verb.delete
        ]
        
        for verb in verbs {
            XCTAssertEqual(Method(verb).method, verb.rawValue)
            XCTAssertNil(Method(verb).host)
            XCTAssertNil(Method(verb).url)
            XCTAssertNil(Method(verb).scheme)
            XCTAssertNil(Method(verb).path)
            XCTAssertNil(Method(verb).headers)
            XCTAssertNil(Method(verb).cachePolicy)
            XCTAssertNil(Method(verb).timeoutInterval)
            XCTAssertNil(Method(verb).query)
            XCTAssertNil(Method(verb).cachePolicy)
            XCTAssertNil(Method(verb).body)
            XCTAssertNil(Method(verb).bodyStream)
            XCTAssertNil(Method(verb).httpShouldHandleCookies)
            XCTAssertNil(Method(verb).httpShouldUsePipelining)
            XCTAssertNil(Method(verb).allowsCellularAccess)
            XCTAssertNil(Method(verb).allowsConstrainedNetworkAccess)
            XCTAssertNil(Method(verb).allowsExpensiveNetworkAccess)
            XCTAssertNil(Method(verb).networkServiceType)
        }
    }
    
    func testVerbs() {
        XCTAssertEqual(Method(.get).rawValue, "GET")
        XCTAssertEqual(Method(.put).rawValue, "PUT")
        XCTAssertEqual(Method(.post).rawValue, "POST")
        XCTAssertEqual(Method(.patch).rawValue, "PATCH")
        XCTAssertEqual(Method(.delete).rawValue, "DELETE")
        XCTAssertEqual(Method(.connect).rawValue, "CONNECT")
        XCTAssertEqual(Method(.trace).rawValue, "TRACE")
        XCTAssertEqual(Method(.options).rawValue, "OPTIONS")
        XCTAssertEqual(Method(.head).rawValue, "HEAD")
    }
    
}

extension MethodTests {
    
    static var allTests = [
        ("testInit", testInit),
        ("testVerbs", testVerbs)
    ]
    
}
