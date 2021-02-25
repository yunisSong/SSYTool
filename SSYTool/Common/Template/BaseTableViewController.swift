//
//  BaseTableViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/25.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
这个类要做什么？

*/
protocol baseMusrMethod {
	func loadNewDate()
	func loadMoreDate()
	func cellClickEvent(_ index:IndexPath,_ model:BaseCellLayoutModel)
	func configCell(_ index:IndexPath,_ model:BaseCellLayoutModel,_ cell:BaseCell)
}
class BaseTableViewController: BaseViewController,baseMusrMethod {

 
	// MARK: - parameter property
	var tableView = UITableView.init(frame: .zero, style: .plain)
	var cellType:String = ""
	var pageIndex = 1;
	var pageSize = 20;
	
	// MARK: - Public Method
	//外部方法
	required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}

	init(cellType:String,models:[BaseCellLayoutModel]) {
		self.cellType = cellType
		super.init(nibName: nil, bundle: nil)
	}
	// MARK: - Life Cycle
	//系统方法
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.ssy.addHelp { [weak self](help) in
			help.cellID = self?.cellType ?? ""
			help.clickHnadle = {
				[weak self] index,model in
				self?.cellClickEvent(index,model)
			}
			help.configHandle = {
				[weak self] index,model,cell in
				self?.configCell(index, model, cell)
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
	func configCell(_ index:IndexPath,_ model:BaseCellLayoutModel,_ cell:BaseCell)  {

	}
	// MARK: - Private Method
	//私有方法

	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads


}
