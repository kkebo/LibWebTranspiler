import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LibWebTranspilerTests.allTests),
    ]
}
#endif
