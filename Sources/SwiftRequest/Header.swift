import Foundation

public protocol HeaderConvertible {
    var items: [Header] { get }
}

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
    
    public let name: Name
    public let value: Value
    public let shouldReplace: Bool
    
    public init(name: Name, value: Value, shouldReplace: Bool = false) {
        self.name = name
        self.value = value
        self.shouldReplace = shouldReplace
    }
}

extension Header {
    
    public init(name: String, value: String, shouldReplace: Bool = false) {
        self.init(name: Name(name), value: Value(value), shouldReplace: shouldReplace)
    }
    
    public init(name: Name, value: String, shouldReplace: Bool = false) {
        self.init(name: name, value: Value(value), shouldReplace: shouldReplace)
    }
    
    public init(name: String, value: Value, shouldReplace: Bool = false) {
        self.init(name: Name(name), value: value, shouldReplace: shouldReplace)
    }
    
}

extension Header: HeaderConvertible {
    
    public var items: [Header] {
        [self]
    }
    
}

public struct Headers: Equatable, HeaderConvertible {
    
    public let items: [Header]
    
    @_functionBuilder public struct HeaderBuilder {
        public static func buildBlock(_ headers: HeaderConvertible...) -> HeaderConvertible {
            Headers(headers.flatMap { $0.items })
        }
        
        public static func buildBlock(_ header: HeaderConvertible) -> HeaderConvertible {
            Headers(header.items)
        }
        
        public static func buildIf(_ header: HeaderConvertible?) -> HeaderConvertible {
            header.map { Headers($0.items) } ?? Headers([])
        }
        
        public static func buildEither(first: HeaderConvertible) -> HeaderConvertible {
            first
        }

        public static func buildEither(second: HeaderConvertible) -> HeaderConvertible {
            second
        }
    }
    
    private init(_ headers: [Header]) {
        self.items = headers
    }
    
    public init(@HeaderBuilder builder: () -> HeaderConvertible) {
        self.init(builder().items)
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
