# OhMyVersion
A better way to compare the version level.

![](https://img.shields.io/badge/License-MIT-0099ff.svg) ![](https://img.shields.io/badge/Language-Swift-ff69b4.svg) ![](https://img.shields.io/badge/version-0.0.1-5cde45.svg)

# Usage
Here's a simple example for comparing two versions.

```swift
let v1 = Version("2.3.4")
let v2 = Version("10.2.4")

if v2 > v1 {
    // Do something in a high version
} else {
    // Do other things
}

```

Well, We may determine whether the system version number is greater than or equal to the specified version. Like this:

```swift
// Old way.
if Double(UIDevice.current.systemVersion)! > 10.3 {
    // Works on iOS 11 and higher system.
} else {
    // Works on iOS 10 and older system.
}

// Or we can judge according to the specific method or some class.
if NSClassFromString("UIVisualEffect") != nil {
    // Works on iOS 8 and higher system.
} else {
    // Works on iOS 7 and older system.
}

```

It's not good for us. We now have a better way to do that 😀.

```swift
// New way.
if UIDevice.current.systemVersion >= "11.0.0".version {
    // Works on iOS 11 and higher system.
} else {
    // Works on iOS 10 and older system.
}

```

# License
All source code is licensed under the MIT License.


