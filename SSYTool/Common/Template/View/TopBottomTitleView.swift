//
//  TopBottomTitleView.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TopBottomTitleView: UIView {

	var topTitle :String? {
		didSet {
			self.topLabel.text = topTitle
		}
	}
	var bottomTitle :String?
	{
		didSet {
			self.bottomLabel.text = bottomTitle
		}
	}
	lazy var topLabel :UILabel = {
		let labele = UILabel.init()
		labele.configCellTitle()
		labele.textAlignment = NSTextAlignment.center
		labele.backgroundColor = .green
		return labele
	}()

	lazy var bottomLabel :UILabel = {
		let labele = UILabel.init()
		labele.configCellTitle()
		labele.textAlignment = NSTextAlignment.center
		labele.backgroundColor = .yellow

		return labele
	}()
	



	// MARK: - Public Method
	//外部方法
	func config(topTitle:String,bottomTitle:String)  {
		self.topTitle = topTitle
		self.bottomTitle = bottomTitle

		assignDate()
		settingAppearance()
		loadSubViews()
	}
	// MARK: - Life Cycle
	//系统方法
	init(topTitle:String,bottomTitle:String) {
		super.init(frame: .zero)
		
		self.config(topTitle: topTitle, bottomTitle: bottomTitle)
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
		
	}
	
	func settingAppearance() {
		self.backgroundColor = .white

	}
	
	func loadSubViews() {
		self.addSubview(self.topLabel)
		self.addSubview(self.bottomLabel)
		self.topLabel.snp.makeConstraints { (make) in
			make.left.greaterThanOrEqualTo(self)
			make.right.lessThanOrEqualTo(self)
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().offset(0)
		}
		self.bottomLabel.snp.makeConstraints { (make) in
			make.left.greaterThanOrEqualTo(self)
			make.right.lessThanOrEqualTo(self)
			make.centerX.equalToSuperview()
			make.top.equalTo(topLabel.snp.bottom).offset(0)
			make.bottom.equalToSuperview().offset(0)

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
