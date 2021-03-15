//
//  UILabel+config.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/10.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
extension UILabel {
	class func cellTitleLabel() -> UILabel {
		let label = UILabel.init()
		label.configCellTitle()
		return label
	}
	func configCellTitle()  {
		self.setStyle(font: .cellTitleFont, textColor: .cellTitleColor)
	}
	func configCellContent()  {
		self.setStyle(font: .cellContentFont, textColor: .cellContentColor)
	}
	func setStyle(font:UIFont,textColor:UIColor,bgColor:UIColor = .clear)  {
		self.font = font
		self.textColor = textColor
		self.backgroundColor = bgColor;
	}
}
