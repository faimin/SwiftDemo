//: Playground - noun: a place where people can play

import UIKit

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


///
class User {
    private var name = "private name"
}

extension User {
    var accessPrivate: String {
        return name
    }
}
