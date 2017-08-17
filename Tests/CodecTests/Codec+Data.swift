import XCTest

@testable import Codec

final class CodecDataTests: XCTestCase, Tests {
    func testCompileEncoding() {
        let _: Data = encode(Foo())
    }

    func testCompileDecoding() {
        let _: Foo = try! decode(from: Data())
    }

    static let allTests: [(String, (CodecDataTests) -> () -> Void)] = [
        ("testCompileEncoding", testCompileEncoding),
        ("testCompileDecoding", testCompileDecoding),
    ]
}

fileprivate struct Foo {}

extension Foo: DataCodable {
    static let dataEncoder = FooEncoder()
    static let dataDecoder = FooDecoder()
}

fileprivate struct FooEncoder: Codec.Encoder {
    func encode(_ foo: Foo) -> Data { return Data() }
}

fileprivate struct FooDecoder: Codec.Decoder {
    func decode(from data: Data) throws -> Foo { return Foo() }
}
