//
//  SSY+TableViewHelp.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
/*

设置cellid
设置数据源
设置点击回调

view.ssy.doSomething()
button.ssy.doSomething()
ctr.ssy.doSomething()
string.ssy.doSomething()
Array.ssy.doSomething()

*/


// MARK: - 布局cell 基类
class BaseCell: UITableViewCell {
	func configModel(model:BaseCellLayoutModel)
	{
		
	}
}


// MARK: - table帮助类
class SYTableViewHelp: NSObject {
	
	var dataSource : [BaseCellLayoutModel]?
	var cellID = ""
	var clickHnadle: SYCellClickHandle?
	var configHandle: SYCellConfigHandle?
	
	weak var tab:UITableView?
	
	func refreshing(models:[BaseCellLayoutModel]?)  {
		self.dataSource = models
		tab?.reloadData()
	}
	func loadMore(models:[BaseCellLayoutModel]?)  {
		self.dataSource?.append(contentsOf: models ?? [])
		tab?.reloadData()
	}
	
	deinit {
		print("SYTableViewHelp deinit")
	}

}
// MARK: - 帮助类扩展
extension SYTableViewHelp:UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let model = dataSource?[indexPath.row]
		
		clickHnadle?(indexPath,model!)
	}
}
// MARK: - 帮助类扩展
extension SYTableViewHelp:UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.mj_footer?.isHidden = dataSource?.count == 0
		return dataSource?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = dataSource?[indexPath.row]
	
		var cell:UITableViewCell
		if (model?.cellID.count ?? 0) > 0 {
			cell = tableView.dequeueReusableCell(withIdentifier: model?.cellID ?? cellID, for: indexPath)
		}else
		{
			cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

		}
		let bcell = cell as! BaseCell
		bcell.configModel(model: model!)
		configHandle?(indexPath,model!,bcell)
		
		return cell
	}
}
