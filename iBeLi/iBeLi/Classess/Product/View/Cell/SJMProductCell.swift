//
//  YMCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by 杨蒙 on 16/7/21.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit


protocol SJMCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class SJMProductCell: UICollectionViewCell {
    
    weak var delegate: SJMCollectionViewCellDelegate?
    
    // 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    // 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 价格
    @IBOutlet weak var priceLabel: UILabel!
    // 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        delegate?.collectionViewCellDidClickedLikeButton(sender)
    }
}
