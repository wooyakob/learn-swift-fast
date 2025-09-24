# mobile-dev

Swift 6.2 docs: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/aboutswift

- Variables are always initialized before use.
- Array indices are checked for out of bound errors.
- Integers are checked for overflow.
- Optionals ensure that nil values are handled explicitly.
- Memory is managed automatically.
- Error handling allows controlled recovery from unexpected failures.

The obvious way to write your code, should also perform the best.

Xcode 16.4
https://developer.apple.com/documentation/xcode-release-notes/xcode-16_4-release-notes
Includes SDK for iOS 18.5
Need to update to latest
Xcode 26
https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes
Includes Swift 6.2

- You don’t need to import a separate library for functionality like outputting text or handling strings
- Code written at global scope is used as the entry point for the program, so you don’t need a main() function
- You also don’t need to write semicolons at the end of every statement

run
swiftc hello.swift -o hello
./hello

or run without compiling
swift hello.swift

