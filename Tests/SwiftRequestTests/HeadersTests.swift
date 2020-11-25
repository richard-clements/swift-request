import XCTest
@testable import SwiftRequest

class HeadersTests: XCTestCase {
    
    func testNames() {
        XCTAssertEqual(Header.Name.accept, "Accept")
        XCTAssertEqual(Header.Name.contentLength, "Content-Length")
        XCTAssertEqual(Header.Name.connection, "Connection")
        XCTAssertEqual(Header.Name.host, "Host")
        XCTAssertEqual(Header.Name.proxyAuthenticate, "Proxy-Authenticate")
        XCTAssertEqual(Header.Name.proxyAuthorization, "Proxy-Authorization")
        XCTAssertEqual(Header.Name.authorization, "Authorization")
        XCTAssertEqual(Header.Name.wwwAuthenticate, "WWW-Authenticate")
        XCTAssertEqual(Header.Name.ifMatch, "If-Match")
        XCTAssertEqual(Header.Name.ifNoneMatch, "If-None-Match")
        XCTAssertEqual(Header.Name.ifModifiedSince, "If-Modified-Since")
        XCTAssertEqual(Header.Name.ifUnmodifiedSince, "If-Unmodified-Since")
        XCTAssertEqual(Header.Name.expect, "Expect")
        XCTAssertEqual(Header.Name.contentType, "Content-Type")
        XCTAssertEqual(Header.Name.acceptRanges, "Accept-Ranges")
        XCTAssertEqual(Header.Name.range, "Range")
        XCTAssertEqual(Header.Name.ifRange, "If-Range")
        XCTAssertEqual(Header.Name.contentRange, "Content-Range")
    }
    
    func testMimes() {
        XCTAssertEqual(MimeType.aacAudio, "audio/aac")
        XCTAssertEqual(MimeType.css, "text/css")
        XCTAssertEqual(MimeType.csv, "text/csv")
        XCTAssertEqual(MimeType.gzip, "application/gzip")
        XCTAssertEqual(MimeType.gif, "image/gif")
        XCTAssertEqual(MimeType.html, "text/html")
        XCTAssertEqual(MimeType.jpeg, "image/jpeg")
        XCTAssertEqual(MimeType.javascript, "text/javascript")
        XCTAssertEqual(MimeType.json, "application/json")
        XCTAssertEqual(MimeType.mp3Audio, "audio/mpeg")
        XCTAssertEqual(MimeType.mpegVideo, "video/mpeg")
        XCTAssertEqual(MimeType.oggAudio, "audio/ogg")
        XCTAssertEqual(MimeType.oggVideo, "video/ogg")
        XCTAssertEqual(MimeType.ogg, "application/ogg")
        XCTAssertEqual(MimeType.openTypeFont, "font/otf")
        XCTAssertEqual(MimeType.png, "image/png")
        XCTAssertEqual(MimeType.pdf, "application/pdf")
        XCTAssertEqual(MimeType.zip, "application/zip")
        
    }
    
}

extension HeadersTests {
    
    static var allTests = [
        ("testNames", testNames),
        ("testMimes", testMimes)
    ]
    
}
