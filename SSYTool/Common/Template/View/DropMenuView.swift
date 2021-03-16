//
//  DropMenuView.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
1. 传入菜单样式  cell
2. 传入位置 提供计算方法
3. 传入视图宽度
4. 传出点击事件


*/
class DropMenuView: UIView {
	var cellXibString :String? {
	   didSet {
		   tableView.ssy.ssy_register(nib: cellXibString ?? "")
	   }
	}
	var layoutAssociatedView :UIView?
	var menusWidth : CGFloat = 0
	var menusHeigth : CGFloat = 0
	var handle :SYClickEventHandle?
	var offset:CGFloat = 0
	
	lazy var tableView :UITableView = {
		var tab = UITableView.init(frame: .zero, style: .plain)
		return tab
	}()
	// MARK: - Public Method
	//外部方法
	func config(cell:String,layoutAssociatedView:UIView,offset:CGFloat = 0,width:CGFloat = 150,heigth:CGFloat = 200,handle:@escaping SYClickEventHandle)  {
		self.cellXibString = cell
		self.layoutAssociatedView = layoutAssociatedView
		self.menusWidth = width
		self.menusHeigth = heigth
		self.handle = handle
		self.offset = offset
		
		assignDate()
		settingAppearance()
		loadSubViews()
	}
	// MARK: - Life Cycle
	//系统方法
	init(cell:String,layoutAssociatedView:UIView,offset:CGFloat = 0,width:CGFloat = 150,heigth:CGFloat = 200,handle:@escaping SYClickEventHandle) {
		super.init(frame: .zero)
		self.config(cell: cell, layoutAssociatedView: layoutAssociatedView, offset: offset, width: width, heigth: heigth, handle: handle)
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	// MARK: - Intial Methods
	//初始化数据
	func assignDate() {
	}
	
	func settingAppearance() {
	}
	
	func loadSubViews() {
		//配置 tableview
		tableView.ssy.addHelp { [weak self](help) in
			help.cellID = self?.cellXibString ?? ""
			help.clickHnadle = {
				[weak self] index,model in
				self?.handle?(index.row,"")
			}
			help.configHandle = {
				[weak self] index,model,cell in
//				self?.configCell(index, model, cell)
			}
			help.dataSource = []
		}
		self.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview()
			make.top.bottom.equalToSuperview()
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
