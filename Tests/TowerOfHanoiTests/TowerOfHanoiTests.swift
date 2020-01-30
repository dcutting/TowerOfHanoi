import XCTest
import class Foundation.Bundle
import TowerOfHanoiLib

final class TowerOfHanoiTests: XCTestCase {
    
    func testZeroDiscs() {
        let actual = move(discs: 0, source: "A", target: "B", spare: "C")
        let expected: [(String, String)] = [
        ]
        XCTAssertTrue(equal(expected, actual))
    }
    
    func testOneDisc() {
        let actual = move(discs: 1, source: "A", target: "B", spare: "C")
        let expected = [
            ("A", "B")
        ]
        XCTAssertTrue(equal(expected, actual))
    }
    
    func testTwoDiscs() {
        let actual = move(discs: 2, source: "A", target: "B", spare: "C")
        let expected = [
            ("A", "C"),
            ("A", "B"),
            ("C", "B")
        ]
        XCTAssertTrue(equal(expected, actual))
    }

    func testThreeDiscs() {
        let actual = move(discs: 3, source: "A", target: "B", spare: "C")
        let expected = [
            ("A", "B"),
            ("A", "C"),
            ("B", "C"),
            ("A", "B"),
            ("C", "A"),
            ("C", "B"),
            ("A", "B")
        ]
        XCTAssertTrue(equal(expected, actual))
    }
    
    func testFourDiscs() {
        let actual = move(discs: 4, source: "A", target: "C", spare: "B")
        let expected = [
            ("A", "B"),
            ("A", "C"),
            ("B", "C"),
            ("A", "B"),
            ("C", "A"),
            ("C", "B"),
            ("A", "B"),
            ("A", "C"),
            ("B", "C"),
            ("B", "A"),
            ("C", "A"),
            ("B", "C"),
            ("A", "B"),
            ("A", "C"),
            ("B", "C")
        ]
        XCTAssertTrue(equal(expected, actual))
    }
    
    func equal(_ lhs: [(String, String)], _ rhs: [(String, String)]) -> Bool {
        guard lhs.count == rhs.count else { return false }
        guard !lhs.isEmpty else { return true }
        return lhs.enumerated().allSatisfy { i, x in rhs[i] == x }
    }
    
    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testZeroDiscs", testZeroDiscs),
        ("testOneDisc", testOneDisc),
        ("testTwoDiscs", testTwoDiscs),
        ("testThreeDiscs", testThreeDiscs),
        ("testFourDiscs", testFourDiscs),
    ]
}
