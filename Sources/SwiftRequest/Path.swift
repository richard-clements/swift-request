import Foundation

public struct Path: ExpressibleByStringLiteral {
    
    let rawValue: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }
    
}

@_functionBuilder public struct PathBuilder {
    
    public static func buildBlock(_ paths: Path...) -> [Path] {
        paths
    }
    
    public static func buildBlock(_ path: Path) -> [Path] {
        [path]
    }
    
    public static func buildIf(_ path: Path?) -> [Path] {
        path.map { [$0] } ?? []
    }
    
    
}

public struct Paths {
    
    let items: [Path]
    
    init(_ paths: [Path]) {
        self.items = paths
    }
    
    public init(@PathBuilder builder: () -> [Path]) {
        items = builder()
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
