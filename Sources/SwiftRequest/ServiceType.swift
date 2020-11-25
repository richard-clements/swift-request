import Foundation

struct ServiceType {
    
    let service: URLRequest.NetworkServiceType?
    
    init(_ service: URLRequest.NetworkServiceType) {
        self.service = service
    }
    
}

extension ServiceType: PartialRequest {
    
    var url: URL? {
        nil
    }
    
    var scheme: String? {
        nil
    }
    
    var host: String? {
        nil
    }
    
    var path: String? {
        nil
    }
    
    var method: String? {
        nil
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    var timeoutInterval: TimeInterval? {
        nil
    }
    
    var query: [Query]? {
        nil
    }
    
    var headers: [Header]? {
        nil
    }
    
    var body: Body? {
        nil
    }
    
    var bodyStream: InputStream? {
        nil
    }
    
    var httpShouldHandleCookies: Bool? {
        nil
    }
    
    var httpShouldUsePipelining: Bool? {
        nil
    }
    
    var allowsCellularAccess: Bool? {
        nil
    }
    
    var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
    
}
