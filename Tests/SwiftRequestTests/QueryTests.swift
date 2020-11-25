import XCTest
@testable import SwiftRequest

class QueryTests: XCTestCase {
    
    func testInit() {
        let queryName: Query.Name = "Name"
        let queryValue: Query.Value = "Value"
        let name = "Name"
        let value = "Value"
        
        var query = Query(name: queryName, value: queryValue)
        XCTAssertEqual(query.query, [Query(name: "Name", value: "Value")])
        XCTAssertNil(query.url)
        XCTAssertNil(query.scheme)
        XCTAssertNil(query.host)
        XCTAssertNil(query.path)
        XCTAssertNil(query.method)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.timeoutInterval)
        XCTAssertNil(query.headers)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.body)
        XCTAssertNil(query.bodyStream)
        XCTAssertNil(query.httpShouldHandleCookies)
        XCTAssertNil(query.httpShouldUsePipelining)
        XCTAssertNil(query.allowsCellularAccess)
        XCTAssertNil(query.allowsConstrainedNetworkAccess)
        XCTAssertNil(query.allowsExpensiveNetworkAccess)
        XCTAssertNil(query.networkServiceType)
        
        query = Query(name: name, value: value)
        XCTAssertEqual(query.query, [Query(name: "Name", value: "Value")])
        XCTAssertNil(query.url)
        XCTAssertNil(query.scheme)
        XCTAssertNil(query.host)
        XCTAssertNil(query.path)
        XCTAssertNil(query.method)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.timeoutInterval)
        XCTAssertNil(query.headers)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.body)
        XCTAssertNil(query.bodyStream)
        XCTAssertNil(query.httpShouldHandleCookies)
        XCTAssertNil(query.httpShouldUsePipelining)
        XCTAssertNil(query.allowsCellularAccess)
        XCTAssertNil(query.allowsConstrainedNetworkAccess)
        XCTAssertNil(query.allowsExpensiveNetworkAccess)
        XCTAssertNil(query.networkServiceType)
        
        query = Query(name: queryName, value: value)
        XCTAssertEqual(query.query, [Query(name: "Name", value: "Value")])
        XCTAssertNil(query.url)
        XCTAssertNil(query.scheme)
        XCTAssertNil(query.host)
        XCTAssertNil(query.path)
        XCTAssertNil(query.method)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.timeoutInterval)
        XCTAssertNil(query.headers)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.body)
        XCTAssertNil(query.bodyStream)
        XCTAssertNil(query.httpShouldHandleCookies)
        XCTAssertNil(query.httpShouldUsePipelining)
        XCTAssertNil(query.allowsCellularAccess)
        XCTAssertNil(query.allowsConstrainedNetworkAccess)
        XCTAssertNil(query.allowsExpensiveNetworkAccess)
        XCTAssertNil(query.networkServiceType)
        
        query = Query(name: name, value: queryValue)
        XCTAssertEqual(query.query, [Query(name: "Name", value: "Value")])
        XCTAssertNil(query.url)
        XCTAssertNil(query.scheme)
        XCTAssertNil(query.host)
        XCTAssertNil(query.path)
        XCTAssertNil(query.method)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.timeoutInterval)
        XCTAssertNil(query.headers)
        XCTAssertNil(query.cachePolicy)
        XCTAssertNil(query.body)
        XCTAssertNil(query.bodyStream)
        XCTAssertNil(query.httpShouldHandleCookies)
        XCTAssertNil(query.httpShouldUsePipelining)
        XCTAssertNil(query.allowsCellularAccess)
        XCTAssertNil(query.allowsConstrainedNetworkAccess)
        XCTAssertNil(query.allowsExpensiveNetworkAccess)
        XCTAssertNil(query.networkServiceType)
    }
    
    func testInitQueries() {
        let queries = Queries {
            Query(name: "Name", value: "Value")
        }
        XCTAssertEqual(queries.query, [Query(name: "Name", value: "Value")])
        XCTAssertNil(queries.url)
        XCTAssertNil(queries.scheme)
        XCTAssertNil(queries.host)
        XCTAssertNil(queries.path)
        XCTAssertNil(queries.method)
        XCTAssertNil(queries.cachePolicy)
        XCTAssertNil(queries.timeoutInterval)
        XCTAssertNil(queries.headers)
        XCTAssertNil(queries.cachePolicy)
        XCTAssertNil(queries.body)
        XCTAssertNil(queries.bodyStream)
        XCTAssertNil(queries.httpShouldHandleCookies)
        XCTAssertNil(queries.httpShouldUsePipelining)
        XCTAssertNil(queries.allowsCellularAccess)
        XCTAssertNil(queries.allowsConstrainedNetworkAccess)
        XCTAssertNil(queries.allowsExpensiveNetworkAccess)
        XCTAssertNil(queries.networkServiceType)
    }
    
}

extension QueryTests {
    
    static var allTests = [
        ("testInit", testInit),
        ("testInitQueries", testInitQueries)
    ]
    
}
