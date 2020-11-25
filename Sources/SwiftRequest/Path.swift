import Foundation

public protocol PathProtocol {
    
    var items: [Path] { get }
    
}

public struct Path: ExpressibleByStringLiteral, Equatable {
    
    let rawValue: String
    
    public init(_ value: String) {
        self.rawValue = value
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }
    
}

extension Path: PathProtocol {
    
    public var items: [Path] {
        [self]
    }
    
}

@_functionBuilder public struct PathBuilder {
    
    public static func buildBlock(_ paths: PathProtocol...) -> PathProtocol {
        Paths(paths.flatMap { $0.items })
    }
    
    public static func buildBlock(_ path: PathProtocol) -> PathProtocol {
        Paths(path.items)
    }
    
    public static func buildIf(_ path: PathProtocol?) -> PathProtocol {
        path.map { Paths($0.items) } ?? Paths([])
    }
    
    
}

public struct Paths: PathProtocol, Equatable {
    
    public let items: [Path]
    
    init(_ paths: [Path]) {
        self.items = paths
    }
    
    public init(@PathBuilder builder: () -> PathProtocol) {
        self.init(builder().items)
    }
}

extension Path: PartialRequest {
    
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
        "/" + rawValue
            .split(separator: "/")
            .filter { !$0.isEmpty }
            .joined(separator: "/")
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

extension Paths: PartialRequest {
    
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
        "/" + items
            .flatMap {
                $0.rawValue
                    .split(separator: "/")
                    .filter { !$0.isEmpty }
            }
            .joined(separator: "/")
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
