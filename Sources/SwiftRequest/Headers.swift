import Foundation

extension Header.Name {
    public static let accept: Self = "Accept"
    public static let contentLength: Self = "Content-Length"
    public static let connection: Self = "Connection"
    public static let host: Self = "Host"
    public static let proxyAuthenticate: Self = "Proxy-Authenticate"
    public static let proxyAuthorization: Self = "Proxy-Authorization"
    public static let authorization: Self = "Authorization"
    public static let wwwAuthenticate: Self = "WWW-Authenticate"
    public static let ifMatch: Self = "If-Match"
    public static let ifNoneMatch: Self = "If-None-Match"
    public static let ifModifiedSince: Self = "If-Modified-Since"
    public static let ifUnmodifiedSince: Self = "If-Unmodified-Since"
    public static let expect: Self = "Expect"
    public static let contentType: Self = "Content-Type"
    public static let acceptRanges: Self = "Accept-Ranges"
    public static let range: Self = "Range"
    public static let ifRange: Self = "If-Range"
    public static let contentRange: Self = "Content-Range"
}

struct MimeType {
    public static let aacAudio = "audio/aac"
    public static let css = "text/css"
    public static let csv = "text/csv"
    public static let gzip = "application/gzip"
    public static let gif = "image/gif"
    public static let html = "text/html"
    public static let jpeg = "image/jpeg"
    public static let javascript = "text/javascript"
    public static let json = "application/json"
    public static let mp3Audio = "audio/mpeg"
    public static let mpegVideo = "video/mpeg"
    public static let oggAudio = "audio/ogg"
    public static let oggVideo = "video/ogg"
    public static let ogg = "application/ogg"
    public static let openTypeFont = "font/otf"
    public static let png = "image/png"
    public static let pdf = "application/pdf"
    public static let zip = "application/zip"
}

extension Header.Value {
    
    static func bearer(token: String) -> Self {
        Self("Bearer \(token)")
    }
    
    static func basicAuth(username: String, password: String) -> Self? {
        "\(username):\(password)"
            .data(using: .utf8)
            .map { $0.base64EncodedString() }
            .map { Self($0) }
    }
    
}
