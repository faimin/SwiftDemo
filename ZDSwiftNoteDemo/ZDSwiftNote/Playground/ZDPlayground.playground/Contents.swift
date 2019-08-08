//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

/// Array是struct类型，即值类型。class是引用类型
/// 值类型会自动执行 copy 操作
var arr = [0, 0, 0]
let newArr = arr
arr[0] = 1
print(arr)
print(newArr)
let createArray: Array = [Any](repeatElement("10", count: 5))
/// 获取实例的类型
//3.0 之前的方法：arr.dynamicType
let _type = type(of: arr)
let name = String(describing: UIView())


let myView = UIView()
myView.backgroundColor = UIColor.brown
myView.frame = CGRect.zero
myView.frame = CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0)

let superView = UIView()
superView.backgroundColor = UIColor.red
superView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
superView.addSubview(myView)

// 求和闭包
let sum: (Int, Int) -> (Int) = {
    $0 + $1
}
let calculateSUM = sum(10, 11)
print(calculateSUM)

// 字符串
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers[5...] // instead of numbers[5..<numbers.endIndex]

// Swift 4 可以把字符串写在一对 """ 中，这样字符串就可以写成多行。
_ = """
    This is a multi-line string.
    You don't have to escape "quotes" in here.
    String interpolation works as expected: 2 + 3 = \(2 + 3)
    The position of the closing delimiter
    controls whitespace stripping.
"""

// 当然，也可以使用 \ 来转义换行
_ = """
    To omit a line break, \
    add a backslash at the end of a line.
"""

let values = "one,two,three..."
var i = values.startIndex
while let comma = values[i...].firstIndex(of: ",") {
    if values[i..<comma] == "two" {
        print("\nfind it!\n")
    }
    i = values.index(after: comma)
}

//MARK: - 字典
typealias Name = (firstName: String, lastName: String) // 元组
let names: [Name] = [("Bart", "den Hollander"), ("A", "B"), ("C", "D")]
names.forEach { (nameTuple) in
    print(nameTuple.firstName)
    let (first, last) = nameTuple
    print(first, last)
}

//MARK: - 扩展
class User {
    private var name = "private name"
}

extension User {
    var accessPrivate: String {
        return name
    }
}


//MARK: - 操作符
// http://ios.jobbole.com/92852/
@discardableResult
postfix func ++(x: inout Int) -> Int {
    defer {
        x += 1
    }
    return x
}

@discardableResult
prefix func ++(x: inout Int) -> Int {
    x += 1
    return x
}

var i1 = 2, i2 = 2
let j1 = i1++
let j2 = ++i2

//MARK: - 处理空值
// https://useyourloaf.com/blog/swift-non-nil-values-in-an-array-of-optionals/
let scores = [1, 5, 8, 10, nil, 7]
for score in scores.compactMap({$0}) {
    print(score)
}
for case .some(let score) in scores {
    print(score)
}
for case let score? in scores {
    print(score)
}
for case let score? in scores where score > 5 {
    print(score)
}

//MARK: - URL Extension
extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
let url: URL = "www.google.com"

//https://developer.apple.com/documentation/swift/2885064-type
let typeValue = type(of: url)
print("\(typeValue)")

//https://www.objc.io/blog/2019/01/22/non-empty-optionals/
extension Optional where Wrapped: Collection {
    var nonEmpty: Wrapped? {
        return self?.isEmpty == true ? nil : self
    }
}


//MARK: - 测试1
protocol Drawing {
    func render()
    func circle()
}

extension Drawing {
    func circle() {
        print("protocol")
    }
    func render() {
        circle()
    }
}

class SVG: Drawing {
    func circle() {
        print("class")
        print("svg = ", Unmanaged.passRetained(self).toOpaque())
    }
}

SVG().render() // output is `protocol` or `class`

//MARK: - 测试2
var dictWithNils: [String: Int?] = [
    "one": 1,
    "two": 2,
    "none": nil
]

print(dictWithNils.count)
dictWithNils["two"] = nil
dictWithNils["none"] = nil
print(dictWithNils.count) // output is `1`


