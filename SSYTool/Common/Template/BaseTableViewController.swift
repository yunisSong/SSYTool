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
typealias requestData = ()->[Any]?
protocol BaseMustMethod {
	func loadNewDate() ->[BaseModel]?
	func loadMoreDate() ->[BaseModel]?
	func cellClickEvent(_ index:IndexPath,_ model:BaseModel)
	func configCell(_ index:IndexPath,_ model:BaseModel,_ cell:BaseCell)
}
typealias BaseTableViewCtr = BaseTableViewController & BaseMustMethod

class BaseTableViewController: BaseViewController {

 
	// MARK: - parameter property
	var tableView = UITableView.init(frame: .zero, style: .plain)
	var cellType:String
	var pageIndex = 1;
	var pageSize = 20;	
	// MARK: - Public Method
	//外部方法
	required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}

	init(cellType:String) {
		self.cellType = cellType
		super.init(nibName: nil, bundle: nil)
	}
	// MARK: - Life Cycle
	//系统方法
	override func viewDidLoad() {
		super.viewDidLoad()
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		tableView.ssy.addHelp { [weak ctr](help) in
			help.cellID = ctr?.cellType ?? ""
			help.clickHnadle = {
				[weak ctr] index,model in
				ctr?.cellClickEvent(index,model)
			}
			help.configHandle = {
				[weak ctr] index,model,cell in
				ctr?.configCell(index, model, cell)
			}
		}

		view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview()
			make.top.bottom.equalToSuperview()
		}
		
		tableView.ssy.refreshingBlock {
			[weak ctr] in
			ctr?.afterRefresh()
		}
		tableView.ssy.loadMoreBlock{
			[weak ctr] in
			ctr?.afterLoadMore()
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
	func afterRefresh(){
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		let model = ctr.loadNewDate()
		ctr.tableView.help.refreshing(models: model)
		ctr.pageIndex = 0;
	}
	func afterLoadMore(){
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		let model = ctr.loadMoreDate()
		ctr.tableView.help.loadMore(models: model)
		ctr.pageIndex += 1;

	}
	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	// MARK: - Private Method
	//私有方法

	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads


}
