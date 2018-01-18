# OhMyVersion
A better way to compare the version level.

![](https://img.shields.io/badge/License-MIT-0099ff.svg) 
![](https://img.shields.io/badge/Language-Swift4-ff69b4.svg) 
![](https://img.shields.io/badge/version-0.0.2-5cde45.svg)

# Usage
Here's a simple example for comparing two versions.


```swift
/* Tips: Press the key [option + 6] to type §. */

let v1 = §"2.3.4"
let v2: Version = "10.2.4"

if v2 > v1 {
    // Do something in a high version
} else {
    // Do other things
}
```


Enjoy it!

# Required
* Swift 4
* Xcode 9+
* iOS 8+


# Installation
## Cocoapods
```
platform :ios, '8.0'
use_frameworks!
pod 'OhMyVersion'
```

# License
All source code is licensed under the MIT License.


