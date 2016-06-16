//
//  SecondViewController.swift
//  Swift1
//
//  Created by 符现超 on 15/11/19.
//  Copyright © 2015年 Zero.D.Saber. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
        
        setupButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupButton() -> Void {
        let button: UIButton = UIButton(type: .DetailDisclosure)
        button.frame = CGRect(x: 50, y: 150, width: 100, height: 30)
        button.frame = cgrect
        button.titleLabel?.text = "show tableView"
        button.addTarget(self, action: #selector(showTableView), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
    }

    @objc private func showTableView() {
        self.navigationController?.pushViewController(TableController(), animated: true)
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
