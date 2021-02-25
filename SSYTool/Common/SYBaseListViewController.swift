//
//  SYBaseViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/9.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
import SnapKit
/*

1. 页面带有一个 tableview 若干按钮 自定义 导航栏
2. 刷新回调 加载更多回调
3. 设置 数据源
4. 点击事件回调

封装 tableview？


*/
class SYBaseListViewController: UIViewController{
	
	// MARK: - parameter property
	var tableView = UITableView.init(frame: .zero, style: .plain)
	var cellType:String = ""
	var listSource:[BaseCellLayoutModel]
	

	// MARK: - Public Method
	//外部方法
	required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}

	init(cellType:String,models:[BaseCellLayoutModel]) {
		self.cellType = cellType
		self.listSource = models
		super.init(nibName: nil, bundle: nil)
	}
	// MARK: - Life Cycle
	//系统方法
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.ssy.addHelp { [weak self](help) in
			help.dataSource = self?.listSource
			help.cellID = self?.cellType ?? ""
			help.clickHnadle = {
				[weak self] index,model in
				self?.cellClickEvent(index,model)
			}
		}

		view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview()
			make.top.bottom.equalToSuperview()
		}
		
		tableView.ssy.refreshingBlock {
			[weak self] in
			self?.loadNewDate()
		}
		tableView.ssy.loadMoreBlock{
			[weak self] in
			self?.loadMoreDate()
		}

		assignDate()
		settingAppearance()
		loadSubViews()
	}
	deinit {
		print("SYBaseListViewController deinit")
	}
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
		
	}
	
	func settingAppearance() {
		
	}
	
	func loadSubViews() {
		
	}
	
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func loadNewDate()   {
		
	}
	func loadMoreDate()   {
		
	}
	func cellClickEvent(_ index:IndexPath,_ model:BaseCellLayoutModel)  {

	}
	// MARK: - Private Method
	//私有方法

	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads


}

