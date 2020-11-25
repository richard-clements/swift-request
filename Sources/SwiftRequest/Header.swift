import Foundation

struct Header {
    struct Name: ExpressibleByStringLiteral {
        let rawValue: String
        
        init(_ value: String) {
            self.rawValue = value
        }
        
        init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    struct Value: ExpressibleByStringLiteral {
        let rawValue: StringLiteralType
        
        init(_ value: String) {
            self.rawValue = value
        }
        
        init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    let name: Name
    let value: Value
}

extension Header {
    
    init(name: String, value: String) {
        self.init(name: Name(name), value: Value(value))
    }
    
    init(name: Name, value: String) {
        self.init(name: name, value: Value(value))
    }
    
    init(name: String, value: Value) {
        self.init(name: Name(name), value: value)
    }
    
}

struct Headers {
    
    private let items: [Header]
    
    @_functionBuilder struct HeaderBuilder {
        static func buildBlock(_ headers: Header...) -> Headers {
            Headers(headers)
        }
        
        static func buildBlock(_ header: Header) -> Headers {
            Headers([header])
        }
        
        static func buildIf(_ header: Header?) -> Headers {
            if let header = header {
                return Headers([header])
            } else {
                return Headers([])
            }
        }
    }
    
    init(_ headers: [Header]) {
        self.items = headers
    }
    
    init(@HeaderBuilder builder: () -> Headers) {
        self = builder()
    }
    
}

extension Header: PartialRequest {
    
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
        [self]
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

extension Headers: PartialRequest {
    
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
        items
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
