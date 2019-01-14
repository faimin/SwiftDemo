//
//  SecondViewController
//  ZDSwiftNote
//
//  Created by Zero.D.Saber on 2016/10/27.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let kScreenSize = UIScreen.main.bounds.size
    
    let toolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        toolbar.backgroundColor = UIColor.green
        return toolbar
    }()
    
    var textView: UITextView?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.

        setupButton()
        configInput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupButton() -> Void {
        let button: UIButton = UIButton(type: .detailDisclosure)
        button.frame = CGRect(x: 50, y: 150, width: 100, height: 30)
        button.titleLabel?.text = "show tableView"
        button.addTarget(self, action: #selector(SecondViewController.showTableView), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    private func configInput() {
        textView = UITextView(frame: CGRect(x: 0, y: 0, width: textField.bounds.size.width, height: textField.bounds.size.height))
        textView!.backgroundColor = UIColor.purple
        textView?.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        
        let btnLeft = (textView?.frame.origin.x)! + 10
        let btnWidth = kScreenSize.width - btnLeft - 10
        
        let sendBtn = UIButton(frame: CGRect(x: btnLeft, y: 10, width: btnWidth, height: 40))
        sendBtn.backgroundColor = UIColor.red
        sendBtn.setTitle("发送", for: UIControl.State.normal)
        sendBtn.addTarget(self, action: #selector(handleSend(sender:)), for: .touchUpInside)
        
        let inputItem = UIBarButtonItem(customView: textView!)
        let sendItem = UIBarButtonItem(customView: sendBtn)
        
        toolbar.items = [inputItem, sendItem]
        
        textField.inputAccessoryView = toolbar
    }

    @objc func showTableView() {
        self.navigationController?.pushViewController(TableController(), animated: true)
    }

    @objc private func handleSend(sender: UIButton) {
        sendText(sender)
    }
    
    @IBAction func sendText(_ sender: UIButton) {
        guard !(textView?.text.isEmpty)! else {
            return
        }
        
        textField.resignFirstResponder()
        print(textField.text ?? "空字符串")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
