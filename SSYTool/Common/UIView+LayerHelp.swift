//
//  CommonLayer.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/9.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
import UIKit

//extension UIView {
//
//    /// 部分圆角
//    ///
//    /// - Parameters:
//    ///   - corners: 需要实现为圆角的角，可传入多个
//    ///   - radii: 圆角半径
//    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
//        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = self.bounds
//        maskLayer.path = maskPath.cgPath
//		maskLayer.borderColor = UIColor.red.cgColor
//		maskLayer.borderWidth = 1
//
//
//        self.layer.mask = maskLayer
//    }
//}

// 加载框
extension UIView {
	private static var loadingKEY:Void?

	var loadingView:UIView{
		get {
			// 使用关联数据获取
			return ((objc_getAssociatedObject(self, &(Self.loadingKEY))) as? UIView ?? UIView()) 
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.loadingKEY), newValue, .OBJC_ASSOCIATION_RETAIN)
		}
	}
	func loading()  {
		fatalError()
	}
	func hiddenLoading()  {
		fatalError()
	}
}

extension UIViewController {
	
}
