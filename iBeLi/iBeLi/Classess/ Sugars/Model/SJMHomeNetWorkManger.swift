//
//  SJMHomeNetWorkManger.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation

extension SJMHomeModel {
    
    
    // /v1/channels/4/items?gender=1&generation=1&limit=20&offset=0
    //精选
    class func SelectionreuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        
        let url = BASE_URL + "v1/channels/4/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(items: nil, error: error)
                })
            }
        }
    }
    //美食
    class func CatereuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        
        let url = BASE_URL + "v1/channels/14/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: nil, error: error)
                })
            }
        }
    }
    //家居
    class func HomeGardenreuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        
        let url = BASE_URL + "v1/channels/16/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: nil, error: error)
                })
            }
        }
    }
    //数码
    class func DigitalreuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        ///v1/channels/4/items?generation=1&gender=1&limit=20&offset=20
        let url = BASE_URL + "v1/channels/17/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: nil, error: error)
                })
            }
        }
    }
    //美物
    class func CollectreuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        
        let url = BASE_URL + "v1/channels/13/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: nil, error: error)
                })
            }
        }
    }
    //杂货
    class func GrocereuqestData(callBack: (items: NSMutableArray? , error: NSError?) -> Void) {
        
        let url = BASE_URL + "v1/channels/22/items"
        let para = ["gender": "1", "generation": "1", "limit": "20", "offset": "0"]
        BaseRequest.getWithURL(url, para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let dict = obj.objectForKey("data") as! NSDictionary
                let items = dict.objectForKey("items") as! [AnyObject]
                let arr = NSMutableArray()
                for dic in items {
                    arr.addObject(dic)
                }
                let array = SJMHomeModel.arrayOfModelsFromDictionaries(arr as [AnyObject])
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: array, error:  nil)
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(items: nil, error: error)
                })
            }
        }
    }



    

}