//
//  OhMyVersion.swift
//  OhMyVersion
//
//  Created by wayne on 2017/12/8.
//  Copyright © 2017年 wayne. All rights reserved.
//

import Foundation

/// A custom operator. Press the key [Operation + 6] to use it.
prefix operator §

public prefix func § (right: String) -> Version {
    return Version(right)
}

public struct Version {
    
    /// The default separator of a version string.
    /// Such as "0.0.1", "1-2-3".
    private static let defaultSeparator: Character = "."
    
    /// Used to indicate a version number.
    public private(set) var string: String
    
    /// Initialize a Version object from a string. For example:
    ///
    ///     let version = Version("1.2.3")
    ///
    /// - Parameter string: A string representing a version number
    public init(_ string: String) {
        guard string.isEmpty == false else {
            fatalError("The string value must not be empty string.")
        }
        self.string = string
    }
    
    
    /// The separator used to split the version string. This value is read-only.
    /// It is obtained by traversing the version string returns the **first
    /// character which is not a number**. For example:
    ///
    ///     let version = §"1.2.3"
    ///     // separator is '.'
    ///
    ///     let version = §"1-2-3"
    ///     // separator is '-'
    ///
    /// Note: You should not use multiple types of separators in one version
    /// number string. For example:
    ///
    ///     let version = §"1.2-3"
    ///     // separator is '.'
    ///     // It works well, but don't do that. You may get a wrong result
    ///     // when comparing two versions.
    private var separator: Character {
        for character in string {
            if Int(String(character)) != nil {
                continue
            }
            
            return character
        }
        return Version.defaultSeparator
    }
    
    /// This property provides a list of split version numbers. This value is
    /// read-only. You can use it to get a version of the major version number,
    /// minor version and revision number, etc. Fot example:
    ///
    ///     let version = §"1.2.34"
    ///     print(version.numbers)
    ///     // Prints "[1, 2, 34]"
    ///
    ///     if let majorVersion = version.numbers.first {
    ///         // Do something here with majorVersion.
    ///     }
    public var numbers: [Int] {
        guard string.isEmpty == false else {
            return []
        }
        
        return string.split(separator: separator).map({ (substring) -> Int in
            return Int(substring)!
        })
    }
}


extension Version: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    public typealias UnicodeScalarLiteralType = String
    public typealias ExtendedGraphemeClusterLiteralType = String

    public init(stringLiteral value: String) {
        self.init(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}


// MARK: - Compare
extension Version : Comparable {
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 < v2)
    ///     // Prints "true".
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.3.1"
    ///     print(v1 < v2)
    ///     // Prints "true".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is lower than the right. Otherwise,
    ///   return false.
    public static func < (left: Version, right: Version) -> Bool {
        return left.numbers.lexicographicallyPrecedes(right.numbers)
    }
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    /// For example:
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 == v2)
    ///     // Prints "false".
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.3"
    ///     print(v1 == v2)
    ///     // Prints "true".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is equal to the right. Otherwise,
    ///   return false.
    public static func == (left: Version, right: Version) -> Bool {
        return left.numbers.elementsEqual(right.numbers)
    }
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    /// For example:
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 > v2)
    ///     // Prints "false".
    ///
    ///     let v1 = §"1.2.4"
    ///     let v2 = §"1.2.3"
    ///     print(v1 > v2)
    ///     // Prints "true".
    ///
    ///     let v1 = §"1.2.3.1"
    ///     let v2 = §"1.2.3"
    ///     print(v1 > v2)
    ///     // Prints "true".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is higher than the right. Otherwise,
    ///   return false.
    public static func > (left: Version, right: Version) -> Bool {
        return !(left == right) && !(left < right)
    }
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    /// For example:
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 >= v2)
    ///     // Prints "false".
    ///
    ///     let v1 = §"1.2.3.1"
    ///     let v2 = §"1.2.3"
    ///     print(v1 >= v2)
    ///     // Prints "true".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is higher than or equal to the right.
    ///   Otherwise, return false.
    public static func >= (left: Version, right: Version) -> Bool {
        return left > right || left == right
    }
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    /// For example:
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 <= v2)
    ///     // Prints "true".
    ///
    ///     let v1 = §"1.2.3.1"
    ///     let v2 = §"1.2.3"
    ///     print(v1 <= v2)
    ///     // Prints "false".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is lower than or equal to the right.
    ///   Otherwise, return false.
    public static func <= (left: Version, right: Version) -> Bool {
        return left < right || left == right
    }
    
    /// Compares the levels of both two versions.
    ///
    /// First, it compares the order of the first element(a number) in two arrays.
    /// These elements are of type `Int`. If the current element in left version is
    /// less than the element in right version，it means that the left version is
    /// lower than the right. If the current element in left version is greater than
    /// the element in right version, it means that the left version is higher than
    /// the right. Of course, we should comapre the second element of both version
    /// numbers when those two elements are equal, and so forth.
    ///
    /// Well, if you have traversed an array still did not get a result, you must
    /// compare the count of two arrays. The greater the count, the higher the version.
    /// For example:
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.4"
    ///     print(v1 != v2)
    ///     // Prints "true".
    ///
    ///     let v1 = §"1.2.3"
    ///     let v2 = §"1.2.3"
    ///     print(v1 != v2)
    ///     // Prints "false".
    ///
    /// - Parameters:
    ///   - left: A version
    ///   - right: Other version
    /// - Returns: Return true if the left version is not equal to the right. Otherwise,
    ///   return false.
    public static func != (left: Version, right: Version) -> Bool {
        return !(left == right)
    }
}



