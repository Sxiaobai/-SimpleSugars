//
//  SJMMeFooterView.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//


import UIKit
class SJMMeFooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubview(meBlankButton)
        
        addSubview(messageLabel)
        
        meBlankButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(50, 50))
            make.center.equalTo(self.center)
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(meBlankButton.snp_bottom).offset(kMargin)
            make.left.right.equalTo(self)
        }
    }
    
    private lazy var meBlankButton: UIButton = {
       
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(SJMColor(200, g: 200, b: 200, a: 1.0), forState: .Normal)
        meBlankButton.width = 100
        meBlankButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), forState: .Normal)
        meBlankButton.addTarget(self, action: #selector(self.footerViewButtonClick), forControlEvents: .TouchUpInside)
        meBlankButton.imageView?.sizeToFit()
        return meBlankButton
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "登录以享受功能"
        messageLabel.textAlignment = .Center
        messageLabel.font = UIFont.systemFontOfSize(15)
        messageLabel.textColor = SJMColor(200, g: 200, b: 200, a: 1.0)
        return messageLabel
    }()
    
    
    func footerViewButtonClick() {
        let nav = SJMNavigationController(rootViewController: SJMLoginViewController())
//        let nav = SJMLoginViewController()
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(nav, animated: true, completion: nil)
    }
    
}
