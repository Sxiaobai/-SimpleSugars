//
//  SJMChannelsView.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit
protocol SJMChanelsViewDelegate: class {
    func didSelectedtitleAtIndex(index: NSInteger) -> Void
   
}
class SJMChannelsView: UIView {

    var btnW: CGFloat = 0
    var space: CGFloat = 0
    var topSpace: CGFloat = 10
    var btnH: CGFloat = 23
    var sliderView: UIView!
    var selectedIndex = 0
    weak var delegate: SJMChanelsViewDelegate?
    init(frame: CGRect, leftSpace: CGFloat, titleArray: [String]) {
        super.init(frame: frame)
        self.userInteractionEnabled = true
        space = leftSpace
        
        btnW = (SCREEN_W - 2 * space - 50) / CGFloat(titleArray.count)
        self.creatSubviews(titleArray)
        
    }
    func creatSubviews(titleArray: [String]) -> Void {
        var i = 0
        for title in titleArray {
            let button = UIButton.init(frame: CGRectMake(CGFloat(i) * btnW, topSpace, btnW, btnH))
            button.setTitle(title, forState: .Normal)
            button.setTitle(title, forState: .Highlighted)
            button.setTitle(title, forState: .Selected)
            button.tag = 100 + i
            
            
            button.setTitleColor(UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), forState: .Normal)
            button.setTitleColor(UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), forState: .Highlighted)
            button.setTitleColor(UIColor.init(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0), forState: .Selected)
            
            button.titleLabel?.font = UIFont.systemFontOfSize(15)

            
            button.addTarget(self, action: #selector(self.btnClicked(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(button)
            if i == 0 {
                button.selected = true
            }
            i += 1
        }
        sliderView = UIView.init(frame: CGRectMake(0, self.mj_h - 2, btnW, 2))
        sliderView.backgroundColor = UIColor.init(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        self.addSubview(sliderView)
    
    }
    func btnClicked(button: UIButton) -> Void {
        self.selectedindex(button.tag - 100)
        self.delegate?.didSelectedtitleAtIndex(button.tag - 100)
        
    }
    func selectedindex(index: NSInteger) -> Void {
        let preBtn = self.viewWithTag(100 + self.selectedIndex) as! UIButton
        preBtn.selected = false
        let button = self.viewWithTag(100 + index) as! UIButton
        button.selected = true
        selectedIndex = index
        
        UIView.animateWithDuration(kAnimationDuration) { 
            self.sliderView.mj_x = self.btnW * CGFloat(index)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
