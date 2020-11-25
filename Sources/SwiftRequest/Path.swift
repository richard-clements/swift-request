import Foundation

struct Path: ExpressibleByStringLiteral {
    
    let rawValue: String
    
    init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }
    
}

@_functionBuilder struct PathBuilder {
    
    static func buildBlock(_ paths: Path...) -> [Path] {
        paths
    }
    
    static func buildBlock(_ path: Path) -> [Path] {
        [path]
    }
    
    static func buildIf(_ path: Path?) -> [Path] {
        path.map { [$0] } ?? []
    }
    
    
}

struct Paths {
    
    let items: [Path]
    
    init(_ paths: [Path]) {
        self.items = paths
    }
    
    init(@PathBuilder builder: () -> [Path]) {
        items = builder()
    }
}

extension Path: PartialRequest {
    
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
        "/" + rawValue
            .split(separator: "/")
            .filter { !$0.isEmpty }
            .joined(separator: "/")
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

extension Paths: PartialRequest {
    
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
        "/" + items
            .map { $0.rawValue.replacingOccurrences(of: "/", with: "") }
            .joined(separator: "/")
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
