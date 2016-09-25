//
//  SJMNewfeatureViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

//import UIKit
//
//let newFeatureID = "newFeatureID"
//
//class SJMNewfeatureViewController: UICollectionViewController {
//
//    //布局对象
//    private var layout: UICollectionViewFlowLayout = SJMNewfeatureLayout()
//    init() {
//        super.init(collectionViewLayout: layout)
//        collectionView?.showsVerticalScrollIndicator = false
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: newFeatureID)
//    }
//
//   
//
//
//}
//extension SJMNewfeatureViewController {
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return kNewFeatureCount
//    }
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(newFeatureID, forIndexPath: indexPath)
//        return cell
//    }
//}
//private class SJMNewfeatureLayout: UICollectionViewFlowLayout {
//    
//    //准备数据
//    private override func prepareLayout() {
//        // 设置 layout 布局
//        itemSize = UIScreen.mainScreen().bounds.size
//        minimumInteritemSpacing = 0
//        minimumLineSpacing = 0
//        scrollDirection = .Horizontal
//        
//        //设置 contentView属性
//        collectionView?.showsVerticalScrollIndicator = false
//        collectionView?.bounces = false
//        collectionView?.pagingEnabled = true
//    }
//    
//    
//    
//    
//    
//    
//}
