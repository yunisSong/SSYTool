//
//  BaseTagListViewController.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*

选项卡 index

传入数组（标题、视图、控制器）
点击回调

*/
class BaseTagListViewController: BaseViewController {

	var titleHeadView = TagListHeadView.init()
	var baseScrollowView = UIScrollView.init()
	var containerView = UIView.init()
	var contentViews = Array<UIView>.init()
	var contentCtrs = Array<UIViewController>.init()

	// MARK: - Public Method
	//外部方法
	func config(titles:[String],contentViews:[UIView],config:BaseUIConfig = BaseUIConfig.defaultConfig()) {
		self.config(titles: titles, contentViews: contentViews, contentCtrs: [], config: config)
	}
	func config(titles:[String],contentCtrs:[UIViewController],config:BaseUIConfig = BaseUIConfig.defaultConfig()) {
		self.config(titles: titles, contentViews: contentCtrs.map({$0.view}), contentCtrs: contentCtrs, config: config)

	}
	func config(titles:[String],contentViews:[UIView],contentCtrs:[UIViewController],config:BaseUIConfig = BaseUIConfig.defaultConfig()) {
		let hanle = self.showIndex(_:_:)
		self.titleHeadView.configInfo(titles: titles, clickHandle: hanle,config: config)
		self.contentViews.append(contentsOf: contentViews)
		self.contentCtrs.append(contentsOf: contentCtrs)

		assignDate()
		settingAppearance()
		loadSubViews()
	}

	// MARK: - Life Cycle
	//系统方法
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	// MARK: - Intial Methods
	//初始化数据
	override func assignDate() {
		super.assignDate()
		contentCtrs.forEach { (ctr) in
			self.addChild(ctr)
		}
	}
	
	override func settingAppearance() {
		super.settingAppearance()
		
		self.edgesForExtendedLayout = []
		baseScrollowView.delegate = self;
		baseScrollowView.isPagingEnabled = true
		baseScrollowView.showsVerticalScrollIndicator = false
		baseScrollowView.showsHorizontalScrollIndicator = false
	}
	
	override func loadSubViews() {
		super.loadSubViews()

		view.addSubview(titleHeadView)
		view.addSubview(baseScrollowView)
		baseScrollowView.addSubview(containerView)
		
		titleHeadView.snp.makeConstraints { (make) in
			make.left.right.top.equalToSuperview()
			make.height.equalTo(60)
		}
		
		baseScrollowView.snp.makeConstraints { (make) in
			make.left.right.bottom.equalToSuperview()
			make.top.equalTo(titleHeadView.snp.bottom).offset(SYDefaultViewOffset)
		}
		containerView.snp.makeConstraints { (make) in
			make.left.right.bottom.top.equalToSuperview()
			make.height.equalToSuperview()
		}
		
		var tempView :UIView?
		contentViews.enumerated().forEach { (index,subView) in
			containerView.addSubview(subView)
			subView.snp.makeConstraints { (make) in
				make.width.equalTo(baseScrollowView)
				make.top.bottom.equalToSuperview()
				if let tempView = tempView {
					make.left.equalTo(tempView.snp.right)
				}else{
					make.left.equalToSuperview()
				}
				if index == contentViews.count - 1 {
					make.right.equalToSuperview()

				}
			}
			tempView = subView
		}

		
	}
	
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func showIndex(_ index:Int,_ title:String)  {
		let width = baseScrollowView.bounds.width
		self.baseScrollowView.setContentOffset(CGPoint.init(x: CGFloat(index) * width, y: 0), animated: YES)
	}
	// MARK: - Private Method
	//私有方法
	
	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads
}

extension BaseTagListViewController : UIScrollViewDelegate {
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let dragToDragStop = !scrollView.isTracking && !scrollView.isDragging && !scrollView.isDecelerating
		if dragToDragStop {
			self.scrollViewDidEndScroll(scrollView)
		}
	}
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		if !decelerate {
			let dragToDragStop = scrollView.isTracking && !scrollView.isDragging && !scrollView.isDecelerating
			if dragToDragStop {
				self.scrollViewDidEndScroll(scrollView)
			}
		}
	}

	private func scrollViewDidEndScroll(_ scrollView: UIScrollView)  {
		let offsetX = scrollView.contentOffset.x
		let press = offsetX / scrollView.bounds.width
		titleHeadView.index = Int(press)

	}



}
