import XCTest

import Codec

protocol Tests {
    static var allTests: [(String, (Self) -> () -> Void)] { get }
}

final class ArrayReader: Reader {
    private let array: [UInt8]
    private var offset = 0

    init(_ array: [UInt8]) {
        self.array = array
    }

    func read(into pointer: UnsafeMutableBufferPointer<UInt8>) throws -> Void {
        for current in offset..<pointer.count {
            pointer[current] = array[current]
        }
        offset += pointer.count
    }
}

final class ArrayWriter: Writer {
    public private(set) var array: [UInt8]

    init() {
        self.array = []
    }

    func write(_ pointer: UnsafeBufferPointer<UInt8>) throws -> Void {
        pointer.forEach { byte in
            self.array.append(byte)
        }
    }
}
