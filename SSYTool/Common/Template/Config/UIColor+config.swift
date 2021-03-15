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
	open class var viewBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格背景色
	open class var tableBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 section 背景色
	open class var sectionBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 cell 背景色
	open class var cellBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 cell 分割视图背景色
	open class var cellSplitBGColor: UIColor { return UIColor.white } // 0.0 white
	open class var buttonBGColor: UIColor { return UIColor.white } // 0.0 white
}
// MARK: - 字体颜色
extension UIColor {
    // MARK: - 页面、导航栏相关
    /// 页面标题文字颜色
	open class var viewNavgationTitleColor: UIColor { return UIColor.black } // 0.0 white
    /// 导航栏按钮字体颜色
	open class var viewNavgationBarColor: UIColor { return UIColor.black } // 0.0 white

    
    // MARK: - tableview section 相关
    /// section 标题字体颜色
	open class var sectionTitleColor: UIColor { return UIColor.black } // 0.0 white
    /// section 内容字体颜色
	open class var sectionContentColor: UIColor { return UIColor.black } // 0.0 white
    
    // MARK: - tableview cell 相关
    /// cell 标题字体颜色
	open class var cellTitleColor: UIColor { return UIColor.black } // 0.0 white

    /// cell 内容字体颜色
	open class var cellContentColor: UIColor { return UIColor.black } // 0.0 white

    /// cell 说明字体颜色
	open class var cellInstructionsColor: UIColor { return UIColor.black } // 0.0 white

}
// MARK: - 16进制
