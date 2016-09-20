//
//  SJMNavigationController.swift
//  SimpleSugars
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMNavigationController: UINavigationController {

    internal  override class func initialize() {
        super.initialize()
        //设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = SJMGlobalRedColor()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(20)]
    }
    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        // 这时push进来的控制器viewController, 不是第一个子控制器 (不是跟控制器)
        if self.viewControllers.count > 0 {
            //push 后隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(self.navigationBackClick))
            
        }
    }
    //返回按钮
    func navigationBackClick() -> Void {
        if SVProgressHUD.isVisible(){
            SVProgressHUD.dismiss()
        }
        if UIApplication.sharedApplication().networkActivityIndicatorVisible {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }

}
