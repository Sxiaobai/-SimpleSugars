//
//  SJMTabBarController.swift
//  SimpleSugars
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.init(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        self.addChildViewControllers()
    }
    //添加子控制器
    private func addChildViewControllers() {
        self.addChildViewController("SJMSugarViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        self.addChildViewController("SJMProductViewController", title: "单品", imageName: "TabBar_gift_23x23_")
        self.addChildViewController("SJMCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")
        self.addChildViewController("SJMMeViewController", title: "我的", imageName: "TabBar_me_boy_23x23_")
       
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        //动态获取命名空间(工程名)
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        //将字符串转化成类 默认情况下命名空间就是项目名称 但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        //设置对应的数据
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: imageName + "selected")
        vc.title = title
        //给每个控制器包装一个导航控制器
        let nav = SJMNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }

}
