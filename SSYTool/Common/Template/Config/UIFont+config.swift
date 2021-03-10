//
//  UIFontConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

extension UIFont {
    // MARK: - 页面、导航栏相关
    /// 页面标题文字
    /// - Returns: 字体
    static func viewNavgationTitleFont () -> UIFont {
        return UIFont.boldSystemFont(ofSize: 18)
    }
    /// 导航栏按钮字体
    /// - Returns: 字体
    static func viewNavgationBarFont () -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    // MARK: - tableview section 相关
    /// section 标题字体
    /// - Returns: 字体
    static func sectionTitleFont () -> UIFont {
        return UIFont.boldSystemFont(ofSize: 18)
    }
    /// section 内容字体
    /// - Returns: 字体
    static func sectionContentFont () -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    // MARK: - tableview cell 相关
    /// cell 标题字体
    /// - Returns: 字体
    static func cellTitleFont () -> UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    /// cell 内容字体
    /// - Returns: 字体
    static func cellContentFont () -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    /// cell 说明字体
    /// - Returns: 字体
    static func cellInstructionsFont () -> UIFont {
        return UIFont.systemFont(ofSize: 10)
    }
}
