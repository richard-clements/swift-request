import XCTest
@testable import SwiftRequest

class ServiceTypeTests: XCTestCase {
    
    func testInit() {
        var serviceTypes: [URLRequest.NetworkServiceType] = [
            .avStreaming,
            .background,
            .default,
            .responsiveAV,
            .responsiveData,
            .video,
            .voice,
        ]
        if #available(iOS 10.0, tvOS 10.0, macOS 10.12, macCatalyst 13.0, watchOS 3.0, *) {
            serviceTypes.append(.callSignaling)
        } else {
            serviceTypes.append(.voip)
        }
        
        for serviceType in serviceTypes {
            let service = ServiceType(serviceType)
            XCTAssertEqual(service.networkServiceType, serviceType)
            XCTAssertNil(service.url)
            XCTAssertNil(service.host)
            XCTAssertNil(service.port)
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
