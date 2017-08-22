import XCTest

@testable import CodecTests

XCTMain([
    testCase(CodecFloatTests.allTests),
    testCase(CodecDoubleTests.allTests),
    testCase(CodecInt32Tests.allTests),
])
