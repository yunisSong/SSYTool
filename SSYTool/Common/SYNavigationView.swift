//
//  SYNavigationView.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/9.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
返回按钮 标题 右侧按钮
返回点击回调
右侧按钮点击回调
*/
enum RightButtonType {
	case None
	case Done(title:String,image:String)
	case Edit(title:String,image:String)
}

class SYNavigationView: UIView {


	var buttonType:RightButtonType
	var title: String?
	var backHandle:SYClickHandle?
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	init(title: String,buttonType:RightButtonType = .None,handle:@escaping SYClickHandle) {
		
		self.title = title
		self.backHandle = handle
		self.buttonType = buttonType

		super.init(frame:.zero)
		
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	// MARK: - Public Method
	//外部方法
	
	// MARK: - Life Cycle
	//系统方法
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
		
	}
	
	func settingAppearance() {
		
	}
	
	func loadSubViews() {
		let baseView = UIView.init(frame: .zero)
		baseView.backgroundColor = .clear
		self.addSubview(baseView)
		baseView.snp.makeConstraints { (m) in
			m.leading.trailing.top.bottom.equalToSuperview()
		}
		
		
	}
	
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	
	// MARK: - Private Method
	//私有方法
	
	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads
	

}
