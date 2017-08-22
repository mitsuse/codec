extension Int32: Codable {
    public static var decoder: Int32Decoder { return Int32Decoder() }
    public static var encoder: Int32Encoder { return Int32Encoder() }
}

public final class Int32Decoder: Decoder {
    init() {}

    public func decode(from reader: Reader) throws -> Int32 {
        var value: Int32 = 0
        let count = 4
        let bufferPointer = withUnsafeMutablePointer(to: &value) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeMutableBufferPointer(start: bytePointer, count: count)
            }
        }
        try reader.read(into: bufferPointer)
        return value
    }
}

public final class Int32Encoder: Encoder {
    init() {}

    public func encode(_ decoded: Int32, with writer: Writer) throws -> Void {
        var value = decoded
        let count = 4
        let bufferPointer = withUnsafePointer(to: &value) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeBufferPointer(start: bytePointer, count: count)
            }
        }
        try writer.write(bufferPointer)
    }
}
