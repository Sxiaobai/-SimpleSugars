//
//  SJMChannelNetWorkManager.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation
extension channelsMdeol {
    class func ChannelrequestData(callBack: (channel: [AnyObject]?, error: NSError?) -> Void) -> Void {

        let url = BASE_URL + "v1/channel_groups/all"
        BaseRequest.getWithURL(url, para: nil) { (data, error) in
            if error == nil {
                let obj = try!  NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let arr = dict.objectForKey("channel_groups") as! [AnyObject]
                let dic = arr[0] as! NSDictionary
                let arr1 = dic.objectForKey("channels") as! [AnyObject]
                let channel = channelsMdeol.arrayOfModelsFromDictionaries(arr1)
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(channel: channel as [AnyObject], error: nil)
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(channel: nil, error: error)
                })
            }
            
        }
    }
}