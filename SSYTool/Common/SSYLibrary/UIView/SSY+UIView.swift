//
//  SSY+UIView.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation

extension UIView:SSYCompatible{}
extension SSYHelp where Base: UIView
{
	/// 添加圆角
	/// - Parameter corners: 添加圆角的位置
	/// - Parameter radii: 圆角大小
	/// - Parameter borderColor: 边框颜色
	/// - Parameter borderWidth: 边框宽度
	func corner(byRoundingCorners corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight], radii: CGFloat=5,borderColor:UIColor = .clear,borderWidth:CGFloat = 1) {
        let maskPath = UIBezierPath(roundedRect: self.base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
		maskLayer.frame = self.base.bounds
        maskLayer.path = maskPath.cgPath
		maskLayer.borderColor = borderColor.cgColor
		maskLayer.borderWidth = borderWidth
        self.base.layer.mask = maskLayer
    }
}

extension SSYHelp where Base: UIView {
	func parentCell() -> UITableViewCell? {
		var view:UIView? = self.base
		var conditions = true
		
		while conditions {
			if view is UITableViewCell {
				conditions = false
				return view as? UITableViewCell
			}else {
				if view?.superview == nil {
					conditions = false
				}
				view = view?.superview
			}
		}
		return nil
	}
	
	func parentTableView() -> UITableView? {
		var view:UIView? = self.base
		var conditions = true
		
		while conditions {
			if view is UITableView {
				conditions = false
				return view as? UITableView
			}else {
				if view?.superview == nil {
					conditions = false
				}

				view = view?.superview

			}
		}
		return nil
	}
}
