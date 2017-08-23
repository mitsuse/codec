extension Float: Codable {
    public static var decoder: FloatDecoder { return FloatDecoder() }
    public static var encoder: FloatEncoder { return FloatEncoder() }
}

public final class FloatDecoder: Decoder {
    init() {}

    public func decode(from reader: Reader) throws -> Float {
        var bitPattern: UInt32 = 0
        let count = 4
        let bufferPointer = withUnsafeMutablePointer(to: &bitPattern) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeMutableBufferPointer(start: bytePointer, count: count)
            }
        }
        do {
            try reader.read(into: bufferPointer)
        } catch ReadingError.notPermitted {
            throw DecodingError.notPermitted
        } catch ReadingError.readAll {
            throw DecodingError.readAll
        }
        return Float(bitPattern: bitPattern)
    }
}

public final class FloatEncoder: Encoder {
    init() {}

    public func encode(_ decoded: Float, with writer: Writer) throws -> Void {
        var bitPattern = decoded.bitPattern
        let count = 4
        let bufferPointer = withUnsafePointer(to: &bitPattern) { pointer in
            pointer.withMemoryRebound(to: UInt8.self, capacity: count) { bytePointer in
                UnsafeBufferPointer(start: bytePointer, count: count)
            }
        }
        do {
            try writer.write(bufferPointer)
        } catch WritingError.notPermitted {
            throw EncodingError.notPermitted
        } catch WritingError.shortageOfSpace {
            throw EncodingError.shortageOfSpace
        }
    }
}
