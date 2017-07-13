public protocol Encoder {
    associatedtype Decoded
    associatedtype Encoded

    func encode(_ decoded: Decoded) -> Encoded
}

public protocol Encodable {
    associatedtype Encoder: Codec.Encoder

    static var encoder: Encoder { get }
}
