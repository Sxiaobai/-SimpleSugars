//
//  SJMBannersNetWorkManager.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation


////api.dantangapp.com/v1/banners?channel=iOS
extension SJMBannersModel {
    class func bannerrequestData(callBack: (banner: [AnyObject]?, error: NSError?) -> Void) {
        let url = BASE_URL + "v1/banners"
        let para = ["channel": "iOS"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let banners = dict.objectForKey("banners") as! [NSDictionary]
                var arr = [String]()
                for dic in banners {
                    arr.append(dic.objectForKey("image_url")! as! String)
                }
               dispatch_async(dispatch_get_main_queue(), {
                    callBack(banner:  arr as [AnyObject], error: nil)
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(banner: nil, error:  error)
                })
            }
        }
    }
}