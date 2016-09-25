//
//  SJMSetting.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//


import UIKit

class SJMSetting: NSObject {
    
    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        iconImage = dict["iconImage"] as? String
        leftTitle = dict["leftTitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
    }
}
