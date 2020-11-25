import Foundation

extension URLRequest {
    
    init(@RequestBuilder builder: () -> PartialRequest) throws {
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
            throw URLError(URLError.Code.badURL)
        }
        components.path = builtRequest.path ?? ""
        components.queryItems = builtRequest.query?.map { URLQueryItem(name: $0.name.rawValue, value: $0.value.rawValue) }
        
        guard let url = components.url else {
            throw URLError(URLError.Code.badURL)
        }
        
        let boundary = UUID().uuidString
        var request = URLRequest(url: url)
        request.httpMethod = builtRequest.method
        request.cachePolicy = builtRequest.cachePolicy ?? request.cachePolicy
        request.httpShouldUsePipelining = builtRequest.httpShouldUsePipelining ?? request.httpShouldUsePipelining
        request.httpShouldHandleCookies = builtRequest.httpShouldHandleCookies ?? request.httpShouldHandleCookies
        request.allowsCellularAccess = builtRequest.allowsCellularAccess ?? request.allowsCellularAccess
        request.networkServiceType = builtRequest.networkServiceType ?? request.networkServiceType
        if #available(OSX 10.15, *) {
            request.allowsExpensiveNetworkAccess = builtRequest.allowsExpensiveNetworkAccess ?? request.allowsExpensiveNetworkAccess
        }
        if #available(OSX 10.15, *) {
            request.allowsConstrainedNetworkAccess = builtRequest.allowsConstrainedNetworkAccess ?? request.allowsConstrainedNetworkAccess
        }
        builtRequest.headers?.forEach {
            if $0.name.rawValue.lowercased() == "content-type" && $0.value.rawValue.lowercased() == "multipart/form-data" {
                request.addValue($0.value.rawValue + "; boundary=\(boundary)", forHTTPHeaderField: $0.name.rawValue)
            } else {
                request.addValue($0.value.rawValue, forHTTPHeaderField: $0.name.rawValue)
            }
        }
        request.httpBody = builtRequest.body?.dataFunction(boundary)
        self = request
    }
    
}
