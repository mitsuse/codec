import Result

public protocol Decoder {
    associatedtype DecodingError: Error
    associatedtype Decoded
    associatedtype Encoded

    func decode(from encoded: Encoded) -> Result<Decoded, DecodingError>
}

public protocol Decodable {
    associatedtype Decoder: Codec.Decoder

    static var decoder: Decoder { get }
}
