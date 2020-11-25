import Foundation

public struct Scheme {
    
    public struct Value: ExpressibleByStringLiteral {
        fileprivate let rawValue: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    private let rawValue: Value
    
    public init(_ rawValue: Value) {
        self.rawValue = rawValue
    }
    
}

extension Scheme.Value {
    public static let http: Self = "http"
    public static let https: Self = "https"
}

extension Scheme: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        rawValue.rawValue
    }
    
    public var host: String? {
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
