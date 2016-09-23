//
//  SJMProductNetWorkManage.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation



extension SJMProductModel {
    
    class func responseProductData(callBack: (items: NSMutableArray?, error: NSError?) -> Void) -> Void {
        let url = BASE_URL + "v2/items"
        
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
//                print(dict)
                let item = dict.objectForKey("items") as! [AnyObject]
                let array = NSMutableArray()
                for dic in item {
                    let data = dic.objectForKey("data")
                    array.addObject(data!)
                }
                let arr = SJMProductModel.arrayOfModelsFromDictionaries(array as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(items:  arr, error:  nil)
                })
                
            }else {
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(items:  nil, error:  error)
                })
            }
        }
        
    }
    
    

}





