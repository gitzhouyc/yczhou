//
//  NotificationUtils.swift
//
//  Created by 宁国通 on 2017/1/19.
//  Copyright © 2017年 宁国通. All rights reserved.
//

import UIKit

/// 通知帮助类
class NotificationUtils: NSObject {
    
    /// 单例方法
    static var share:NotificationUtils{
        struct Static {
            static let instance : NotificationUtils = NotificationUtils()
        }
        return Static.instance
    }
    
    
    fileprivate override init() { }
    
    
    /// 保存所有的通知对象名称
    var notificationArray:[NotificationEntity] = []
    
    
    /// 设置通知
    ///
    /// - Parameters:
    ///   - observer: 通知对象
    ///   - notificationName: 通知的名字
    ///   - selector: 通知执行函数
    func setNotification(_ observer:Any,_ notificationName:String,selector: Selector,_ object: Any? = nil)   {
        let notificationName:String = notificationName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        var isEx:Bool = false
        for n in self.notificationArray {
            if n.notificationName == notificationName {
                isEx = true
                print("该notification已经添加过、无需重复添加")
                break
            }
        }
        if !isEx {
            let notInfo:NotificationEntity = NotificationEntity()
            notInfo.notificationName = notificationName
            notInfo.observer = observer
            notInfo.object = object
            notificationArray.append(notInfo)
            NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: notificationName), object: object)
        }
    }
    
    /// 发送通知
    ///
    /// - Parameters:
    ///   - notificationName: 发送通知的名称
    ///   - object: object any值
    ///   - userInfo: userinfo key:value 值
    func postNotification(_ notificationName:String,object:Any?,userInfo:[AnyHashable:Any]?){
        let notificationName:String = notificationName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        var isEx:Bool = false
        for n in self.notificationArray {
            if n.notificationName == notificationName {
                isEx = true
                print("该notification已存在")
                break
            }
        }
        if !isEx {
            print("该通知不存在")
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: object, userInfo: userInfo)
    }
    
    
    /// 移除所有通知
    func removeAllNotification(){
        for n in self.notificationArray {
            NotificationCenter.default.removeObserver(n.observer)
        }
        self.notificationArray.removeAll()
    }
    
    
    
    /// 移除某个通知
    ///
    /// - Parameter notificationName: 需要移除通知的名称
    func removeNotification(_ notificationName:String){
        let notificationName:String = notificationName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        var index:Int = 0
        for n in self.notificationArray {
            if n.notificationName ==  notificationName {
                NotificationCenter.default.removeObserver(n.observer, name: NSNotification.Name(rawValue: notificationName), object: n.object)
                self.notificationArray.remove(at: index)
                break
            }
            index += 1
        }
    }
    
}

/// 通知的实体类
class NotificationEntity:NSObject {
    var observer:Any!
    var object:Any?
    var notificationName:String!
}
