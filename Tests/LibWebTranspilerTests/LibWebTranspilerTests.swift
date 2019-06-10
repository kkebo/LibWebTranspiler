import XCTest
@testable import LibWebTranspiler

final class LibWebTranspilerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LibWebTranspiler().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
