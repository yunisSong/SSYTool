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
   	open class var viewNavgationTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
    /// 导航栏按钮字体
   	open class var viewNavgationBarFont: UIFont { return UIFont.boldSystemFont(ofSize: 16) }

    // MARK: - tableview section 相关
    /// section 标题字体
   	open class var sectionTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
    /// section 内容字体
   	open class var sectionContentFont: UIFont { return UIFont.boldSystemFont(ofSize: 16) }

    // MARK: - tableview cell 相关
    /// cell 标题字体
   	open class var cellTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 16) }
    /// cell 内容字体
   	open class var cellContentFont: UIFont { return UIFont.boldSystemFont(ofSize: 14) }
    /// cell 说明字体
   	open class var cellInstructionsFont: UIFont { return UIFont.boldSystemFont(ofSize: 10) }
}
