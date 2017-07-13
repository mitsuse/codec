import Result

public protocol Decoder {
    associatedtype DecodingError: Error
    associatedtype Decoded
    associatedtype Encoded

    static func decode(from encoded: Encoded) -> Result<Decoded, DecodingError>
}

public protocol Encoder {
    associatedtype Decoded
    associatedtype Encoded

    static func encode(_ decoded: Decoded) -> Encoded
}
