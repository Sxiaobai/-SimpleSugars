//
//  SJMLoginViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMLoginViewController: SJMBaseViewController {
    /// 手机号
    @IBOutlet weak var mobileField: UITextField!
    /// 密码
    @IBOutlet weak var passwordField: UITextField!
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    /// 忘记密码按钮
    @IBOutlet weak var forgetPwdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏的左右按钮
        self.setupBarButtonItem()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginButtonClick(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: isLogin)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        //self.navigationItem.backBarButtonItem?.tintColor = UIColor.yellowColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(cancelButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(regiisterButtonClick))
    }
    
    /// 取消按钮点击
    func cancelButtonClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /// 注册按钮点击
    func regiisterButtonClick() {
        let registerVC = SJMRegisterViewController()
        registerVC.title = "注册"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    /// - 其他社交账号登录
    @IBAction func otherLoginButtonClick(sender: UIButton) {
        if let buttonType = SJMOtherLoginButtonType(rawValue: sender.tag) {
            switch buttonType {
            case .weiboLogin:
                
                break
            case .weChatLogin:
                
                break
            case .QQLogin:
                
                break
            }
        }
    }
    
}
