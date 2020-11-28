import Foundation
#if canImport(UniformTypeIdentifiers)
import UniformTypeIdentifiers
#endif

public protocol PartialFormData {
    var name: String { get }
    var value: Data? { get }
    var fileLocation: URL? { get }
    var contentType: MultipartForm.MimeType? { get }
    var transferEncoding: MultipartForm.TransferEncoding? { get }
    var children: [PartialFormData] { get }
}

public struct MultipartFormData: PartialFormData {
    
    public let name: String
    public let value: Data?
    public let fileLocation: URL? = nil
    public let contentType: MultipartForm.MimeType?
    public let transferEncoding: MultipartForm.TransferEncoding?
    
    public init(name: String, value: String, contentType: MultipartForm.MimeType? = nil, transferEncoding: MultipartForm.TransferEncoding? = nil) {
        self.name = name
        self.value = value.data(using: .utf8)!
        self.contentType = contentType
        self.transferEncoding = transferEncoding
    }
    
    public init(name: String, value: Data, contentType: MultipartForm.MimeType? = nil, transferEncoding: MultipartForm.TransferEncoding? = nil) {
        self.name = name
        self.value = value
        self.contentType = contentType
        self.transferEncoding = transferEncoding
    }
    
    public var children: [PartialFormData] {
        [self]
    }
}

public struct MultipartFormFile: PartialFormData {
    
    public let name: String
    public let value: Data? = nil
    public let fileLocation: URL?
    public let contentType: MultipartForm.MimeType?
    public let transferEncoding: MultipartForm.TransferEncoding?
    
    #if canImport(UniformTypeIdentifiers)
    public init(name: String, file: URL, contentType: MultipartForm.MimeType? = nil, transferEncoding: MultipartForm.TransferEncoding? = nil) {
        self.name = name
        self.fileLocation = file
        if let contentType = contentType {
            self.contentType = contentType
        } else if #available(iOS 14.0, macOS 11.0, tvOS 14.0, macCatalyst 14.0, watchOS 7.0, *) {
            self.contentType = UTType(filenameExtension: file.pathExtension)?
                .preferredMIMEType
                .map { MultipartForm.MimeType(stringLiteral: $0) }
        } else {
            self.contentType = nil
        }
        self.transferEncoding = transferEncoding
    }
    #else
    public init(name: String, file: URL, contentType: MultipartForm.MimeType? = nil, transferEncoding: MultipartForm.TransferEncoding? = nil) {
        self.name = name
        self.fileLocation = file
        if let contentType = contentType {
            self.contentType = contentType
        } else {
            self.contentType = nil
        }
        self.transferEncoding = transferEncoding
    }
    #endif
    
    public var children: [PartialFormData] {
        [self]
    }
    
}

struct CombinedRequestFormData: PartialFormData {
    
    let name: String = ""
    let value: Data? = nil
    let fileLocation: URL? = nil
    let contentType: MultipartForm.MimeType? = nil
    let transferEncoding: MultipartForm.TransferEncoding? = nil
    let children: [PartialFormData]
    
    init(children: [PartialFormData]) {
        self.children = children
    }
    
}

@_functionBuilder
public struct FormDataBuilder {
    
    public static func buildBlock(_ formData: PartialFormData...) -> PartialFormData {
        let allFormData = formData.flatMap { $0.children }
        return CombinedRequestFormData(children: allFormData)
    }
    
    public static func buildBlock(_ formData: PartialFormData) -> PartialFormData {
        return formData
    }
    
    public static func buildIf(_ formData: PartialFormData?) -> PartialFormData {
        formData.map { $0 } ?? CombinedRequestFormData(children: [])
    }
    
    public static func buildEither(first: PartialFormData) -> PartialFormData {
        first
    }
    
    public static func buildEither(second: PartialFormData) -> PartialFormData {
        second
    }
}

public struct MultipartForm {
    
    let children: [PartialFormData]
    
    public init(@FormDataBuilder builder: () -> PartialFormData) {
        self.children = builder().children
    }
}

extension MultipartForm {
    
    public struct MimeType: ExpressibleByStringLiteral, Equatable {
        fileprivate let rawValue: String
        
        public init(stringLiteral value: String) {
            self.rawValue = value
        }
    }
    
    public struct TransferEncoding: ExpressibleByStringLiteral, Equatable {
        fileprivate let rawValue: String
        
        public init(stringLiteral value: String) {
            self.rawValue = value
        }
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
        let lineBreak = "\r\n"
        let component = builder()
        self.init { (arguments: String...) in
            guard let boundary = arguments.first, !component.children.isEmpty else {
                return nil
            }
            
            func formPart(name: String, value: Data?, file: URL?, contentType: String?, transferEncoding: String?) -> Data {
                var metadata = ["Content-Disposition: form-data; name=\"\(name)\""]
                if let contentType = contentType {
                    metadata.append("Content-Type: \(contentType)")
                }
                if let transferEncoding = transferEncoding {
                    metadata.append("Content-Transfer-Encoding: \(transferEncoding)")
                }
                
                let metadataValue = metadata.joined(separator: lineBreak)
                var data = "--\(boundary)\(lineBreak)\(metadataValue)\(lineBreak)\(lineBreak)".data(using: .utf8)!
                if let transferValue = file.flatMap({ try? Data(contentsOf: $0) }) ?? value {
                    data.append(transferValue)
                }
                return data
            }
            
            var data = Data(
                component.children
                    .map { formPart(name: $0.name, value: $0.value, file: $0.fileLocation, contentType: $0.contentType?.rawValue, transferEncoding: $0.transferEncoding?.rawValue) }
                    .joined(separator: "\r\n".data(using: .utf8)!)
            )
            data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
            return data
        }
    }
    
    public init<T: Encodable>(builder: () -> Json<T>) {
        let component = builder()
        self.init { (args: String...) in
            try! JSONEncoder().encode(component.data)
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
