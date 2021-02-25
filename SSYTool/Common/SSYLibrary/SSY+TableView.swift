//
//  SSY+TableView.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation

///为 tableview 添加一个帮助类 用来处理代理和数据源
extension UITableView {
	private static var syHelp:Void?
	var help:SYTableViewHelp{
		
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syHelp))
			if let hl = hl {
				return hl as! SYTableViewHelp
			}
			let help = SYTableViewHelp()
			self.help = help
			return help
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syHelp), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
}

extension SSYHelp where Base: UITableView {
	
	mutating func addHelp(help:(SYTableViewHelp)->Void)  {
		self.configuration()
		self.base.help.tab = self.base
		self.base.delegate = self.base.help
		self.base.dataSource = self.base.help
		help(self.base.help)
		self.ss_register(self.base.help.cellID)
		self.base.help.dataSource?.forEach { model in
			self.ss_register(model.cellID)
		}
	}
	
	
	/// 注册 cell 只支持 xib
	/// - Parameter cellID: xib 名 或者 类名
	private func ss_register(_ cellID:String)
	{
		guard cellID.count > 0 else { return }
		self.base.register(UINib.init(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
	}
	
	/// 统一设置 tableview 样式
	private func configuration()  {
		self.base.separatorStyle = .none

	}
	
	
}
extension SSYHelp where Base: UITableView
{
	func refreshingBlock(_ handle:@escaping ()->Void) {
		self.base.mj_header = MJRefreshNormalHeader.init(refreshingBlock:handle)
	}
	func endRefreshing()  {
		self.base.mj_header?.endRefreshing()
	}

	func loadMoreBlock(_ handle:@escaping ()->Void) {
		self.base.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: handle)
	}
	func endLoadMore()  {
		self.base.mj_footer?.endRefreshing()
	}
}


