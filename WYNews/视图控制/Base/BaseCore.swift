//
//  BaseCore.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit

class BaseCore: UIViewController {

    lazy var statusWidth:CGFloat = {
        // 状态栏(statusbar)
        let rectStatus:CGRect = UIApplication.shared.statusBarFrame
        return rectStatus.size.width //宽度
    }()
    
    lazy var statusHeight:CGFloat = {
        //状态栏
        let rectStatus:CGRect =  UIApplication.shared.statusBarFrame
        return rectStatus.size.height// 高度
    }()
    
    /// 导航栏的宽度
    lazy var rectNavWidth:CGFloat = {
        // 导航栏（navigationbar）
        if self.navigationController == nil {
//            return 
        }
        let rectNav:CGRect = self.navigationController!.navigationBar.frame
        return rectNav.size.width  // 宽度
    }()
    
    /// 导航栏的高度
    lazy var rectNavHeight:CGFloat = {
        // 导航栏（navigationbar）
        if self.navigationController == nil {
            return 45
        }
        let rectNav:CGRect = self.navigationController!.navigationBar.frame
        return rectNav.size.height // 高度
    }()
    
    /// tabbar的高度
    lazy var tabBarHeight:CGFloat = { return self.tabBarController!.tabBar.frame.size.height}()
    
    /// 顶部view的总高度、状态栏加导航栏
    lazy var topCountHeight:CGFloat = {return self.statusHeight + self.rectNavHeight }()
    
    lazy var dateFormatter:DateFormatter = {
        let d:DateFormatter = DateFormatter()
        d.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return d
    }()
    
    
    

}






