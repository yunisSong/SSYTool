//
//  SSY+UIImage.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
extension UIColor:SSYCompatible{}

///转换为 纯色图片
extension SSYHelp where Base: UIColor {
	func toImage() -> UIImage? {
		return toImage(size: CGSize.init(width: 1.0, height: 1.0))
	}
	func toImage(size:CGSize) -> UIImage? {
		let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		context?.setFillColor(self.base.cgColor)
		context?.fill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
}
