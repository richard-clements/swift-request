import XCTest
@testable import SwiftRequest

class RequestTests: XCTestCase {
    
    func testInitUrl() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(request.url?.absoluteString, "https://www.test.com")
    }
    
    func testInitHostAndScheme() {
        let request = URLRequest {
            Scheme("https")
            Host("www.test.com")
        }
        XCTAssertEqual(request.url?.absoluteString, "https://www.test.com")
    }
    
    func testInitHostAndSchemeWithPort() {
        let request = URLRequest {
            Scheme("https")
            Host("www.test.com")
            Port(8080)
        }
        XCTAssertEqual(request.url?.absoluteString, "https://www.test.com:8080")
    }
    
    func testPaths() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Paths {
                Path("path1")
                Path("path2")
                Path("path3")
            }
        }
        XCTAssertEqual(request.url?.path, "/path1/path2/path3")
    }
    
    func testPath() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Path("path1")
        }
        XCTAssertEqual(request.url?.path, "/path1")
    }
    
    func testQueries() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Queries {
                Query(name: "name1", value: "value1")
                Query(name: "name2", value: "value2")
                Query(name: "name3", value: "value3")
            }
        }
        XCTAssertEqual(request.url?.query, "name1=value1&name2=value2&name3=value3")
    }
    
    func testQuery() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Query(name: "name1", value: "value1")
            Query(name: "name2", value: "value2")
            Query(name: "name3", value: "value3")
        }
        XCTAssertEqual(request.url?.query, "name1=value1&name2=value2&name3=value3")
    }
    
    func testMethod() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.httpMethod, "GET")
        
        let getRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Method(.get)
        }
        XCTAssertEqual(getRequest.httpMethod, "GET")
        
        let postRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Method(.post)
        }
        XCTAssertEqual(postRequest.httpMethod, "POST")
        
        let putRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Method(.put)
        }
        XCTAssertEqual(putRequest.httpMethod, "PUT")
        
        let patchRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Method(.patch)
        }
        XCTAssertEqual(patchRequest.httpMethod, "PATCH")
        
        let deleteRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Method(.delete)
        }
        XCTAssertEqual(deleteRequest.httpMethod, "DELETE")
    }
    
    func testCachePolicy() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.cachePolicy, .useProtocolCachePolicy)
        
        let cachePolicyRequest = URLRequest {
            BaseUrl("https://www.test.com")
            CachePolicy(.returnCacheDataElseLoad)
        }
        XCTAssertEqual(cachePolicyRequest.cachePolicy, .returnCacheDataElseLoad)
    }
    
    func testHttpShouldUsePipelining() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.httpShouldUsePipelining, false)
        
        let trueRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldUsePipelining: true)
        }
        XCTAssertEqual(trueRequest.httpShouldUsePipelining, true)
        
        let falseRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldUsePipelining: false)
        }
        XCTAssertEqual(falseRequest.httpShouldUsePipelining, false)
    }
    
    func testHttpShouldHandleCookies() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.httpShouldHandleCookies, true)
        
        let trueRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldHandleCookies: true)
        }
        XCTAssertEqual(trueRequest.httpShouldHandleCookies, true)
        
        let falseRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(httpShouldHandleCookies: false)
        }
        XCTAssertEqual(falseRequest.httpShouldHandleCookies, false)
    }
    
    func testAllowsCellularAccess() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.allowsCellularAccess, true)
        
        let trueRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsCellularAccess: true)
        }
        XCTAssertEqual(trueRequest.allowsCellularAccess, true)
        
        let falseRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsCellularAccess: false)
        }
        XCTAssertEqual(falseRequest.allowsCellularAccess, false)
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    func testAllowsExpensiveNetworkAccess() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.allowsExpensiveNetworkAccess, true)
        
        let trueRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsExpensiveNetworkAccess: true)
        }
        XCTAssertEqual(trueRequest.allowsExpensiveNetworkAccess, true)
        
        let falseRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsExpensiveNetworkAccess: false)
        }
        XCTAssertEqual(falseRequest.allowsExpensiveNetworkAccess, false)
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    func testAllowsConstrainedNetworkAccess() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.allowsConstrainedNetworkAccess, true)
        
        let trueRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsConstrainedNetworkAccess: true)
        }
        XCTAssertEqual(trueRequest.allowsConstrainedNetworkAccess, true)
        
        let falseRequest = URLRequest {
            BaseUrl("https://www.test.com")
            Behaviour(allowsConstrainedNetworkAccess: false)
        }
        XCTAssertEqual(falseRequest.allowsConstrainedNetworkAccess, false)
    }
    
    func testNetworkServiceType() {
        let defaultRequest = URLRequest {
            BaseUrl("https://www.test.com")
        }
        XCTAssertEqual(defaultRequest.networkServiceType, .default)
        
        let serviceRequest = URLRequest {
            BaseUrl("https://www.test.com")
            ServiceType(.background)
        }
        XCTAssertEqual(serviceRequest.networkServiceType, .background)
    }
    
    func testHeaders() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Headers {
                Header(name: "Name-1", value: "Value 1")
                Header(name: "Name-2", value: "Value 2")
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-1"), "Value 1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-2"), "Value 2")
    }
    
    func testHeaders_NoReplace() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Headers {
                Header(name: "Name-1", value: "Value 1")
                Header(name: "Name-1", value: "Value 2")
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-1"), "Value 1,Value 2")
    }
    
    func testHeaders_Replace() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Headers {
                Header(name: "Name-1", value: "Value 1", shouldReplace: true)
                Header(name: "Name-1", value: "Value 2", shouldReplace: true)
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-1"), "Value 2")
    }
    
    func testHeader() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Name-1", value: "Value 1")
            Header(name: "Name-2", value: "Value 2")
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-1"), "Value 1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-2"), "Value 2")
    }
    
    func testInsertHeaders_Separated() {
        let request = URLRequest {
            Header(name: "Name-1", value: "Value 1")
            BaseUrl("https://www.test.com")
            Header(name: "Name-2", value: "Value 2")
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-1"), "Value 1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Name-2"), "Value 2")
    }
    
    func testMultipartFormHeader_AddsBoundary_IsUnique() {
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Content-Type", value: "multipart/form-data")
        }
        XCTAssertNotNil(request.value(forHTTPHeaderField: "Content-Type")?.range(of: #"multipart/form-data; boundary=?"#, options: .regularExpression))
        
        let request2 = URLRequest {
            BaseUrl("https://www.test.com")
            Header(name: "Content-Type", value: "multipart/form-data")
        }
        XCTAssertNotEqual(request.value(forHTTPHeaderField: "Content-Type"), request2.value(forHTTPHeaderField: "Content-Type"))
    }
    
    func testBodyStream() {
        let inputStream = InputStream()
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            BodyStream(inputStream)
        }
        XCTAssertEqual(request.httpBodyStream, inputStream)
    }
    
    func testBody() {
        let data = "Hello, World!".data(using: .utf8)!
        let body = Body(dataFunction: { (args: String...) in
            data
        })
        let request = URLRequest {
            BaseUrl("https://www.test.com")
            body
        }
        XCTAssertEqual(request.httpBody, body.dataFunction())
    }
    
    func testIf() {
        var showHeader = false
        var request = URLRequest {
            BaseUrl("https://www.test.com")
            if showHeader {
                Header(name: "name-1", value: "value 1")
            }
        }
        XCTAssertNil(request.value(forHTTPHeaderField: "name-1"))
        
        showHeader = true
        request = URLRequest {
            BaseUrl("https://www.test.com")
            if showHeader {
                Header(name: "name-1", value: "value 1")
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "name-1"), "value 1")
    }
    
    func testEither() {
        var toggle = true
        var request = URLRequest {
            BaseUrl("https://www.test.com")
            if toggle {
                Header(name: "toggle", value: "on")
            } else {
                Header(name: "toggle", value: "off")
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "toggle"), "on")
        
        toggle = false
        request = URLRequest {
            BaseUrl("https://www.test.com")
            if toggle {
                Header(name: "toggle", value: "on")
            } else {
                Header(name: "toggle", value: "off")
            }
        }
        XCTAssertEqual(request.value(forHTTPHeaderField: "toggle"), "off")
    }
}

extension RequestTests {
    
    static var nonConstrainedTests = [
        ("testInitUrl", testInitUrl),
        ("testInitHostAndScheme", testInitHostAndScheme),
        ("testPaths", testPaths),
        ("testPath", testPath),
        ("testQueries", testQueries),
        ("testQuery", testQuery),
        ("testMethod", testMethod),
        ("testCachePolicy", testCachePolicy),
        ("testHttpShouldUsePipelining", testHttpShouldUsePipelining),
        ("testHttpShouldHandleCookies", testHttpShouldHandleCookies),
        ("testAllowsCellularAccess", testAllowsCellularAccess),
        ("testNetworkServiceType", testNetworkServiceType),
        ("testHeaders", testHeaders),
        ("testHeaders_Replace", testHeaders_Replace),
        ("testHeaders_NoReplace", testHeaders_NoReplace),
        ("testHeader", testHeader),
        ("testInsertHeaders_Separated", testInsertHeaders_Separated),
        ("testMultipartFormHeader_AddsBoundary_IsUnique", testMultipartFormHeader_AddsBoundary_IsUnique),
        ("testBodyStream", testBodyStream),
        ("testBody", testBody),
        ("testIf", testIf),
        ("testEither", testEither)
    ]
    
    static var constrainedTests: [(String, (RequestTests) -> () -> ())] {
        if #available(iOS 13.0, tvOS 13.0, macCatalyst 13.0, watchOS 6.0, *) {
            return [
                ("testAllowsExpensiveNetworkAccess", testAllowsExpensiveNetworkAccess),
                ("testAllowsConstrainedNetworkAccess", testAllowsConstrainedNetworkAccess)
            ]
        }
        return []
    }
    
    static var allTests = nonConstrainedTests + constrainedTests
    
}
