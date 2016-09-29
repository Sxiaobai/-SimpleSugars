//
//  SJMCategoryViewController.swift
//  SimpleSugars
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMCategoryViewController: SJMBaseViewController {
    
    let buttonW: CGFloat = SCREEN_W / 4 - 10
    //    let buttonH: CGFloat = buttonW
    
    var dataArr = [channelsMdeol]()
    var imageArr = NSMutableArray()
    var outGroups = [AnyObject]()
    lazy var headView: UIView = {
        
        let headView = UIView.init(frame: CGRectMake(10, 10, SCREEN_W - 40, 120))
        headView.addSubview(self.adView)
        return headView
    }()
    lazy var adView: XTADScrollView = {
        
        
        let adView = XTADScrollView.init(frame: CGRectMake(10, 0, SCREEN_W - 40, 120))
        adView.infiniteLoop = true
        adView.needPageControl = true
        adView.pageControlPositionType = pageControlPositionTypeRight
        return adView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIView.init(frame: CGRectMake(0, 65, SCREEN_W, 140))
        self.automaticallyAdjustsScrollViewInsets = false
        vc.addSubview(headView)
        vc.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(vc)
        self.loadData()
        
        // self.creatCategoryBtn()
        
        
    }
    
    func creatStyleBtns() -> Void {
        let topView = UIView()
        topView.frame = CGRectMake(0, 220, SCREEN_W, buttonW + 90)
        topView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        let styleLabel = UILabel.init(frame: CGRectMake(10, 0, SCREEN_W - 10, 40))
        styleLabel.text = "风格"
        styleLabel.font = UIFont.systemFontOfSize(16)
        styleLabel.textColor = SJMColor(0, g: 0, b: 0, a: 0.6)
        topView.addSubview(styleLabel)
        let nameArr = ["创意", "文艺范", "设计感", "科技苑"]
        for i in 0 ... 3 {
            
            let button = SJMVerticalButton()
            let nameLabel = UILabel()
            button.width = buttonW
            button.height = buttonW
            button.x = 5 + buttonW * CGFloat(i % 4) + 10 * CGFloat(i % 4)
            button.y = 40
            nameLabel.frame = CGRectMake(button.x, 30 + button.height, buttonW, 30)
            nameLabel.backgroundColor = UIColor.whiteColor()
            nameLabel.text = nameArr[i]
            nameLabel.textAlignment = .Center
            nameLabel.font = UIFont.systemFontOfSize(15)
            button.layer.cornerRadius = buttonW / 2
            button.sd_setImageWithURL(NSURL.init(string: dataArr[i].iconUrl), forState: .Normal)
            topView.addSubview(nameLabel)
            topView.addSubview(button)
        }
    }
    func loadData() -> Void {
        HDManager.startLoading()
        SJMCollection.bannerrequestData { (banner, error) in
            if error == nil{
                self.adView.imageURLArray = banner
                
            }else{
                let url = NSURL.init(string: "prefs:root=General")
                if UIApplication.sharedApplication().canOpenURL(url!) {
                    UIApplication.sharedApplication().openURL(url!)
                }
                
                
            }
            HDManager.stopLoading()
            
            //self.imageArr.addObjectsFromArray(banner!)
            //self.setupUI()
            
        }
        HDManager.startLoading()
        channelsMdeol.ChannelrequestData { (channel, error) in
            if error == nil{
                self.dataArr = channel as! [channelsMdeol]
                self.creatStyleBtns()
            }else{
                let url = NSURL.init(string: "prefs:root=General")
                if UIApplication.sharedApplication().canOpenURL(url!) {
                    UIApplication.sharedApplication().openURL(url!)
                }
                
            }
            HDManager.stopLoading()
            
        }
        
    }
    
}