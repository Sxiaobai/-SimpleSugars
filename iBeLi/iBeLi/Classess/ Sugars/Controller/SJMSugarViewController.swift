//
//  SJMSugarViewController.swift
//  SimpleSugars
//
//  Created by sunjimin on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit
//protocol PushViewControllerDelegate: class {
//    func pushViewController(destiationVC: UIViewController) -> Void
//}
class SJMSugarViewController: SJMBaseViewController, SJMChanelsViewDelegate, SJMSelectionViewDelegate {
    
    
    var titleView: SJMChannelsView!
    lazy var contentView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let contentView = UICollectionView.init(frame: CGRectMake(0, 64 + 35, SCREEN_W, SCREEN_H - 64 - 49 - 35), collectionViewLayout: layout)
        contentView.pagingEnabled = true
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.showsHorizontalScrollIndicator = false
        contentView.registerClass(SJMSelectionView.self, forCellWithReuseIdentifier: "SJMSelectionView")
        contentView.registerClass(SJMCateView.self, forCellWithReuseIdentifier: "SJMCateView")
        contentView.registerClass(SJMHomeGardenView.self, forCellWithReuseIdentifier: "SJMHomeGardenView")
        contentView.registerClass(SJMDigitalView.self, forCellWithReuseIdentifier: "SJMDigitalView")
        contentView.registerClass(SJMCollectView.self, forCellWithReuseIdentifier: "SJMCollectView")
        contentView.registerClass(SJMGrocerView.self, forCellWithReuseIdentifier: "SJMGrocerView")
        
        contentView.delegate = self
        contentView.dataSource = self
        self.view.addSubview(contentView)
        return contentView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.contentView.reloadData()
        self.creattitleView()
        
    }
    func creattitleView() -> Void {
        titleView = SJMChannelsView.init(frame: CGRectMake(0, 64, SCREEN_W, kTitlesViewH), leftSpace: 5, titleArray: ["精选", "美食", "家居", "数码", "美物", "杂货"])
        titleView.delegate = self
        titleView.selectedindex(0)
        titleView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(titleView)
    }
    func didSelectedtitleAtIndex(index: NSInteger) {
        self.contentView.contentOffset = CGPointMake(CGFloat(index) * SCREEN_W, 0)
    }
}
extension SJMSugarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cellID = "SJMSelectionView"
        if indexPath.item == 0 {
            cellID = "SJMSelectionView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMSelectionView
            cell.delegate = self
            return cell
        }else if indexPath.item == 1 {
            cellID = "SJMCateView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMCateView
            cell.delegate = self
            return cell
        } else if indexPath.item == 2 {
            cellID = "SJMHomeGardenView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMHomeGardenView
                cell.delegate = self
            return cell
        } else if indexPath.item == 3 {
            cellID = "SJMDigitalView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMDigitalView
            cell.delegate = self
            return cell
        } else if indexPath.item == 4 {
            cellID = "SJMCollectView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMCollectView
            cell.delegate = self
            return cell
        } else {
            cellID = "SJMGrocerView"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! SJMGrocerView
                cell.delegate = self
            return cell
            
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = NSInteger(scrollView.contentOffset.x / SCREEN_W)
        titleView.selectedindex(index)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.mj_w, collectionView.mj_h)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func pushWebView(web: SJMDetailViewController) {
        self.navigationController?.pushViewController(web, animated: true)
    }
    
}