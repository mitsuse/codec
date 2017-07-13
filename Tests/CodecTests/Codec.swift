import XCTest

protocol Tests {
    static var allTests: [(String, (Self) -> () -> Void)] { get }
}
