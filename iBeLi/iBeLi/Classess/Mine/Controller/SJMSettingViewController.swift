//
//  SJMSettingViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//


import UIKit

class SJMSettingViewController: SJMBaseViewController {
    
    var settings = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 从 plist 文件在加载数据
        configCellFromPlist()
        
        setupTableView()
    }
    /// 从 plist 文件在加载数据
    func configCellFromPlist() {
        let path = NSBundle.mainBundle().pathForResource("SettingCell", ofType: ".plist")
        let settingsPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in settingsPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let setting = SJMSetting(dict: dict as! [String: AnyObject])
                sections.append(setting)
            }
            settings.append(sections)
        }
    }
    
    /// 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        let nib = UINib(nibName: String(SJMSettingCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: messageCellID)
        tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SJMSettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let setting = settings[section] as! [SJMSetting]
        return setting.count    ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(messageCellID) as! SJMSettingCell
        let setting = settings[indexPath.section] as! [SJMSetting]
        cell.setting = setting[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin + 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
