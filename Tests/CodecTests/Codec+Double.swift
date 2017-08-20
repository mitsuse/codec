import XCTest

@testable import Codec

final class CodecDoubleTests: XCTestCase, Tests {
    func testEncodeAndDecode() {
        let x: Double = 3.14
        let writer = ArrayWriter()
        try! encode(x, with: writer)
        let reader = ArrayReader(writer.array)
        XCTAssertEqual(try! decode(reader), x)
    }

    static let allTests: [(String, (CodecDoubleTests) -> () -> Void)] = [
        ("testEncodeAndDecode", testEncodeAndDecode),
    ]
}
