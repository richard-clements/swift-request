import XCTest
@testable import SwiftRequest

final class SwiftRequestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftRequest().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
