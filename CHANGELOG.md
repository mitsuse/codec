## Unreleased

- Decoding and encoding are processed via `Reader` and `Writer`.
    - This avoids copying and writing the result of encoding children on encoding the parent.


## 0.5.0

- Remove `Encodable` and `Decodable`.
    - These protocols prevent codec from supporting multiple format.
- Provide a typealias `Coder` for `Encoder` and `Decoder`.
- Throw `DecodingError<Decoded>` instead of using `Result`.
- Support serialization for `Foundation.Data`.
    - Add `DataEncodable` and `DataDecodable`.


## 0.4.0

- Migrate to Swift 4.
    - Remove support for CocoaPods temporarily.


## 0.3.0

- Support CocoaPods.


## 0.2.0

- Distinguish `Decodable` from `Decoder`. `decode(from:)` becomes instance method.
- Distinguish `Encodable` from `Encoder`. `encode(_:)` becomes instance method.


## 0.1.0

- Provide protocols for decoder and encoder.
