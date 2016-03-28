//
//  ViewController.swift
//  Swift1
//
//  Created by 符现超 on 15/10/13.
//  Copyright © 2015年 Zero.D.Saber. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupButton()
        
        stringStudy()
        
        arrayAndDictionaryStudy()
        
        oerators()
        
        let personCount = someFunction1(allPerson: 100, total: "人")//someFunction1(100, secondParamterName: "人")
        print(personCount)
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -- UI lifecycle
    func setupButton() {
        let button: UIButton = UIButton(type: .ContactAdd)
        button.frame = CGRect(x: 10, y: 150, width: 100, height: 30) 
        button.setTitle("跳转", forState: .Normal)
        button.addTarget(self, action: #selector(ViewController.pushToNextController(_:)), forControlEvents: .TouchUpInside)
        //button.addTarget(self, action: Selector("pushToNextController:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    func pushToNextController(button: UIButton) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
///////////=================================================
    
    //MARK:String字符串
    func stringStudy() {
#if false
        var implicitInteger = 26
        let implicit = 23
        //加法运算符也可用于String的拼接：
        let str = "hello, " + "world"  // 等于 "hello, world"
        print(str.characters.count)
        
        let label = "hello"
        let width = 94
        let widthLabel = String(width) + label
        implicitInteger = 33
        let appleSummary = "I have \(implicitInteger + implicit) apples."
        print(widthLabel, appleSummary)
        
        if label.isEmpty {
            print("label 为空")
        }
        
        //字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        // 打印输出："Cat!🐱"
    
        //使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
        let indexString = "I am fuxianchao, hello everyone!"
        let a = indexString[indexString.startIndex]
        let b = indexString[indexString.endIndex.predecessor()] //前一个
        let c = indexString[indexString.startIndex.successor()] //后一个
        let d = indexString[indexString.startIndex.advancedBy(3)] //指定位置的字符,输出m
        for index in indexString.characters.indices {
            //print("\(indexString[index])")
            //Swift默认是打印一次换一下行的,设置terminator参数后,会按照设置的terminator来进行拼接
            print("\(indexString[index])", terminator:"")
            //print("\(indexString[index])", separator: "fu", terminator: "")
        }
#else
    // 等价于oc中的NSStringFromClass
    let className = String(UIViewController)
    print(className)
#endif
        
    }

    //MARK:Array && Dictionary字典和数组
    func arrayAndDictionaryStudy() {
        _ = ["0", "1", "2", "3", "4"]
        var shoppingListDic: Dictionary? = ["count" : 10]

        let option: String? = "hello"
        let optionName: String? = nil//"John Appleseed"
        var greenting = "1314"
        //optionName = nil时,此行判断不成立,进入else
        if let name = optionName {
            greenting = "hello,\(name)"
            print(greenting)
        }
        else {
            greenting = "hello,\(option)"
            print(greenting)
        }
        
    }
    
    //MARK:运算符
    func oerators() {
        //http://www.tuicool.com/articles/2u2Qzu2
        var str1: String
        var str2: String?
        str1 = str2 ?? "ios"
        //等价于
        str1 = (str2 != nil) ? str2! : "swift"
        
        var i = 1
        for _ in 1...10 {
            print(i++)
        }
    }
    
    //MARK:方法
    //方法与函数的区别： 方法是与某些特定类型相关联的函数。即方法就是函数，只是这个函数与某个类型相关联罢了
    
    ///如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名
    ///方法默认只为第一个参数设置了局部参数名，没有外部参数名，所以在调用此方法时时看不到第一个参数的外部参数名的
    ///所以要想让调用者显示外部参数名，需要在前面添加名称，如果不需要外部参数名，只需在第二个及以后参数名前添加"_"
    func someFunction1(allPerson firstParameterName: Int, total secondParamterName: String) -> String{
        return String(firstParameterName) + secondParamterName
    }
    
    ///如果你不想为第二个及后续的参数设置外部参数名，用一个下划线（_）代替一个明确的参数名。
    ///PS:因为第一个参数默认忽略其外部参数名称，显式地写下划线是多余的
    func someFunction2(firstParameterName: Int, _ secondParameterName: Int) {
        // function body goes here
        // firstParameterName and secondParameterName refer to
        // the argument values for the first and second parameters
    }
    
    ///someInt 和 anotherInt 在传入 swapTwoInts(_:_:) 函数前，都加了 & 的前缀
    ///你只能传递变量给输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。
    func swapTwoInts(inout a: Int, inout _ b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
    
    //MARK:闭包
    func block() {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reverd = names.sort({(s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        
    }
    
    
    
}


//MARK:Global Function

struct Vector2D {
    var x = 0.0, y = 0.0
}

///运算符函数: 必须设置成全局的函数
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}














