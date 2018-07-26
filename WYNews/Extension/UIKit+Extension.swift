//
//  UIKit+Extension.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit
import CoreText

//protocol StoryboardLoadable {}
//
//extension StoryboardLoadable where Self: UIViewController{
//    /// 提供 加载方法
//    static func loadStoryboard() -> Self{
//        return UIStoryboard(name: "\(self)", bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
//    }
//}

protocol NibLoadable {}

extension NibLoadable {
    static func loadViewFromNib() -> Self{
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}



