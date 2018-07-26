//
//  MyNavigationController.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = UINavigationBar.appearance()
        navigationBar.tintColor = themeColor
        navigationBar.barTintColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage(named: "NavigationBar64"), for: UIBarMetrics.default)
        
    }
    
    /// 拦截push操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "NavigationBck"), style: .plain, target: self, action: #selector(MyNavigationController.navigationBack))
            
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    /// 返回上一控制器
    @objc private func navigationBack() {
        popViewController(animated: true)
    }

}
