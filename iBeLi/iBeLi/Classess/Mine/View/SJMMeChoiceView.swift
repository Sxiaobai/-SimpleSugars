//
//  SJMMeChoiceView.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//


import UIKit
//喜欢的商品 和  喜欢的专题
class SJMMeChoiceView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // 左边的按钮
         addSubview(leftButton)
        // 右边的按钮
        addSubview(rightButton)
        // 底部红色条
        addSubview(indicatorView)
        
        leftButton.snp_makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightButton)
        }
        
        rightButton.snp_makeConstraints { (make) in
            make.left.equalTo(leftButton.snp_right)
            make.top.right.bottom.equalTo(self)
        }
        
        indicatorView.snp_makeConstraints { (make) in
            make.height.equalTo(kIndicatorViewH)
            make.bottom.left.equalTo(self)
            make.right.equalTo(leftButton)
        }
    }
    
    /// 左边的按钮
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setTitle("喜欢的商品", forState: .Normal)
        leftButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        leftButton.setTitleColor(SJMColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
        leftButton.backgroundColor = UIColor.whiteColor()
        leftButton.addTarget(self, action: #selector(leftButtonClick(_:)), forControlEvents: .TouchUpInside)
        leftButton.layer.borderColor = SJMColor(230, g: 230, b: 230, a: 1.0).CGColor
        leftButton.layer.borderWidth = klineWidth
        leftButton.selected = true
        return leftButton
    }()
    
    /// 右边的按钮
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitle("喜欢的专题", forState: .Normal)
        rightButton.setTitleColor(SJMColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        rightButton.backgroundColor = UIColor.whiteColor()
        rightButton.addTarget(self, action: #selector(rightButtonClick(_:)), forControlEvents: .TouchUpInside)
        rightButton.layer.borderColor = SJMColor(230, g: 230, b: 230, a: 1.0).CGColor
        rightButton.layer.borderWidth = klineWidth
        return rightButton
    }()
    
    /// 底部红色条
    private lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = SJMGlobalRedColor()
        return indicatorView
    }()
    
    func leftButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = 0
        }
    }
    
    func rightButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = SCREEN_W * 0.5
        }
    }
}
