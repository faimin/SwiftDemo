//
//  ViewController.swift
//  ZDSwiftNote
//
//  Created by Zero.D.Saber on 2016/10/27.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

import UIKit
import Foundation

// http://swift.gg/2016/04/20/selector-and-the-responder-chain/
private extension Selector {
    static let pushToNextVC = #selector(FirstViewController.pushToNextController(button:))
}

class FirstViewController: UIViewController {
    
    deinit {
        print("析构函数")
    }
    
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
        swapTwoInts(a: &someInt, b: &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -- UI LifeCycle
    // 正确设置frame： http://swift.gg/2016/06/16/swift-cgrect-cgsize-cgpoint/
    func setupButton() {
        let button: UIButton = UIButton(type: .contactAdd)
        button.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        button.setTitle("跳转", for: .normal)
        //button.addTarget(self, action: Selector("pushToNextController:"), forControlEvents: .TouchUpInside)
        //button.addTarget(self, action: #selector(ViewController.pushToNextController(button:)), for: .touchUpInside)
        button.addTarget(self, action: .pushToNextVC, for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func pushToNextController(button: UIButton) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
///////////=================================================
    //MARK: 打印类型
    private func printType(_ value: Any) {
        let typeName = type(of: value)
        print(typeName)
    }
    
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
    let className = String(describing: UIViewController())
    print(className)
#endif
        
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
        
        let values = "one, two, three..."
        var i = values.startIndex
        while let comma = values[i...].index(of: ",") {
            if values[i..<comma] == "two" {
                print("find it!")
            }
            i = values.index(after: comma)
        }
    }

    //MARK:Array && Dictionary字典和数组
    func arrayAndDictionaryStudy() {
        _ = ["0", "1", "2", "3", "4"]
        //var shoppingListDic: Dictionary = ["count" : 10]
        _ = ["count" : 10]

        let option: String? = "hello"
        let optionName: String? = nil//"John Appleseed"
        var greenting = "1314"
        //optionName = nil时,此行判断不成立,进入else
        if let name = optionName {
            greenting = "hello,\(name)"
            print(greenting)
        }
        else {
            //greenting = "hello,\(option)" // warning
            // 以下为消除警告的解决办法
            // 前2种是Xcode提示的修复方法，第三种来自网络
            //greenting = "hello,\(String(describing: option))"
            //greenting = "hello,\(option ?? "默认值")"
            greenting = "hello, \(option as String?)"
            print(greenting)
        }
        
        /// 在swift3之前，数值或者结构体类型可以用`AnyObject`接收，它会把数值了类型给包装成对象类型
        /// 但是从swift3开始，这样写会出现编译错误，swift应该是不帮我们做这些处理了，需要我们把泛型类型改成`Any`；
        /** 错误写法：
         var mutArr = [AnyObject]()
        */
        var mutArr = [Any]()
        mutArr.append(2)
        
    }
    
    //MARK:运算符
    /// 运算符
    func oerators() {
        // http://www.tuicool.com/articles/2u2Qzu2
        var str1: String
        var str2: String?
        str1 = str2 ?? "ios"
        //等价于
        str1 = (str2 != nil) ? str2! : "swift"
        
        let i = 1
        for _ in 1...10 {
            print(i+1)
        }
    }
    
    
    //MARK:方法
    //方法与函数的区别：方法是与某些特定类型相关联的函数。即方法就是函数，只是这个函数与某个类型相关联罢了
    
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
    func swapTwoInts( a: inout Int, b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
    //MARK: 泛型
    //打印数组中的元素(不用判断其中的元素类型)
    func printElementFromArray<T>(arr: [T]) {
        for element in arr {
            print(element)
        }
    }
    
    
    //MARK:闭包
    /// 语法：
    /// { (parameters) -> returnType in
    ///    statements
    /// }
    ///
    /// 参数和返回值都写在大括号内。函数体部分由关键字 `in` 引入
    ///
    /// ps.如果可变参数不放在参数列表的最后一位的话，调用闭包时编译器将报错.
    /// 
    /// 所有的类型都可以被正确推断时，返回箭头（->）和参数外边的括号可以被省略:
    /// reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
    ///
    /// 単表达式闭包隐式返回，可以通过省略`return`关键字来隐式返回単表达式的结果:
    /// reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
    ///
    /// 参数名称可以缩写为$0,$1,$2...当在闭包表达式中使用参数名称缩写时，可以在闭包定义中省略参数列表，
    /// in 关键字同样可以省略:
    /// reversedName = names.sorted(by: {$0 > $1})
    ///
    /// 运算符方法:
    /// reversedName = names.sorted(by: >)
    ///
    ///
    /// 将一个闭包标记为 @escaping 意味着你必须在闭包中显示的引用`self`
    ///
    ///
    func block() {
        /// 排序
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        //1 完整闭包语法
        /**
         闭包的函数体部分由关键字`in`引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
        { (parameters) -> returnType in
            statements //函数体
        }
        */
        _ = names.sorted(by: {(s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        //2 所有的类型都可以被正确推断时，返回箭头（->）和参数外边的括号可以被省略
        _ = names.sorted(by: { s1, s2 in
            return s1 > s2
        })
        //3 単表达式闭包隐式返回，可以通过省略`return`关键字来隐式返回単表达式的结果
        _ = names.sorted(by: { s1, s2 in
            s1 > s2
        })
        //4 参数名称缩写时可以省略 `in` 关键字
        _ = names.sorted(by: { $0 > $1 })
        //5 尾随闭包写法,参数标签`by:`可以被省略掉:
        _ = names.sorted() { $0 > $1 }
        //6 当闭包表达式是函数或方法中的唯一参数时，你可以把 () 省略.
        _ = names.sorted { $0 > $1 }
        
        
        // 求和闭包
        let sum: (Int, Int) -> (Int) = { $0 + $1 }
        let calculateSUM = sum(10, 11)
        print(calculateSUM)
        
        _ = sumNumber { (a, b) -> Int in
            let c = a + b
            print("\(c)")
            return a + b
        }
    }
    
    /// 尾随闭包：
    /// 如果必须要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
    /// 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
    /// 在使用尾随闭包时，不用写出它的参数标签。
    
    /*
    func someFunctionThatTakesAClosure(closure: ()->Void) {
        /*函数主体部分*/
    }
    func someFunctionThatTakesAClosureTest() {
        // 不使用尾随闭包进行函数调用的情况(闭包在小括号里面)
        someFunctionThatTakesAClosure(closure: { /*闭包主体部分*/ }) {
            
        }
        // 使用尾随闭包进行函数调用(闭包在小括号外面,并且省略了`closure`参数标签)
        someFunctionThatTakesAClosure() {
            
        }
    }
    */
    
    private func zd_clousure() {
        // map函数后带的就是一个尾随闭包，因为其只有闭包这一个参数，所以省略了（）
        let numberArr = [16, 58, 510]
        _ = numberArr.map { (number) -> String in
            // 闭包或者函数的参数总是常量,需要把其转换成变量
            let tempValue = number + 1
            let temp = "\(tempValue)"
            return temp
        }
    }
    
    private func sumNumber(numbers: (Int, Int) -> Int) -> Int {
        return numbers(4, 7)
    }
    
    
    //MARK: 判断系统版本
    // http://swift.gg/2016/04/13/swift-qa-2016-04-13/
    func zd_systemVersion() {
        if #available(iOS 10, *) {
            print("iOS10系统")
        } else {
            print("iOS9或者之前的系统")
        }
    }
    
    
    //MARK: guard的使用
    /// https://github.com/sxyx2008/DevArticles/issues/131
    /** guard 语法：
     guard condition else {
     statements
     return or break
     }
     `guard`语句结构中的`else`不可缺失，在`else`子句中可以使用`return`, `break`,` continue`, `throw`, `fatalError()`等。
     当`guard`语句条件表达式不为`true`时执行`else`语句块中的代码。
     */
    func guardTest() {
        guard #available(iOS 10, *) else {
            print("当前是低于iOS10的系统版本")
            return
        }
    }
    
    func zd_keyword() {
        let secondVC = SecondViewController()
        secondVC.setupButton()
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

// 要实现前缀或者后缀运算符，需要在声明运算符函数的时候在`func`关键字之前指定`prefix`或者`postfix`修饰符
// swift3.0从++的实现到inout和defer的小细节：http://ios.jobbole.com/92852/
// Swift 中 struct 是值类型的。何为值，值是不能改变的，是immutable的，任何对值的修改其实就是新构造了一个来替换原来的。这里的inout也是如此，并不是传了地址进来，而是在这里构造了一个新的结构体，当函数结束时会复制回去替换原来的结构体。
// 这里defer代码块会被压入栈中，函数结束时执行。到底啥时候执行呢？是在return后执行，如果return调用了其他函数，这个函数会在defer代码块执行之前被执行。
@discardableResult
postfix func ++(x: inout Int) -> Int {
    defer {
        x += 1
    }
    return x
}













