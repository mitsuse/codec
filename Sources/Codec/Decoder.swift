import Result

public protocol Decoder {
    associatedtype DecodingError: Error
    associatedtype Decoded
    associatedtype Encoded

    func decode(from encoded: Encoded) -> Result<Decoded, DecodingError>
}
