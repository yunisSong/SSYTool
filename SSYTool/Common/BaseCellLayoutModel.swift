//
//  BaseCellModel.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/12.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*

request model -> cell model

点击后需要获取 request model

一个页面要有两个数组 网络请求数据数组  页面布局数组


*/

enum CellLayoutType {
	case textField
	case selectNext(nextCtrClass:String)
	case title
	case remark
}

class BaseCellLayoutModel: NSObject {
	
	//MARK: - 通讯相关
	var postKey = ""
	var postValue :Any?

	//MARK: - 布局相关
	var cellType = CellLayoutType.textField
	var cellID = ""
	var canEdit = false
	var textfieldInputType = UIKeyboardType.default
	
	//MARK: - 页面元素
	var leftString = ""
	var leftString_2 = ""
	var leftString_3 = ""
	var rightString = ""
	var rightString_2 = ""
	var rightString_3 = ""
	
	var optionlString = ""
	
	var leftColor : UIColor?
	var leftColor_2 : UIColor?
	var leftColor_3 : UIColor?
	
	var rightColor : UIColor?
	var rightColor_2 : UIColor?
	var rightColor_3 : UIColor?

	
}

//extension BaseCellModel {
//	func configModel(cellType:CellLayoutType = .textField,
//					 canEdit:Bool = false,
//					 leftString:String = "",
//					 leftString_2:String = "",
//					 leftString_3:String = "")
//	{
//		self.cellType = cellType
//	}
//}
