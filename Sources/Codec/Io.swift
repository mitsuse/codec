public protocol Reader: class {
    func read(into pointer: UnsafeMutableBufferPointer<UInt8>) throws -> Void
}

public enum ReadingError: Error {
    case notPermitted
    case readAll
}

public protocol Writer: class {
    func write(_ pointer: UnsafeBufferPointer<UInt8>) throws -> Void
}

public enum WritingError: Error {
    case notPermitted
    case shortageOfSpace
}
