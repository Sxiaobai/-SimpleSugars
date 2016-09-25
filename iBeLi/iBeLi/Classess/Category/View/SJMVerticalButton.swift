//
//  SJMVerticalButton.swift
// iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit


class SJMVerticalButton: UIButton {
    
    var group: SJMGroup? {
        didSet {
            let url = group!.icon_url
            imageView?.sd_setImageWithURL(NSURL(string: url!)!)
            titleLabel?.text = group!.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.x = 10
        imageView?.y = 0
        imageView?.width = self.width - 20
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    }
    
}
