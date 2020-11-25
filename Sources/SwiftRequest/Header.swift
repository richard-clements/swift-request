import Foundation

public struct Header: Equatable {
    public struct Name: ExpressibleByStringLiteral, Equatable {
        let rawValue: String
        
        public init(_ value: String) {
            self.rawValue = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    public struct Value: ExpressibleByStringLiteral, Equatable {
        let rawValue: StringLiteralType
        
        public init(_ value: String) {
            self.rawValue = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    let name: Name
    let value: Value
    
    public init(name: Name, value: Value) {
        self.name = name
        self.value = value
    }
}

extension Header {
    
    public init(name: String, value: String) {
        self.init(name: Name(name), value: Value(value))
    }
    
    public init(name: Name, value: String) {
        self.init(name: name, value: Value(value))
    }
    
    public init(name: String, value: Value) {
        self.init(name: Name(name), value: value)
    }
    
}

public struct Headers: Equatable {
    
    private let items: [Header]
    
    @_functionBuilder public struct HeaderBuilder {
        public static func buildBlock(_ headers: Header...) -> Headers {
            Headers(headers)
        }
        
        public static func buildBlock(_ header: Header) -> Headers {
            Headers([header])
        }
        
        public static func buildIf(_ header: Header?) -> Headers {
            if let header = header {
                return Headers([header])
            } else {
                return Headers([])
            }
        }
    }
    
    public init(_ headers: [Header]) {
        self.items = headers
    }
    
    public init(@HeaderBuilder builder: () -> Headers) {
        self = builder()
    }
    
}

extension Header: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
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
        [self]
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

extension Headers: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
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
        items
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
