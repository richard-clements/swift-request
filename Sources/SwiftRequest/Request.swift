import Foundation

extension URLRequest {
    
    public init(@RequestBuilder builder: () -> PartialRequest) {
        let builtRequest = builder()
        var components: URLComponents
        if let url = builtRequest.url, let cpts = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            components = cpts
        } else if let scheme = builtRequest.scheme,
                  let host = builtRequest.host {
            components = URLComponents()
            components.scheme = scheme
            components.host = host
        } else {
            components = URLComponents()
        }
        components.port = builtRequest.port
        components.path = builtRequest.path ?? ""
        components.queryItems = builtRequest.query?.map { URLQueryItem(name: $0.name.rawValue, value: $0.value?.rawValue) }
        let boundary = UUID().uuidString
        var request = URLRequest(url: components.url!)
        request.httpMethod = builtRequest.method
        request.cachePolicy = builtRequest.cachePolicy ?? request.cachePolicy
        request.httpShouldUsePipelining = builtRequest.httpShouldUsePipelining ?? request.httpShouldUsePipelining
        request.httpShouldHandleCookies = builtRequest.httpShouldHandleCookies ?? request.httpShouldHandleCookies
        request.allowsCellularAccess = builtRequest.allowsCellularAccess ?? request.allowsCellularAccess
        request.networkServiceType = builtRequest.networkServiceType ?? request.networkServiceType
        if #available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, macCatalyst 13.0, *) {
            request.allowsExpensiveNetworkAccess = builtRequest.allowsExpensiveNetworkAccess ?? request.allowsExpensiveNetworkAccess
        }
        if #available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, macCatalyst 13.0, *) {
            request.allowsConstrainedNetworkAccess = builtRequest.allowsConstrainedNetworkAccess ?? request.allowsConstrainedNetworkAccess
        }
        builtRequest.headers?.forEach {
            if $0.name.rawValue.lowercased() == "content-type" && $0.value.rawValue.lowercased() == "multipart/form-data" {
                request.addHeader(Header(name: $0.name, value: "\($0.value.rawValue); boundary=\(boundary)"))
            } else {
                request.addHeader($0)
            }
        }
        if let bodyStream = builtRequest.bodyStream {
            request.httpBodyStream = bodyStream
        } else if let body = builtRequest.body?.dataFunction(boundary) {
            request.httpBody = body
        }
        
        self = request
    }
    
    mutating func addHeader(_ header: Header) {
        if header.shouldReplace {
            setValue(header.value.rawValue, forHTTPHeaderField: header.name.rawValue)
        } else {
            addValue(header.value.rawValue, forHTTPHeaderField: header.name.rawValue)
        }
    }
    
}
