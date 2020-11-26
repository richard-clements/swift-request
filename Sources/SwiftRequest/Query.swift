import Foundation

public protocol QueryProtocol {
    var items: [Query] { get }
}

public struct Query: Equatable {
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
        let rawValue: String
        
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

extension Query {
    
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

extension Query {
    
    public init(name: Name, values: Value...) {
        self.init(name: name, value: values.map { $0.rawValue }.joined(separator: ","))
    }
    
    public init(name: Name, values: [Value]) {
        self.init(name: name, value: values.map { $0.rawValue }.joined(separator: ","))
    }
    
    public init(name: String, values: Value...) {
        self.init(name: Name(name), values: values)
    }
    
    public init(name: Name, values: String...) {
        self.init(name: name, values: values.map { Value($0) })
    }
    
    public init(name: String, values: String...) {
        self.init(name: Name(name), values: values.map { Value($0) })
    }
    
    public init(name: String, values: [Value]) {
        self.init(name: Name(name), values: values)
    }
    
    public init(name: Name, values: [String]) {
        self.init(name: name, values: values.map { Value($0) })
    }
    
    public init(name: String, values: [String]) {
        self.init(name: Name(name), values: values.map { Value($0) })
    }
    
}

extension Query: QueryProtocol {
    
    public var items: [Query] {
        [self]
    }
    
}

public struct ListQuery: Equatable, QueryProtocol {
    
    public let items: [Query]
    
    public init(name: Query.Name, values: Query.Value...) {
        items = values.map { Query(name: name, value: $0)}
    }
    
    public init(name: String, values: Query.Value...) {
        self.init(name: Query.Name(name), values: values)
    }
    
    public init(name: String, values: String...) {
        self.init(name: Query.Name(name), values: values.map { Query.Value($0) })
    }
    
    public init(name: Query.Name, values: String...) {
        self.init(name: name, values: values.map { Query.Value($0) })
    }
    
    public init(name: Query.Name, values: [Query.Value]) {
        items = values.map { Query(name: name, value: $0) }
    }
    
    public init(name: String, values: [Query.Value]) {
        self.init(name: Query.Name(name), values: values)
    }
    
    public init(name: Query.Name, values: [String]) {
        self.init(name: name, values: values.map { Query.Value($0) })
    }
    
    public init(name: String, values: [String]) {
        self.init(name: Query.Name(name), values: values.map { Query.Value($0) })
    }
    
}

public struct Queries: Equatable, QueryProtocol {
    
    public let items: [Query]
    
    @_functionBuilder public struct QueryBuilder {
        public static func buildBlock(_ queries: QueryProtocol...) -> QueryProtocol {
            Queries(queries.flatMap { $0.items })
        }
        
        public static func buildBlock(_ query: QueryProtocol) -> QueryProtocol {
            Queries(query.items)
        }
        
        public static func buildIf(_ query: QueryProtocol?) -> QueryProtocol {
            query.map { Queries($0.items) } ?? Queries([])
        }
    }
    
    private init(_ queries: [Query]) {
        self.items = queries
    }
    
    public init(@QueryBuilder builder: () -> QueryProtocol) {
        self.init(builder().items)
    }
    
}

extension Query: PartialRequest {
    
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
        items
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

extension Queries: PartialRequest {
    
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
        items
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
