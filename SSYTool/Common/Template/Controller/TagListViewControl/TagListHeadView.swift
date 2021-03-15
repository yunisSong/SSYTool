//
//  TagListHeadView.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TagListHeadView: UIView {
	var titles :[String]?
	var handle :SYClickEventHandle?
	var config:BaseUIConfig?
	var line = UIView.init()
	var titleViews = Array<UIView>.init()
	
	var index :Int = 0 {
		didSet {
			print(index)
			line.snp.remakeConstraints { (make) in
				make.bottom.equalToSuperview()
				make.centerX.equalTo(titleViews[index])
				make.height.equalTo(1)
				make.width.equalToSuperview().multipliedBy(1.0/Double(titles?.count ?? 1))
			}
			UIView.animate(withDuration: SYDefaultAnimationDuration) {
				self.layoutIfNeeded()

			}
		}
	}
	
	// MARK: - Public Method
	//外部方法
	
	/// 配置页面需要的信息，为了 xib 调用的时候使用，代码初始化的时候不需要调用这个方法
	/// - Parameter titles: 标题数组
	/// - Parameter clickHandle: 点击回调
	func configInfo(titles:[String],clickHandle:@escaping SYClickEventHandle,config:BaseUIConfig = BaseUIConfig.defaultConfig()) {
		self.titles = titles;
		self.handle = clickHandle
		self.config = config
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	// MARK: - Life Cycle
	//系统方法
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	init(titles:[String],clickHandle:@escaping SYClickEventHandle,config:BaseUIConfig = BaseUIConfig.defaultConfig()) {
		super.init(frame: .zero)
		self.configInfo(titles: titles, clickHandle: clickHandle, config: config)
	}
	init() {
		super.init(frame: .zero)
	}
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
		
	}
	
	func settingAppearance() {
	}
	
	func loadSubViews() {
		guard self.titles?.count != 0 else {
			return
		}
		let count = self.titles?.count
		var tempView :UIView?

		self.titles?.enumerated().forEach({ (index,title) in
			let lable = self.creatLabel(title: title, index: index)
			lable.text = title
			titleViews.append(lable)
			self.addSubview(lable)
			if tempView != nil {
				lable.snp.makeConstraints { (make) in
					make.left.equalTo(tempView!.snp.right)
					make.width.height.centerY.equalTo(tempView!)
				}
			}else {
				lable.snp.makeConstraints { (make) in
					make.left.equalTo(self)
					make.width.equalTo(self).multipliedBy(1.0/Double(count ?? 1))
					make.height.equalTo(self).offset(-5)
				}
			}
			tempView = lable

		})
		
		self.addSubview(line)
		line.backgroundColor = config?.underLineBackgroundColor
		line.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview()
			make.centerX.equalTo(titleViews[index])
			make.height.equalTo(1)
			make.width.equalToSuperview().multipliedBy(1.0/Double(count ?? 1))
		}

	}
	
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func showIndex(_ label:UILabel)  {
		print(label.tag)
		index = label.tag
		self.handle?(label.tag,label.text ?? "")
	}
	// MARK: - Private Method
	//私有方法
	func creatLabel(title:String,index:Int) -> UILabel {
		let lable = UILabel.init()
		lable.tag = index
		lable.addClick {
			[weak self] in
			self?.showIndex(lable)
		}
		lable.font = config?.textFont
		lable.textColor = config?.textColor
		lable.textAlignment = .center
		return lable
	}
	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads
}
