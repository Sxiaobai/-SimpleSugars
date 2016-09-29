//
//  SJMChannelModel.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation
//button
//class SJMChannelModel: JSONModel {
//    
//   
//    var channels: NSMutableArray!
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//        
//    }
//    required init(dictionary dict: [NSObject : AnyObject]!) throws {
//        super.init()
//        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
//        let array = dict["channels"] as? [AnyObject]
//        if array?.count > 0 {
//            self.channels = SJMChannelModel.arrayOfModelsFromDictionaries(array)
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        //super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    required init(data: NSData!) throws {
//        //try! super.init(data: data)
//        fatalError("init(data:) has not been implemented")
//    }
//    
//}
class channelsMdeol: JSONModel {
    var iconUrl: String!
//    var groupId: String!
//    var name: String!
//    var id: String!
        override class func keyMapper() -> JSONKeyMapper {
            return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
        }
        override class func propertyIsOptional(propertyName: String) -> Bool {
            return true
        }
}











