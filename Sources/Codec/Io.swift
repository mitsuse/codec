public protocol Reader: class {
    func read(into pointer: UnsafeMutableBufferPointer<UInt8>) throws -> Void
}

public protocol Writer: class {
    func write(_ pointer: UnsafeBufferPointer<UInt8>) throws -> Void
}
