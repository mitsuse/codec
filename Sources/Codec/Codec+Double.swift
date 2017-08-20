extension Double: Codable {
    public static var decoder: DoubleDecoder { return DoubleDecoder() }
    public static var encoder: DoubleEncoder { return DoubleEncoder() }
}

public final class DoubleDecoder: Decoder {
    init() {}

    public func decode(from reader: Reader) throws -> Double {
        var bitPattern: UInt64 = 0
        let count = 8
        let bufferPointer = withUnsafeMutablePointer(to: &bitPattern) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeMutableBufferPointer(start: bytePointer, count: count)
            }
        }
        try reader.read(into: bufferPointer)
        return Double(bitPattern: bitPattern)
    }
}

public final class DoubleEncoder: Encoder {
    init() {}

    public func encode(_ decoded: Double, with writer: Writer) throws -> Void {
        var bitPattern = decoded.bitPattern
        let count = 8
        let bufferPointer = withUnsafePointer(to: &bitPattern) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeBufferPointer(start: bytePointer, count: count)
            }
        }
        try writer.write(bufferPointer)
    }
}
