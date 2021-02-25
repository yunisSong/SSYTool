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
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
		maskLayer.frame = self.base.bounds
        maskLayer.path = maskPath.cgPath
		maskLayer.borderColor = UIColor.red.cgColor
		maskLayer.borderWidth = 1


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
