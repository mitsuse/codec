import XCTest

@testable import Codec

final class CodecFloatTests: XCTestCase, Tests {
    func testEncodeAndDecode() {
        let x: Float = 3.14
        let writer = ArrayWriter()
        try! encode(x, with: writer)
        let reader = ArrayReader(writer.array)
        XCTAssertEqual(try! decode(reader), x)
    }

    static let allTests: [(String, (CodecFloatTests) -> () -> Void)] = [
        ("testEncodeAndDecode", testEncodeAndDecode),
    ]
}
