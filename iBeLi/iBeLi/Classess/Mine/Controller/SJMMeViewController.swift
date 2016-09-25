//
//  SJMMeViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

//  我
//

import UIKit

class SJMMeViewController: SJMBaseViewController {
    
    var cellCount = 0
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    /// 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    private lazy var headerView: SJMMineHeaderView = {
        
        let headerView = SJMMineHeaderView()
        headerView.frame = CGRectMake(0, 0, SCREEN_W, kSJMMineHeaderImageHeight)
        headerView.iconButton.addTarget(self, action: #selector(self.iconButtonClick), forControlEvents: .TouchUpInside)
        headerView.messageButton.addTarget(self, action: #selector(self.messageButtonClick), forControlEvents: .TouchUpInside)
        headerView.settingButton.addTarget(self, action: #selector(self.settingButtonClick), forControlEvents: .TouchUpInside)
        return headerView
    }()
    
    // MARK: - 头部按钮点击
    func iconButtonClick() {
        // 判断是否登录
        if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .ActionSheet)
            let cameraAction = UIAlertAction(title: "编辑资料", style: .Default, handler: { (_) in
                
            })
            let photoAction = UIAlertAction(title: "退出登录", style: .Destructive, handler: { (_) in
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: isLogin)
            })
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoAction)
            self.presentViewController(actionSheet, animated: true, completion: nil)
        } else {
            let loginVC = SJMLoginViewController()
            loginVC.title = "登录"
            let nav = SJMNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
//            self.navigationController?.presentViewController(loginVC, animated: true, completion: nil)
        }
    }
    
    func messageButtonClick() {
        let messageVC = SJMMessageViewController()
        messageVC.title = "消息"
        navigationController?.pushViewController(messageVC, animated: true)
    }
    
    func settingButtonClick() {
        let settingVC = SJMSettingViewController()
        settingVC.title = "更多"
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    private lazy var footerView: SJMMeFooterView = {
        let footerView = SJMMeFooterView()
        footerView.width = SCREEN_W
        footerView.height = 200
        return footerView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SJMMeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = SJMMeChoiceView()
        return choiceView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kSJMMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
        
    }
}
