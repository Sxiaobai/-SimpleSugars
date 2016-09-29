//
//  YMTopHeaderView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

protocol SJMTopHeaderViewDelegate: NSObjectProtocol {
    func topViewDidClickedMoreButton(button: UIButton)
}

class SJMTopHeaderView: UIView {
    
    weak var delegate: SJMTopHeaderViewDelegate?
    
    /// 查看全部按钮
    @IBAction func viewAllButton(sender: UIButton) {
        delegate?.topViewDidClickedMoreButton(sender)
    }
}
