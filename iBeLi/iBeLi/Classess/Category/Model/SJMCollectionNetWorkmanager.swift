//
//  SJMCollectionNetWorkmanager.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation

extension SJMCollection {
    
    //v1/collections?limit=20&offset=0
    
    
    class func bannerrequestData(callBack: (banner: [AnyObject]?, error: NSError?) -> Void)  {
        
        let url = BASE_URL + "v1/collections"
        let para = ["limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                var arr = [String]()
                let collections = dict.objectForKey("collections") as! [AnyObject]
                for dic in collections {
                    arr.append(dic.objectForKey("banner_image_url") as! String)
                }
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(banner: arr, error:  nil)
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(banner:  nil, error:  error)
                })
            }
        }
        
        
        
        
    }
    

}

