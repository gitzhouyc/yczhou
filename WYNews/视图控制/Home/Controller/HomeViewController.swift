//
//  HomeViewController.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit
import SGPagingView

class HomeViewController: UIViewController {
    
    
    /// 标题和内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentScrollView?
    
    /// 自定义导航栏
    private lazy var navigationBar = HomeNavigationView.loadViewFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.backgroundColor = UIColor.white
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
        
        
    }

    

}
