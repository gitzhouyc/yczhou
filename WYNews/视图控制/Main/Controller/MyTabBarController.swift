//
//  MyTabBarController.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = UITabBar.appearance()
//        tabbar.isTranslucent = false
        tabbar.tintColor = themeColor
        tabbar.barTintColor = tabColor
        
        
        //添加子控制器
        addChildViewController()
        NotificationUtils.share.setNotification(self, TabClickNotification, selector: #selector(MyTabBarController.receiveTabButtonClicked(notification:)))
        
    }
    
    /// 接收到了按钮点击的通知
    @objc func receiveTabButtonClicked(notification: Notification){
        
    }
    
    /// 添加子控制器
    private func addChildViewController() {
        self.setChildViewController(NewsViewController(), title: "新闻", imageName: "NewsIcon", selectedImageName: "NewsIconSelect")
        self.setChildViewController(ReadViewController(), title: "阅读", imageName: "ReaderIcon", selectedImageName: "ReaderIconSelect")
        self.setChildViewController(HearViewController(), title: "视听", imageName: "VoiceIcon", selectedImageName: "VoiceIconSelect")
        self.setChildViewController(FindViewController(), title: "发现", imageName: "DiscoveryIcon", selectedImageName: "DiscoveryIconSelect")
        self.setChildViewController(MineViewController(), title: "我", imageName: "MyIcon", selectedImageName: "MyIconSelect")
        
    }
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String){
        
//        let navigation = UINavigationController(rootViewController: childController)
//        navigation.navigationBar.tintColor = UIColor.white // item字体颜色
//        navigation.navigationBar.barTintColor = themeColor //背景颜色
        
        
//        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
//        // 添加导航控制器为 TabBarController 的子控制图
        addChildViewController(MyNavigationController(rootViewController: childController))
        
    }
    
    deinit {
        NotificationUtils.share.removeNotification(TabClickNotification)
    }
    
    

}







