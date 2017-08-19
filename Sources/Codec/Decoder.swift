public protocol Decoder {
    associatedtype Decoded

    func decode(from reader: Reader) throws -> Decoded
}

public protocol Decodable {
    associatedtype Decoder: Codec.Decoder

    static var decoder: Decoder { get }
}
