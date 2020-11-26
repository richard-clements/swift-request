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
    
    func testCsvQuery_NameValues() {
        let query = Query(name: Query.Name("name1"), values: Query.Value("value1"), Query.Value("value2"))
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_NameStrings() {
        let query = Query(name: Query.Name("name1"), values: String("value1"), String("value2"))
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_StringValues() {
        let query = Query(name: String("name1"), values: Query.Value("value1"), Query.Value("value2"))
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_StringStrings() {
        let query = Query(name: String("name1"), values: String("value1"), String("value2"))
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_NameValuesList() {
        let query = Query(name: Query.Name("name1"), values: [Query.Value("value1"), Query.Value("value2")])
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_NameStringsList() {
        let query = Query(name: Query.Name("name1"), values: [String("value1"), String("value2")])
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_StringValuesList() {
        let query = Query(name: String("name1"), values: [Query.Value("value1"), Query.Value("value2")])
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testCsvQuery_StringStringsList() {
        let query = Query(name: String("name1"), values: [String("value1"), String("value2")])
        XCTAssertEqual(query, Query(name: "name1", value: "value1,value2"))
    }
    
    func testListQuery_NameValues() {
        let query = ListQuery(name: Query.Name("name1"), values: Query.Value("value1"), Query.Value("value2"))
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_StringValues() {
        let query = ListQuery(name: String("name1"), values: Query.Value("value1"), Query.Value("value2"))
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_NameStrings() {
        let query = ListQuery(name: Query.Name("name1"), values: String("value1"), String("value2"))
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_StringStrings() {
        let query = ListQuery(name: String("name1"), values: String("value1"), String("value2"))
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_NameValuesList() {
        let query = ListQuery(name: Query.Name("name1"), values: [Query.Value("value1"), Query.Value("value2")])
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_StringValuesList() {
        let query = ListQuery(name: String("name1"), values: [Query.Value("value1"), Query.Value("value2")])
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_NameStringsList() {
        let query = ListQuery(name: Query.Name("name1"), values: [String("value1"), String("value2")])
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testListQuery_StringStringsList() {
        let query = ListQuery(name: String("name1"), values: [String("value1"), String("value2")])
        XCTAssertEqual(query.items, [
            Query(name: "name1", value: "value1"),
            Query(name: "name1", value: "value2")
        ])
    }
    
    func testIf() {
        var someOptional: String?
        var queries = Queries {
            if let someOptional = someOptional {
                Query(name: "item1", value: someOptional)
            }
        }
        XCTAssertEqual(queries.items, [])
        
        someOptional = "someValue"
        queries = Queries {
            if let someOptional = someOptional {
                Query(name: "item1", value: someOptional)
            }
        }
        XCTAssertEqual(queries.items, [
            Query(name: "item1", value: "someValue")
        ])
    }
    
}

extension QueryTests {
    
    static var allTests = [
        ("testInit", testInit),
        ("testInitQueries", testInitQueries),
        ("testIf", testIf),
        ("testCsvQuery_NameValues", testCsvQuery_NameValues),
        ("testCsvQuery_NameStrings", testCsvQuery_NameStrings),
        ("testCsvQuery_StringValues", testCsvQuery_StringValues),
        ("testCsvQuery_StringStrings", testCsvQuery_StringStrings),
        ("testCsvQuery_NameValuesList", testCsvQuery_NameValuesList),
        ("testCsvQuery_NameStringsList", testCsvQuery_NameStringsList),
        ("testCsvQuery_StringValuesList", testCsvQuery_StringValuesList),
        ("testCsvQuery_StringStringsList", testCsvQuery_StringStringsList),
        ("testListQuery_NameValues", testListQuery_NameValues),
        ("testListQuery_StringValues", testListQuery_StringValues),
        ("testListQuery_NameStrings", testListQuery_NameStrings),
        ("testListQuery_StringStrings", testListQuery_StringStrings),
        ("testListQuery_NameValuesList", testListQuery_NameValuesList),
        ("testListQuery_StringValuesList", testListQuery_StringValuesList),
        ("testListQuery_NameStringsList", testListQuery_NameStringsList),
        ("testListQuery_StringStringsList", testListQuery_StringStringsList)
    ]
    
}
