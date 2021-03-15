//
//  BaseViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/25.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
这个类要做什么？

nav 样式 是否隐藏

背景色
 
通讯框
 


*/
class BaseViewController: UIViewController {

	// MARK: - Public Method
	//外部方法
	
	// MARK: - Life Cycle
	//系统方法
	override func viewDidLoad() {
		super.viewDidLoad()
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
		
	}
	
	func settingAppearance() {
		view.backgroundColor = .viewBGColor
	}
	
	func loadSubViews() {
		
	}
	
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	
	// MARK: - Private Method
	//私有方法
	
	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads
    
}
