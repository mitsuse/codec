public protocol Encoder {
    associatedtype Decoded
    associatedtype Encoded

    func encode(_ decoded: Decoded) -> Encoded
}
