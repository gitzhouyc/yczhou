//
//  NewsViewController.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit
import SGPagingView

class NewsViewController: BaseViewController,SGPageTitleViewDelegate,SGPageContentScrollViewDelegate {
    
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        
    }
    
    /// 标题内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentScrollView?
    ///自定义导航栏
    private lazy var navigationBar = HomeNavigationView.loadViewFromNib()
    
    let contentLabel = ["头条","娱乐","热点","体育","北京","军事","段子","世界杯"]
    
    /// 添加下拉箭头
    private lazy var addChannelButton: UIButton = {
        let addChannelButton = UIButton(frame: CGRect.init(x: screenWidth - newsTitleHeight, y: 0, width: newsTitleHeight, height: newsTitleHeight))
        addChannelButton.setImage(UIImage(named: "add_channel"), for: .normal)
        let separatorView = UIView(frame: CGRect.init(x: 0, y: newsTitleHeight - 1, width: newsTitleHeight, height: 1))
        separatorView.backgroundColor = UIColor.white
        addChannelButton.addSubview(separatorView)
        return addChannelButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.keyWindow?.backgroundColor = UIColor.white
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavigationBar44"), for: UIBarMetrics.default)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新闻"
        
        setupUI()
    }

}

//
extension NewsViewController{
    /// 设置UI
    private func setupUI(){
        self.view.backgroundColor = UIColor.white
        
        
        //设置自定义导航栏
        navigationItem.titleView = navigationBar
        
        
        
        //添加频道
        view.addSubview(addChannelButton)
        //首页顶部新闻标题的数据
        let configuration = SGPageTitleViewConfigure()
        configuration.titleColor = UIColor.black
        configuration.titleSelectedColor = themeColor
        configuration.indicatorColor = themeColor
        // 标题名称的数组
        
        self.pageTitleView = SGPageTitleView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth - newsTitleHeight, height: newsTitleHeight), delegate: self, titleNames: self.contentLabel, configure: configuration)
        
        self.pageTitleView?.backgroundColor = UIColor.clear
        self.view.addSubview(self.pageTitleView!)
        // 内容视图
        self.pageContentView = SGPageContentScrollView.init(frame: CGRect.init(x: 0, y: newsTitleHeight, width: screenWidth, height: self.view.frame.height + newsTitleHeight), parentVC: self, childVCs: self.childViewControllers)
        self.pageContentView?.delegatePageContentScrollView = self
        self.view.addSubview(self.pageContentView!)
        
    }
}
















