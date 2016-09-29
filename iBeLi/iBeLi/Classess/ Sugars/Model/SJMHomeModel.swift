//
//  SJMHomeModel.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import Foundation

class SJMHomeModel: JSONModel {
    
    var contentUrl: String!
    var id:Int!
    var coverImageUrl: String!
    var likesCount: String!
    var title: String!
    override class func keyMapper() -> JSONKeyMapper {
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(propertyName: String) -> Bool {
        
        return true
    }
}














