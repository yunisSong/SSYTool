//
//  SSY+TableView.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation

///为 tableview 添加一个帮助类 用来处理代理和数据源

//TODO: 添加空数据时候的占位视图
typealias SYCellClickIndexHandle = (IndexPath)->Void
typealias SYCellClickHandle = (IndexPath,Any)->Void
typealias SYCellConfigHandle = (IndexPath,Any,UITableViewCell)->Void

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
		self.base.ssy.ssy_register(nib: self.base.help.cellID)
		self.base.help.dataSource?.forEach { model in
			guard let model = model as? BaseCellLayoutModel else {
				return
			}
			print(model)
			self.base.ssy.ssy_register(nib: model.cellID)
		}
	}
	/// 统一设置 tableview 样式
	private func configuration()  {
		self.base.separatorStyle = .none

	}
	
	
}
extension SSYHelp where Base: UITableView
{
	func beginRefreshing()  {
		self.base.mj_header?.beginRefreshing()
	}
	func refreshingBlock(_ handle:@escaping ()->Void) {
		self.base.mj_header = MJRefreshNormalHeader.init(refreshingBlock:handle)
	}
	func endRefreshing()  {
		self.base.mj_header?.endRefreshing()
	}

	func beginLoadMore()  {
		self.base.mj_footer?.beginRefreshing()
	}
	func loadMoreBlock(_ handle:@escaping ()->Void) {
		self.base.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: handle)
	}
	func endLoadMore()  {
		self.base.mj_footer?.endRefreshing()
	}
}


class SYTableViewHelp: NSObject {
	var dataSource : [Any]?
	var cellID = ""
	var clickHnadle: SYCellClickHandle?
	var clickIndexHnadle: SYCellClickIndexHandle?
	var configHandle: SYCellConfigHandle?
	
	weak var tab:UITableView?
	
	func refreshing(models:[Any]?)  {
		self.dataSource = models
		self.tab?.ssy.endRefreshing()
		tab?.reloadData()
	}
	func loadMore(models:[Any]?)  {
		self.dataSource?.append(contentsOf: models ?? [])
		self.tab?.ssy.endLoadMore()
		tab?.reloadData()
	}
	
	deinit {
		print("SYTableViewHelp deinit")
	}

}
	// MARK: - 帮助类扩展 UITableViewDelegate
extension SYTableViewHelp:UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let model = dataSource?[indexPath.row]
		clickHnadle?(indexPath,model!)
		clickIndexHnadle?(indexPath)
	}
}
// MARK: - 帮助类扩展 UITableViewDataSource
extension SYTableViewHelp:UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.mj_footer?.isHidden = dataSource?.count == 0
		return dataSource?.count ?? 0
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell:UITableViewCell
		let model = dataSource?[indexPath.row]
		if let model = model as? BaseCellLayoutModel ,model.cellID.count > 0{
			cell = tableView.dequeueReusableCell(withIdentifier: model.cellID, for: indexPath)
		}else{
			cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
		}
		if let bcell = cell as? BaseCell {
			bcell.configModel(model: model!)
		}
		configHandle?(indexPath,model!,cell)
		return cell
	}
}

