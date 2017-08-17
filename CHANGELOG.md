## Unreleased

- Remove `Encodable` and `Decodable`.
    - These protocols prevent codec from supporting multiple format.


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
