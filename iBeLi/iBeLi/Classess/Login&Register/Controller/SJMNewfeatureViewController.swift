//
//  SJMNewfeatureViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/23.
//  Copyright © 2016年 sunjimin. All rights reserved.
//



import UIKit


let newFeatureID = "newFeatureID"

class SJMNewfeatureViewController: UICollectionViewController {
    /// 布局对象
    private var layout: UICollectionViewFlowLayout = SJMNewfeatureLayout()
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(SJMNewfeatureCell.self, forCellWithReuseIdentifier: newFeatureID)
        
    }
}

extension SJMNewfeatureViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kNewFeatureCount
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(newFeatureID, forIndexPath: indexPath) as! SJMNewfeatureCell
        cell.imageIndex = indexPath.item
        return cell
    }
    // 完全显示一个cell之后调用
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let path = collectionView.indexPathsForVisibleItems().last!
        if path.item == (kNewFeatureCount - 1) {
            let cell = collectionView.cellForItemAtIndexPath(path) as! SJMNewfeatureCell
            cell.startBtnAnimation()
        }
    }
}

/// SJMNewfeatureCell
private class SJMNewfeatureCell: UICollectionViewCell {
    
    private var imageIndex: Int? {
        didSet {
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    
    func startBtnAnimation() {
        startButton.hidden = false
        // 执行动画
        startButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        startButton.userInteractionEnabled = false
        
        // UIViewAnimationOptions(rawValue: 0) == OC knilOptions
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            // 清空形变
            self.startButton.transform = CGAffineTransformIdentity
            }, completion: { (_) -> Void in
                self.startButton.userInteractionEnabled = true
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(startButton)
        
        iconView.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        startButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom).offset(-50)
            make.size.equalTo(CGSizeMake(150, 40))
            make.centerX.equalTo(0)
        }
    }
    
    private lazy var iconView = UIImageView()
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "btn_begin"), forState: .Normal)
        btn.addTarget(self, action: #selector(startButtonClick), forControlEvents: .TouchUpInside)
        btn.layer.masksToBounds = true
        btn.hidden = true
        return btn
    }()
    
    @objc func startButtonClick() {
        UIApplication.sharedApplication().keyWindow?.rootViewController = SJMTabBarController()
    }
}

private class SJMNewfeatureLayout: UICollectionViewFlowLayout {
    /// 准备布局
    private override func prepareLayout() {
        // 设置 layout 布局
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        // 设置 contentView 属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
    }
}
