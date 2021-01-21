import Foundation

public struct Behaviour {
    
    public let httpShouldHandleCookies: Bool?
    public let httpShouldUsePipelining: Bool?
    public let allowsCellularAccess: Bool?
    public let allowsConstrainedNetworkAccess: Bool?
    public let allowsExpensiveNetworkAccess: Bool?
    
    public init(httpShouldHandleCookies: Bool? = nil, httpShouldUsePipelining: Bool? = nil, allowsCellularAccess: Bool? = nil, allowsConstrainedNetworkAccess: Bool? = nil, allowsExpensiveNetworkAccess: Bool? = nil) {
        self.httpShouldHandleCookies = httpShouldHandleCookies
        self.httpShouldUsePipelining = httpShouldUsePipelining
        self.allowsCellularAccess = allowsCellularAccess
        self.allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess
        self.allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess
    }
    
}

extension Behaviour: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
    }
    
    public var host: String? {
        nil
    }
    
    public var port: Int? {
        nil
    }
    
    public var path: String? {
        nil
    }
    
    public var method: String? {
        nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    public var timeoutInterval: TimeInterval? {
        nil
    }
    
    public var query: [Query]? {
        nil
    }
    
    public var headers: [Header]? {
        nil
    }
    
    public var body: Body? {
        nil
    }
    
    public var bodyStream: InputStream? {
        nil
    }
    
    public var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
    
}
