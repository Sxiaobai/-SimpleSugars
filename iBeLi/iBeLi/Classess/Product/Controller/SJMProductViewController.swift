//
//  SJMProductViewController.swift
//  SimpleSugars
//
//  Created by sunjimin on 16/9/20.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMProductViewController: SJMBaseViewController {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        var dataArray:NSMutableArray! = NSMutableArray()
        var space: CGFloat = 2
        var page: NSInteger = 1
        lazy var productView: UICollectionView = {
    
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .Vertical
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = self.space
    
            let cv = UICollectionView.init(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), collectionViewLayout: layout)
            cv.backgroundColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            cv.delegate = self
            cv.dataSource = self
            cv.registerNib(UINib.init(nibName: "SJMProductCell", bundle: nil), forCellWithReuseIdentifier: "SJMProductCell")
            return cv
    
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = true
        self.loadData()
    }
    
        func loadData() -> Void {
            HDManager.startLoading()
            SJMProductModel.responseProductData { (array, error) in
                if error == nil {
                    self.view.addSubview(self.productView)
                }
                self.dataArray.addObjectsFromArray(array! as [AnyObject])
                self.productView.reloadData()
            }
             HDManager.stopLoading()
        }
    
    
    }
    extension SJMProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.dataArray.count
        }
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cellIdentify = "SJMProductCell"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentify, forIndexPath: indexPath) as! SJMProductCell
            let model = self.dataArray.objectAtIndex(indexPath.item) as! SJMProductModel
            cell.productImageView.sd_setImageWithURL(NSURL.init(string: model.coverImageUrl))
            cell.titleLabel.text = model.name
            cell.priceLabel.text = model.price
            cell.likeButton.setTitle(model.favoritesCount, forState: .Normal)
            return cell
        }
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSizeMake((UIScreen.mainScreen().bounds.size.width - space) / 2, 220)
        }

}
