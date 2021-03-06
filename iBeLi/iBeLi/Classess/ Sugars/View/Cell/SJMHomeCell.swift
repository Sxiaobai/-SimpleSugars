//
//  SJMChannelsView.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//  主页 cell

import UIKit


protocol SJMHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}

class SJMHomeCell: UITableViewCell {
    
    weak var delegate: SJMHomeCellDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    var homeItem: SJMHomeModel? {
   
        didSet {
            let url = homeItem!.coverImageUrl
            bgImageView.sd_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, options: SDWebImageOptions.init(rawValue: 0), progress: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likesCount!) + " ", forState: .Normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.frame.size.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    /// 点击了喜欢按钮
    @IBAction func favoriteButtonClick(sender: UIButton) {
        delegate?.homeCellDidClickedFavoriteButton(sender)
    }
}
