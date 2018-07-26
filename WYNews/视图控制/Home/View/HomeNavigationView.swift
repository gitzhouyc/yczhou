//
//  HomeNavigationView.swift
//  WYNews
//
//  Created by 蓝可溯源 on 2018/6/28.
//  Copyright © 2018年 蓝科溯源. All rights reserved.
//

import UIKit

class HomeNavigationView: UIView, NibLoadable {

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var titleContent: UILabel!
    @IBOutlet weak var rightBtn: UIButton!

    /// 左侧按钮点击
    var didSelectLeftBtn: (()->())?
    /// 右侧按钮点击
    var didSelectRightBtn: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftBtn.backgroundColor = themeColor
        leftBtn.setTitleColor(themeColor, for: .normal)
        
//        leftBtn.setImage(UIImage(named: "NavigationBell"), for: [.normal, .highlighted])
        
    }
    
    /// 固有的大小
    override var intrinsicContentSize: CGSize{
        return UILayoutFittingExpandedSize
    }
    
    /// 重写 frame
    override var frame: CGRect{
        didSet{
            super.frame = CGRect(x: 0, y:0, width: screenWidth, height: 44)
        }
    }
    
    
    
    
    /// 左侧按钮的点击
    @IBAction func leftBtnAction(_ sender: UIButton) {
        didSelectLeftBtn?()
        
    }
    
    /// 右侧按钮的点击
    @IBAction func rightBtnAction(_ sender: UIButton) {
        didSelectRightBtn?()
    }
    
    
    
    

}
