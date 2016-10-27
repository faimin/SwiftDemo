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


