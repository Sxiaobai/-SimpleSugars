//
//  SJMNavigationController.swift
//  SimpleSugars
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//


import UIKit

public extension UITableView {
    func tableView(message: String, image: String, cellCount: Int) {
        if cellCount == 0 {
            // 没有数据，显示图片
            let button = SJMVerticalButton()
            button.setTitleColor(SJMColor(200, g: 200, b: 200, a: 1.0), forState: .Normal)
            button.setTitle(message, forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button.setImage(UIImage(named: image), forState: .Normal)
            button.addTarget(self, action: #selector(emptyButtonClick), forControlEvents: .TouchUpInside)
            button.imageView?.sizeToFit()
            backgroundView = button
            separatorStyle = .None
        } else {
            backgroundView = nil
            separatorStyle = .SingleLine
        }
    }
    
    func emptyButtonClick() {
        print("---")
    }
}
