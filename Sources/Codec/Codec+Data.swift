import Foundation

public typealias DataCodable = DataEncodable & DataDecodable

public protocol DataEncodable {
    associatedtype DataEncoder: Encoder where DataEncoder.Encoded == Data, DataEncoder.Decoded == Self

    static var dataEncoder: DataEncoder { get }
}

public protocol DataDecodable {
    associatedtype DataDecoder: Decoder where DataDecoder.Encoded == Data, DataDecoder.Decoded == Self

    static var dataDecoder: DataDecoder { get }
}

public func encode<Encodable: DataEncodable>(_ decoded: Encodable) -> Encodable.DataEncoder.Encoded {
    return Encodable.dataEncoder.encode(decoded)
}

public func decode<Decodable: DataDecodable>(from encoded: Decodable.DataDecoder.Encoded) throws -> Decodable {
    return try Decodable.dataDecoder.decode(from: encoded)
}
