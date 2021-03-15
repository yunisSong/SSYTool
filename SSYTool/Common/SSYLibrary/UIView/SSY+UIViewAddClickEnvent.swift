//
//  SSY+UIViewAddClickEnvent.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
extension UIView {
	private static var syClickHandleKey:Void?
	var clickHandle:SYEventHandle?{
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syClickHandleKey))
			if let hl = hl {
				return (hl as! SYEventHandle)
			}
			return nil
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syClickHandleKey), newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
		}
	}
	func addClick(handle:@escaping SYEventHandle) {
		self.clickHandle = handle
		self.isUserInteractionEnabled = true
		let ctl = UIControl.init(frame: self.bounds)
		self.addSubview(ctl)
		ctl.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		ctl.addTarget(self, action: #selector(click), for: .touchUpInside)
		
	}
	@objc func click()  {
		self.clickHandle?()
	}
}
