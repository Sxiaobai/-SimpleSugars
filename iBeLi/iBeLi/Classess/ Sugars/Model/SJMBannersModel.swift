//
//  SJMBannersModel.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation




class SJMBannersModel: JSONModel {
   
    var imageUrl: String!
    
    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    override class func keyMapper() -> JSONKeyMapper {
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
   
}