//
//  BaseUIConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
字体
颜色 选中色 选中背景色
背景色
间距
下划线颜色

*/
class BaseUIConfig: NSObject {
	var textFont = UIFont.systemFont(ofSize: 16.0)
	var selectedtextColor = UIFont.systemFont(ofSize: 16.0)

	var textColor = UIColor.black
	var selectedTextColor = UIColor.orange

	var backgroundColor = UIColor.white
	var selectedBackgroundColor = UIColor.orange

	var underLineBackgroundColor = UIColor.orange


	static func defaultConfig() -> BaseUIConfig {
		let config  = BaseUIConfig()
		return config
	}
}
