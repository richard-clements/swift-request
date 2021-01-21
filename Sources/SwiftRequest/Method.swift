import Foundation

public struct Method {
    
    public struct Verb: ExpressibleByStringLiteral {
        public static let get: Self = "GET"
        public static let patch: Self = "PATCH"
        public static let post: Self = "POST"
        public static let put: Self = "PUT"
        public static let delete: Self = "DELETE"
        public static let head: Self = "HEAD"
        public static let options: Self = "OPTIONS"
        public static let connect: Self = "CONNECT"
        public static let trace: Self = "TRACE"
        
        let rawValue: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    let rawValue: String
    
    public init(_ rawValue: Verb) {
        self.rawValue = rawValue.rawValue
    }
}

extension Method: PartialRequest {
    
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
        rawValue
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
    
    public var httpShouldHandleCookies: Bool? {
        nil
    }
    
    public var httpShouldUsePipelining: Bool? {
        nil
    }
    
    public var allowsCellularAccess: Bool? {
        nil
    }
    
    public var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    public var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    public var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
}
