public protocol Decoder {
    associatedtype Decoded

    func decode(from reader: Reader) throws -> Decoded
}

public protocol Decodable {
    associatedtype Decoder: Codec.Decoder

    static var decoder: Decoder { get }
}

public func decode<Decodable>(_ reader: Reader) throws -> Decodable where Decodable: Codec.Decodable, Decodable.Decoder.Decoded == Decodable {
    return try Decodable.decoder.decode(from: reader)
}
