import Foundation

struct Behaviour {
    
    let httpShouldHandleCookies: Bool?
    let httpShouldUsePipelining: Bool?
    let allowsCellularAccess: Bool?
    let allowsConstrainedNetworkAccess: Bool?
    let allowsExpensiveNetworkAccess: Bool?
    
    init(httpShouldHandleCookies: Bool? = nil, httpShouldUsePipelining: Bool? = nil, allowsCellularAccess: Bool? = nil, allowsConstrainedNetworkAccess: Bool? = nil, allowsExpensiveNetworkAccess: Bool? = nil) {
        self.httpShouldHandleCookies = httpShouldHandleCookies
        self.httpShouldUsePipelining = httpShouldUsePipelining
        self.allowsCellularAccess = allowsCellularAccess
        self.allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess
        self.allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess
    }
    
}

extension Behaviour: PartialRequest {
    
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
    
    var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
    
}
