import Foundation

public protocol PartialFormData {
    var name: String { get }
    var value: Data { get }
    var children: [PartialFormData]? { get }
}

public struct MultipartFormData: PartialFormData {
    
    public let name: String
    public let value: Data
    public let children: [PartialFormData]? = nil
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value.data(using: .utf8)!
    }
    
    public init(name: String, value: Data) {
        self.name = name
        self.value = value
    }
}

struct CombinedRequestFormData: PartialFormData {
    
    let name: String = ""
    let value: Data = Data()
    let children: [PartialFormData]?
    
    init(children: [PartialFormData]) {
        self.children = children
    }
    
}

@_functionBuilder
public struct FormDataBuilder {
    
    public static func buildBlock(_ formData: PartialFormData...) -> PartialFormData {
        let allFormData = formData.filter { $0.children == nil } + formData.compactMap { $0.children }.flatMap { $0 }
        return CombinedRequestFormData(children: allFormData)
    }
    
    public static func buildBlock(_ formData: PartialFormData) -> PartialFormData {
        return formData
    }
    
    public static func buildIf(_ formData: PartialFormData?) -> PartialFormData {
        if let formData = formData {
            return formData
        } else {
            return CombinedRequestFormData(children: [])
        }
    }
    
}

public struct MultipartForm: CustomStringConvertible {
    
    let children: [PartialFormData]
    
    public init(@FormDataBuilder builder: () -> PartialFormData) {
        let formData = builder()
        if formData.children == nil {
            children = [formData]
        } else {
            children = formData.children ?? []
        }
    }
    
    public var description: String {
        return children.map { "\($0.name): \($0.value)" }.joined(separator: "\n")
    }
}

public struct Json<T: Encodable> {
    
    let data: T
    
    public init(_ object: T) {
        self.data = object
    }
    
    public init(_ builder: () -> T) {
        self.data = builder()
    }
    
}

public struct Body {
    
    let dataFunction: (String...) -> Data?
    
}

extension Body {
    
    public init(builder: () -> MultipartForm) {
        let component = builder()
        self.init { (arguments: String...) in
            guard let boundary = arguments.first, !component.children.isEmpty else {
                return nil
            }
            
            func formPart(name: String, value: Data) -> Data {
                var data = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8)!
                data.append(value)
                return data
            }
            
            var data = Data(
                component.children
                    .map { formPart(name: $0.name, value: $0.value) }
                    .joined(separator: "\r\n".data(using: .utf8)!)
            )
            data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
            return data
        }
    }
    
    public init<T: Encodable>(builder: () -> Json<T>) {
        let component = builder()
        self.init { (args: String...) in
            (try? JSONEncoder().encode(component.data)) ?? Data()
        }
    }
    
}

extension Body: PartialRequest {
    
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
        nil
    }
    
    public var body: Body? {
        self
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
