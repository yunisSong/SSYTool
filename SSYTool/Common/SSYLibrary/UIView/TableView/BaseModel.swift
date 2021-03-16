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
	func configModel(model:Any)
}

// MARK: - 布局cell 基类
class BaseCell: UITableViewCell {
	func configModel(model:Any)
	{
		
	}
}
class BaseCollectionCell: UICollectionViewCell {
	func configModel(model:Any)
	{
		
	}
}
