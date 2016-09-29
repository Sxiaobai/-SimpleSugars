//
//  SJMRegisterViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//



import UIKit

class SJMRegisterViewController: SJMBaseViewController {

    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var vertifyButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mobileField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
