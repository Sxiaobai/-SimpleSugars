//
//  SJMCollection.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//
//  顶部专题合集
//

import Foundation

class SJMCollection: JSONModel {
    
    var status: Int?

    var bannerImageUrl: String?

    var subtitle: String?

    var id: Int?

    var createdAt: Int?

    var title: String?

    var coverImageUrl: String?

    var updatedAt: Int?

    var postsCount: Int?
    
//    init(dict: [String: AnyObject]) {
//        super.init()
//        status = dict["status"] as? Int
//        banner_image_url = dict["banner_image_url"] as? String
//        subtitle = dict["subtitle"] as? String
//        id = dict["id"] as? Int
//        created_at = dict["created_at"] as? Int
//        title = dict["title"] as? String
//        cover_image_url = dict["cover_image_url"] as? String
//        updated_at = dict["updated_at"] as? Int
//        posts_count = dict["posts_count"] as? Int
//    }

    override class func keyMapper() -> JSONKeyMapper {
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(propertyName: String) -> Bool {
        
        return true
    }

}
