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
简单高效完成一个页面包含列表的布局。传入 cellID
基于 BaseTableViewController 的子类要遵循 BaseTableViewCtr
*/

typealias requestDataHandle = ([BaseModel]?)->Void
protocol BaseScrollMustMethod {
	func loadNewData(handle:@escaping requestDataHandle) -> Void
	func loadMoreData(handle:@escaping requestDataHandle) ->Void
	func cellClickEvent(_ index:IndexPath,_ model:BaseModel)
}
protocol BaseTableCtrMustMethod:BaseScrollMustMethod {
	func configCell(_ index:IndexPath,_ model:BaseModel,_ cell:BaseCell)
}
typealias BaseTableViewCtr = BaseTableViewController & BaseTableCtrMustMethod

class BaseTableViewController: BaseViewController {
	// MARK: - parameter property
	var tableView = UITableView.init(frame: .zero, style: .plain)
	var cellType:String = "" {
		didSet {
			tableView.ssy.ssy_register(nib: cellType)
		}
	}
	var pageIndex = 1;
	var pageSize = 20;
	var clickHnadle: SYCellClickHandle?
	// MARK: - Public Method
	//外部方法

	// MARK: - Life Cycle
	//系统方法
	required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}

	init(cellType:String) {
		self.cellType = cellType
		super.init(nibName: nil, bundle: nil)
	}
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		beginRefresh()

	}
	deinit {
		print("SYBaseListViewController deinit")
	}
	// MARK: - config
	//初始化数据
	override func loadSubViews() {
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		//配置 tableview
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
		
		//配置 刷新和加载更多
		tableView.ssy.refreshingBlock {
			[weak ctr] in
			ctr?.afterRefresh()
		}
		tableView.ssy.loadMoreBlock{
			[weak ctr] in
			ctr?.afterLoadMore()
		}
	}
	func withoutMJ()  {
		tableView.mj_footer = nil;
		tableView.mj_header = nil;
	}
	func beginRefresh()  {
		tableView.ssy.beginRefreshing()
	}

	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func afterRefresh(){
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		ctr.loadNewData { (model) in
			ctr.tableView.help.refreshing(models: model)
			ctr.pageIndex = 0;
		}
		
	}
	func afterLoadMore(){
		guard let ctr = self as? BaseTableViewCtr else {
			return;
		}
		ctr.loadMoreData { (model) in
			ctr.tableView.help.loadMore(models: model)
			ctr.pageIndex += 1;
		}
	}
	// MARK: - Private Method
	//私有方法

	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads


}
