//
//  SSYRoundedCornersLabel.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class SSYRoundedCornersLabel: UIView {
	var label = UILabel.init()
	var text: String {
		didSet {
			self.label.text = text
		}
	}
	var font: UIFont {
		didSet {
			self.label.font = font
		}
	}
	var textColor: UIColor {
		didSet {
			self.label.textColor = textColor
		}
	}
	var inset: UIEdgeInsets {
		didSet {
			self.label.snp.remakeConstraints { (make) in
				make.edges.equalTo(self).inset(inset)
			}
		}
	}
	
	required init?(coder: NSCoder) {
		self.text = ""
		self.font = .systemFont(ofSize: 16.0)
		self.textColor = .black
		self.inset = .init(top: 12, left: 12, bottom: 12, right: 12);
		super.init(coder:coder)
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	override init(frame: CGRect) {
		self.text = ""
		self.font = .systemFont(ofSize: 16.0)
		self.textColor = .black
		self.inset = .init(top: 12, left: 12, bottom: 12, right: 12);
		super.init(frame: frame)
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.ssy.corner(byRoundingCorners: .allCorners, radii: self.bounds.height/2.0, borderColor: .clear, borderWidth: 0.5)
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
		self.addSubview(self.label)
		self.label.snp.makeConstraints { (make) in
			make.edges.equalTo(self).inset(self.inset)
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
