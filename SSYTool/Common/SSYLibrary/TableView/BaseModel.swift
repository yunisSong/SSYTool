//
//  BaseModel.swift
//  SSYTool
//
//  Created by Yunis on 2021/2/26.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class BaseModel: NSObject {

}

protocol BaseCellConfigProtocol {
	func configModel(model:BaseModel)
}

// MARK: - 布局cell 基类
class BaseCell: UITableViewCell {
	func configModel(model:BaseModel)
	{
		
	}
}
