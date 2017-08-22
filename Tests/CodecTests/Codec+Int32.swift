import XCTest

@testable import Codec

final class CodecInt32Tests: XCTestCase, Tests {
    func testEncodeAndDecode() {
        let x: Int32 = 128
        let writer = ArrayWriter()
        try! encode(x, with: writer)
        let reader = ArrayReader(writer.array)
        XCTAssertEqual(try! decode(reader), x)
    }

    static let allTests: [(String, (CodecInt32Tests) -> () -> Void)] = [
        ("testEncodeAndDecode", testEncodeAndDecode),
    ]
}
