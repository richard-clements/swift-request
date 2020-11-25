import XCTest
@testable import SwiftRequest

class RequestTests: XCTestCase {
    
    func testInitUrl() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(request?.url?.absoluteString, "https://www.test.com")
    }
    
    func testInitHostAndScheme() {
        let request = try? URLRequest {
            Scheme("https")
            Host("www.test.com")
        }
        XCTAssertEqual(request?.url?.absoluteString, "https://www.test.com")
    }
    
    func testInitWithBadUrl() {
        XCTAssertThrowsError(try URLRequest {
            BaseUrl("somepipes|pipe")
        })
    }
    
    func testInitWithoutHostSchemeOrUrl() {
        XCTAssertThrowsError(try URLRequest {})
    }
    
    func testPaths() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Paths {
                Path("path1")
                Path("path2")
                Path("path3")
            }
        }
        XCTAssertEqual(request?.url?.path, "/path1/path2/path3")
    }
    
    func testPath() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Path("path1")
        }
        XCTAssertEqual(request?.url?.path, "/path1")
    }
    
    func testQueries() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Queries {
                Query(name: "name1", value: "value1")
                Query(name: "name2", value: "value2")
                Query(name: "name3", value: "value3")
            }
        }
        XCTAssertEqual(request?.url?.query, "name1=value1&name2=value2&name3=value3")
    }
    
    func testQuery() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Query(name: "name1", value: "value1")
            Query(name: "name2", value: "value2")
            Query(name: "name3", value: "value3")
        }
        XCTAssertEqual(request?.url?.query, "name1=value1&name2=value2&name3=value3")
    }
    
    func testMethod() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.httpMethod, "GET")
        
        let getRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Method(.get)
        }
        XCTAssertEqual(getRequest?.httpMethod, "GET")
        
        let postRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Method(.post)
        }
        XCTAssertEqual(postRequest?.httpMethod, "POST")
        
        let putRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Method(.put)
        }
        XCTAssertEqual(putRequest?.httpMethod, "PUT")
        
        let patchRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Method(.patch)
        }
        XCTAssertEqual(patchRequest?.httpMethod, "PATCH")
        
        let deleteRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Method(.delete)
        }
        XCTAssertEqual(deleteRequest?.httpMethod, "DELETE")
    }
    
    func testCachePolicy() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.cachePolicy, .useProtocolCachePolicy)
        
        let cachePolicyRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            CachePolicy(.returnCacheDataElseLoad)
        }
        XCTAssertEqual(cachePolicyRequest?.cachePolicy, .returnCacheDataElseLoad)
    }
    
    func testHttpShouldUsePipelining() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.httpShouldUsePipelining, false)
        
        let trueRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldUsePipelining: true)
        }
        XCTAssertEqual(trueRequest?.httpShouldUsePipelining, true)
        
        let falseRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldUsePipelining: false)
        }
        XCTAssertEqual(falseRequest?.httpShouldUsePipelining, false)
    }
    
    func testHttpShouldHandleCookies() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.httpShouldHandleCookies, true)
        
        let trueRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldHandleCookies: true)
        }
        XCTAssertEqual(trueRequest?.httpShouldHandleCookies, true)
        
        let falseRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldHandleCookies: false)
        }
        XCTAssertEqual(falseRequest?.httpShouldHandleCookies, false)
    }
    
    func testAllowsCellularAccess() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.allowsCellularAccess, true)
        
        let trueRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsCellularAccess: true)
        }
        XCTAssertEqual(trueRequest?.allowsCellularAccess, true)
        
        let falseRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsCellularAccess: false)
        }
        XCTAssertEqual(falseRequest?.allowsCellularAccess, false)
    }
    
    func testAllowsExpensiveNetworkAccess() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.allowsExpensiveNetworkAccess, true)
        
        let trueRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsExpensiveNetworkAccess: true)
        }
        XCTAssertEqual(trueRequest?.allowsExpensiveNetworkAccess, true)
        
        let falseRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsExpensiveNetworkAccess: false)
        }
        XCTAssertEqual(falseRequest?.allowsExpensiveNetworkAccess, false)
    }
    
    func testAllowsConstrainedNetworkAccess() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.allowsConstrainedNetworkAccess, true)
        
        let trueRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsConstrainedNetworkAccess: true)
        }
        XCTAssertEqual(trueRequest?.allowsConstrainedNetworkAccess, true)
        
        let falseRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsConstrainedNetworkAccess: false)
        }
        XCTAssertEqual(falseRequest?.allowsConstrainedNetworkAccess, false)
    }
    
    func testNetworkServiceType() {
        let defaultRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest?.networkServiceType, .default)
        
        let serviceRequest = try? URLRequest {
            BaseUrl("https://www.test.com")
            ServiceType(.background)
        }
        XCTAssertEqual(serviceRequest?.networkServiceType, .background)
    }
    
    func testHeaders() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Headers {
                Header(name: "Name-1", value: "Value 1")
                Header(name: "Name-2", value: "Value 2")
            }
        }
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Name-1"), "Value 1")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Name-2"), "Value 2")
    }
    
    func testHeader() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Name-1", value: "Value 1")
            Header(name: "Name-2", value: "Value 2")
        }
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Name-1"), "Value 1")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Name-2"), "Value 2")
    }
    
    func testMultipartFormHeader_AddsBoundary_IsUnique() {
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Content-Type", value: "multipart/form-data")
        }
        XCTAssertNotNil(request?.value(forHTTPHeaderField: "Content-Type")?.range(of: #"multipart/form-data; boundary=?"#, options: .regularExpression))
        
        let request2 = try? URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Content-Type", value: "multipart/form-data")
        }
        XCTAssertNotEqual(request?.value(forHTTPHeaderField: "Content-Type"), request2?.value(forHTTPHeaderField: "Content-Type"))
    }
    
    func testBodyStream() {
        let inputStream = InputStream()
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            BodyStream(inputStream)
        }
        XCTAssertEqual(request?.httpBodyStream, inputStream)
    }
    
    func testBody() {
        let data = "Hello, World!".data(using: .utf8)!
        let body = Body(dataFunction: { (args: String...) in
            data
        })
        let request = try? URLRequest {
            BaseUrl("https://www.test.com")
            body
        }
        XCTAssertEqual(request?.httpBody, body.dataFunction())
    }
}

extension RequestTests {
    
    static var allTests = [
        ("testInitUrl", testInitUrl),
        ("testInitHostAndScheme", testInitHostAndScheme),
        ("testInitWithBadUrl", testInitWithBadUrl),
        ("testInitWithoutHostSchemeOrUrl", testInitWithoutHostSchemeOrUrl),
        ("testPaths", testPaths),
        ("testPath", testPath),
        ("testQueries", testQueries),
        ("testQuery", testQuery),
        ("testMethod", testMethod),
        ("testCachePolicy", testCachePolicy),
        ("testHttpShouldUsePipelining", testHttpShouldUsePipelining),
        ("testHttpShouldHandleCookies", testHttpShouldHandleCookies),
        ("testAllowsCellularAccess", testAllowsCellularAccess),
        ("testAllowsExpensiveNetworkAccess", testAllowsExpensiveNetworkAccess),
        ("testAllowsConstrainedNetworkAccess", testAllowsConstrainedNetworkAccess),
        ("testNetworkServiceType", testNetworkServiceType),
        ("testHeaders", testHeaders),
        ("testHeader", testHeader),
        ("testMultipartFormHeader_AddsBoundary_IsUnique", testMultipartFormHeader_AddsBoundary_IsUnique),
        ("testBodyStream", testBodyStream),
        ("testBody", testBody)
    ]
    
}
