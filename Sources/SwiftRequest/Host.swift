import Foundation

public struct Host {
    
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

extension Host: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
    }
    
    public var host: String? {
        rawValue.rawValue
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
    
    public var timeoutInterval: TimeInterval? {
        nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy? {
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
