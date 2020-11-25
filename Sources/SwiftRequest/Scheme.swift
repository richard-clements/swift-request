import Foundation

struct Scheme {
    
    struct Value: ExpressibleByStringLiteral {
        fileprivate let rawValue: String
        
        init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    private let rawValue: Value
    
    init(_ rawValue: Value) {
        self.rawValue = rawValue
    }
    
}

extension Scheme.Value {
    static let http: Self = "http"
    static let https: Self = "https"
}

extension Scheme: PartialRequest {
    
    var url: URL? {
        nil
    }
    
    var scheme: String? {
        rawValue.rawValue
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
