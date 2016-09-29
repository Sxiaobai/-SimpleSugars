//
//  SJMProductDetailViewController.swift
//  iBeLi
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 sunjimin. All rights reserved.
//

import UIKit

class SJMProductDetailViewController: SJMBaseViewController {

    var product: SJMProductModel?
    var url: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        /// 自动对页面进行缩放以适应屏幕
        let webView = UIWebView()
        webView.frame = self.view.bounds
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        let url = NSURL(string: self.url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .Plain, target: self, action: #selector(shareBBItemClick))
    }
    
    func shareBBItemClick() {
        SJMActionSheet.show()
    }
    
    func navigationBackClick() {
        
        //dismissViewControllerAnimated(true, completion: nil)
       
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension SJMProductDetailViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}

