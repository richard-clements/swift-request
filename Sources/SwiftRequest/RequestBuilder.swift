import Foundation

public protocol PartialRequest {
    var url: URL? { get }
    var scheme: String? { get }
    var host: String? { get }
    var port: Int? { get }
    var path: String? { get }
    var method: String? { get }
    var cachePolicy: URLRequest.CachePolicy? { get }
    var timeoutInterval: TimeInterval? { get }
    var query: [Query]? { get }
    var headers: [Header]? { get }
    var body: Body? { get }
    var bodyStream: InputStream? { get }
    var httpShouldHandleCookies: Bool? { get }
    var httpShouldUsePipelining: Bool? { get }
    var allowsCellularAccess: Bool? { get }
    var allowsConstrainedNetworkAccess: Bool? { get }
    var allowsExpensiveNetworkAccess: Bool? { get }
    var networkServiceType: URLRequest.NetworkServiceType? { get }
}

struct EmptyRequest: PartialRequest {
    let url: URL? = nil
    let scheme: String? = nil
    let host: String? = nil
    let port: Int? = nil
    let path: String? = nil
    let method: String? = nil
    let cachePolicy: URLRequest.CachePolicy? = nil
    let timeoutInterval: TimeInterval? = nil
    let query: [Query]? = nil
    let headers: [Header]? = nil
    let body: Body? = nil
    let bodyStream: InputStream? = nil
    let httpShouldHandleCookies: Bool? = nil
    let httpShouldUsePipelining: Bool? = nil
    let allowsCellularAccess: Bool? = nil
    let allowsConstrainedNetworkAccess: Bool? = nil
    let allowsExpensiveNetworkAccess: Bool? = nil
    let networkServiceType: URLRequest.NetworkServiceType? = nil
}

struct FullRequest: PartialRequest {
    let url: URL?
    let scheme: String?
    let host: String?
    let port: Int?
    let path: String?
    let method: String?
    let cachePolicy: URLRequest.CachePolicy?
    let timeoutInterval: TimeInterval?
    let query: [Query]?
    let headers: [Header]?
    let body: Body?
    let bodyStream: InputStream?
    let httpShouldUsePipelining: Bool?
    let httpShouldHandleCookies: Bool?
    let allowsCellularAccess: Bool?
    let allowsConstrainedNetworkAccess: Bool?
    let allowsExpensiveNetworkAccess: Bool?
    let networkServiceType: URLRequest.NetworkServiceType?
}

extension Array where Element == PartialRequest {
    
    func reduce<S>(forKey key: KeyPath<PartialRequest, S?>) -> S? {
        reduce(nil) { result, request in
            result ?? request[keyPath: key]
        }
    }
    
    func cummulateReduce<S>(forKey key: KeyPath<PartialRequest, [S]?>) -> [S]? {
        reduce(nil) { result, request in
            if let result = result {
                return result + (request[keyPath: key] ?? [])
            }
            return request[keyPath: key]
        }
    }
    
}

@_functionBuilder public struct RequestBuilder {
    
    public static func buildBlock(_ partialRequest: PartialRequest...) -> PartialRequest {
        let url = partialRequest.reduce(forKey: \.url)
        let scheme = partialRequest.reduce(forKey: \.scheme)
        let host = partialRequest.reduce(forKey: \.host)
        let port = partialRequest.reduce(forKey: \.port)
        let path = partialRequest.reduce(forKey: \.path)
        let method = partialRequest.reduce(forKey: \.method)
        let cachePolicy = partialRequest.reduce(forKey: \.cachePolicy)
        let timeoutInterval = partialRequest.reduce(forKey: \.timeoutInterval)
        let query = partialRequest.cummulateReduce(forKey: \.query)
        let headers = partialRequest.cummulateReduce(forKey: \.headers)
        let body = partialRequest.reduce(forKey: \.body)
        let bodyStream = partialRequest.reduce(forKey: \.bodyStream)
        let httpShouldUsePipelining = partialRequest.reduce(forKey: \.httpShouldUsePipelining)
        let httpShouldHandleCookies = partialRequest.reduce(forKey: \.httpShouldHandleCookies)
        let allowsCellularAccess = partialRequest.reduce(forKey: \.allowsCellularAccess)
        let allowsConstrainedNetworkAccess = partialRequest.reduce(forKey: \.allowsConstrainedNetworkAccess)
        let allowsExpensiveNetworkAccess = partialRequest.reduce(forKey: \.allowsExpensiveNetworkAccess)
        let serviceType = partialRequest.reduce(forKey: \.networkServiceType)
        return FullRequest(url: url, scheme: scheme, host: host, port: port, path: path, method: method, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval, query: query, headers: headers, body: body, bodyStream: bodyStream, httpShouldUsePipelining: httpShouldUsePipelining, httpShouldHandleCookies: httpShouldHandleCookies, allowsCellularAccess: allowsCellularAccess, allowsConstrainedNetworkAccess: allowsConstrainedNetworkAccess, allowsExpensiveNetworkAccess: allowsExpensiveNetworkAccess, networkServiceType: serviceType)
    }
    
    public static func buildBlock(_ partialRequest: PartialRequest) -> PartialRequest {
        partialRequest
    }
    
    public static func buildIf(_ partialRequest: PartialRequest?) -> PartialRequest {
        partialRequest ?? EmptyRequest()
    }
    
    public static func buildEither(first: PartialRequest) -> PartialRequest {
        first
    }
    
    public static func buildEither(second: PartialRequest) -> PartialRequest {
        second
    }
    
}
