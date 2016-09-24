//
//  SJMCollectView.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMCollectView: UICollectionViewCell {
    
    var dataArr = NSMutableArray()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64 - 49), style: .Plain)
        tableView.registerNib(UINib.init(nibName: "SJMHomeCell", bundle: nil), forCellReuseIdentifier: "SJMHomeCell")
        self.contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.cyanColor()
        self.loadData()
    }
    func loadData() -> Void {
        SJMHomeModel.CollectreuqestData { (items, error) in
            if error == nil {
                self.dataArr.addObjectsFromArray(items! as [AnyObject])
                self.tableView.reloadData()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension SJMCollectView: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SJMHomeCell", forIndexPath: indexPath) as! SJMHomeCell
        let model = dataArr[indexPath.row] as! SJMHomeModel
        cell.bgImageView.sd_setImageWithURL(NSURL.init(string: model.coverImageUrl))
        cell.titleLabel.text = model.title
        cell.favoriteBtn.setTitle(model.likesCount, forState: .Normal)
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
    }
}
