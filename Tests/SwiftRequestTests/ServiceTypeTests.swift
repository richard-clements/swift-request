import XCTest
@testable import SwiftRequest

class ServiceTypeTests: XCTestCase {
    
    func testInit() {
        let serviceTypes: [URLRequest.NetworkServiceType] = [
            .avStreaming,
            .background,
            .callSignaling,
            .default,
            .responsiveAV,
            .responsiveData,
            .video,
            .voice,
        ]
        
        for serviceType in serviceTypes {
            let service = ServiceType(serviceType)
            XCTAssertEqual(service.networkServiceType, serviceType)
            XCTAssertNil(service.url)
            XCTAssertNil(service.host)
            XCTAssertNil(service.scheme)
            XCTAssertNil(service.path)
            XCTAssertNil(service.method)
            XCTAssertNil(service.headers)
            XCTAssertNil(service.cachePolicy)
            XCTAssertNil(service.timeoutInterval)
            XCTAssertNil(service.query)
            XCTAssertNil(service.cachePolicy)
            XCTAssertNil(service.body)
            XCTAssertNil(service.bodyStream)
            XCTAssertNil(service.httpShouldHandleCookies)
            XCTAssertNil(service.httpShouldUsePipelining)
            XCTAssertNil(service.allowsCellularAccess)
            XCTAssertNil(service.allowsConstrainedNetworkAccess)
            XCTAssertNil(service.allowsExpensiveNetworkAccess)
        }
    }
    
}

extension ServiceTypeTests {
    
    static var allTests = [
        ("testInit", testInit)
    ]
    
}
