//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// Array是struct类型，即值类型。class是引用类型
var arr = [0, 0, 0]
var newArr = arr
arr[0] = 1
print(arr)
print(newArr)

let myView = UIView()
myView.backgroundColor = UIColor.brownColor()
myView.frame = CGRect.zero
myView.frame = CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0)
