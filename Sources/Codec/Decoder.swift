public protocol Decoder {
    associatedtype Decoded
    associatedtype Encoded

    func decode(from encoded: Encoded) throws -> Decoded
}

public struct DecodingError<Decoded>: Error {
}
