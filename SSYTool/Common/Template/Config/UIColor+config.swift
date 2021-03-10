//
//  UIColorConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

// MARK: - 背景颜色
extension UIColor {
    //页面背景色
    static func viewBGColor () -> UIColor {
        return UIColor.white
    }
    //表格背景色
    static func tableBGColor () -> UIColor {
        return UIColor.white
    }
    //表格 section 背景色
    static func sectionBGColor () -> UIColor {
        return UIColor.white
    }
    //表格 cell 背景色
    static func cellBGColor () -> UIColor {
        return UIColor.white
    }
    //表格 cell 分割视图背景色
    static func cellSplitBGColor () -> UIColor {
        return UIColor.white
    }
    static func buttonBGColor () -> UIColor {
        return UIColor.white
    }

}
// MARK: - 字体颜色
extension UIColor {
    // MARK: - 页面、导航栏相关
    /// 页面标题文字颜色
    /// - Returns: 颜色
    static func viewNavgationTitleColor () -> UIColor {
        return UIColor.black
    }
    /// 导航栏按钮字体颜色
    /// - Returns: 颜色
    static func viewNavgationBarColor () -> UIColor {
        return UIColor.black
    }
    
    // MARK: - tableview section 相关
    /// section 标题字体颜色
    /// - Returns: 颜色
    static func sectionTitleColor () -> UIColor {
        return UIColor.black
    }
    /// section 内容字体颜色
    /// - Returns: 颜色
    static func sectionContentColor () -> UIColor {
        return UIColor.black
    }
    
    // MARK: - tableview cell 相关
    /// cell 标题字体颜色
    /// - Returns: 颜色
    static func cellTitleColor () -> UIColor {
        return UIColor.black
    }
    /// cell 内容字体颜色
    /// - Returns: 颜色
    static func cellContentColor () -> UIColor {
        return UIColor.black
    }
    /// cell 说明字体颜色
    /// - Returns: 颜色
    static func cellInstructionsColor () -> UIColor {
        return UIColor.black
    }
}
// MARK: - 16进制
extension UIColor {
    static func colorWithHex(hexStr:String, alpha:Float = 1) -> UIColor{
        var cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        
        if(cStr.length < 6){
            return UIColor.clear;
        }
        
        if(cStr.hasPrefix("0x")) {
            cStr = cStr.substring(from: 2) as NSString
        }
        
        if(cStr.hasPrefix("#")){
            cStr = cStr.substring(from: 1) as NSString
        }
        
        if(cStr.length != 6){
            return UIColor.clear;
        }
        
        let rStr = (cStr as NSString).substring(to: 2)
        let gStr = ((cStr as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bStr = ((cStr as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r : UInt32 = 0x0
        var g : UInt32 = 0x0
        var b : UInt32 = 0x0
        
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(alpha));
        
    }
}
