//
//  SJMProductModel.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMProductModel: JSONModel {

    var coverImageUrl: String!
    var favoritesCount: String!
    var id: String!
    var name: String!
    var price: String!
    override class func propertyIsOptional(property:String)->Bool
    {
        return true
    }
    override class func keyMapper()->JSONKeyMapper
    {
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }

    
}
