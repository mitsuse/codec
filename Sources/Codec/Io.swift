public protocol Reader: class {
    func read(into pointer: UnsafeMutablePointer<UInt8>, count: Int) throws -> Void
}

public protocol Writer: class {
    func write(_ pointer: UnsafePointer<UInt8>, count: Int) throws -> Void
}
