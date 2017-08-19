public protocol Encoder {
    associatedtype Decoded

    func encode(_ decoded: Decoded, with writer: Writer) throws -> Void
}

public protocol Encodable {
    associatedtype Encoder: Codec.Encoder

    static var encoder: Encoder { get }
}
