public protocol Encoder {
    associatedtype Decoded

    func encode(_ decoded: Decoded, with writer: Writer) throws -> Void
}

public protocol Encodable {
    associatedtype Encoder: Codec.Encoder where Encoder.Decoded == Self

    static var encoder: Encoder { get }
}

public func encode<Encodable>(_ encodable: Encodable, with writer: Writer) throws -> Void where Encodable: Codec.Encodable {
    try Encodable.encoder.encode(encodable, with: writer)
}
