import XCTest
@testable import SwiftRequest

class CachePolicyTests: XCTestCase {
    
    func testInit() {
        let policies = [
            URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData,
            URLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            URLRequest.CachePolicy.reloadRevalidatingCacheData,
            URLRequest.CachePolicy.returnCacheDataDontLoad,
            URLRequest.CachePolicy.returnCacheDataElseLoad,
            URLRequest.CachePolicy.useProtocolCachePolicy,
        ]
        
        for policy in policies {
            XCTAssertEqual(CachePolicy(policy).cachePolicy, policy)
            XCTAssertNil(CachePolicy(policy).url)
            XCTAssertNil(CachePolicy(policy).scheme)
            XCTAssertNil(CachePolicy(policy).host)
            XCTAssertNil(CachePolicy(policy).path)
            XCTAssertNil(CachePolicy(policy).method)
            XCTAssertNil(CachePolicy(policy).timeoutInterval)
            XCTAssertNil(CachePolicy(policy).query)
            XCTAssertNil(CachePolicy(policy).headers)
            XCTAssertNil(CachePolicy(policy).body)
            XCTAssertNil(CachePolicy(policy).bodyStream)
            XCTAssertNil(CachePolicy(policy).httpShouldHandleCookies)
            XCTAssertNil(CachePolicy(policy).httpShouldUsePipelining)
            XCTAssertNil(CachePolicy(policy).allowsCellularAccess)
            XCTAssertNil(CachePolicy(policy).allowsConstrainedNetworkAccess)
            XCTAssertNil(CachePolicy(policy).allowsExpensiveNetworkAccess)
            XCTAssertNil(CachePolicy(policy).networkServiceType)
        }
    }
    
}

extension CachePolicyTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
