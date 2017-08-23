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

    func testEncodingErrorWithNotPermitted() {
        let x: Double = 3.14
        let writer = ErroneousWriter(.notPermitted)
        XCTAssertThrowsError(try encode(x, with: writer))
    }

    func testEncodingErrorWithShortageOfSpace() {
        let x: Double = 3.14
        let writer = ErroneousWriter(.shortageOfSpace)
        XCTAssertThrowsError(try encode(x, with: writer))
    }

    func testDecodingErrorWithNotPermitted() {
        let reader = ErroneousReader(.notPermitted)
        let f = { () throws -> Double in try decode(reader) }
        XCTAssertThrowsError(try f())
    }

    func testDecodingErrorWithReadAll() {
        let reader = ErroneousReader(.readAll)
        let f = { () throws -> Double in try decode(reader) }
        XCTAssertThrowsError(try f())
    }

    static let allTests: [(String, (CodecDoubleTests) -> () -> Void)] = [
        ("testEncodeAndDecode", testEncodeAndDecode),
        ("testEncodingErrorWithNotPermitted", testEncodingErrorWithNotPermitted),
        ("testEncodingErrorWithShortageOfSpace", testEncodingErrorWithShortageOfSpace),
        ("testDecodingErrorWithNotPermitted", testDecodingErrorWithNotPermitted),
        ("testDecodingErrorWithReadAll", testDecodingErrorWithReadAll),
    ]
}
