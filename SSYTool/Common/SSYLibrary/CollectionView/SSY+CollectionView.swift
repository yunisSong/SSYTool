//
//  SSY+CollectionView.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
typealias SYCollectionCellClickHandle = (IndexPath,BaseModel)->Void
typealias SYCollectionCellConfigHandle = (IndexPath,BaseModel,BaseCollectionCell)->Void

extension UICollectionView {
	private static var syHelp:Void?
	var help:SYCollectionViewHelp{
		
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syHelp))
			if let hl = hl {
				return hl as! SYCollectionViewHelp
			}
			let help = SYCollectionViewHelp()
			self.help = help
			return help
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syHelp), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
}

extension SSYHelp where Base: UICollectionView {
	
	mutating func addHelp(help:(SYCollectionViewHelp)->Void)  {
		
		self.configuration()
		self.base.help.collView = self.base
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

		
	}
	
	
}
extension SSYHelp where Base: UICollectionView
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


class SYCollectionViewHelp: NSObject {
	var dataSource : [BaseModel]?
	var cellID = ""
	var clickHnadle: SYCollectionCellClickHandle?
	var configHandle: SYCollectionCellConfigHandle?
	
	weak var collView:UICollectionView?
	
	func refreshing(models:[BaseModel]?)  {
		self.dataSource = models
		collView?.ssy.endRefreshing()
		collView?.reloadData()
	}
	func loadMore(models:[BaseModel]?)  {
		self.dataSource?.append(contentsOf: models ?? [])
		collView?.ssy.endLoadMore()
		collView?.reloadData()
	}
	
	deinit {
		print("SYTableViewHelp deinit")
	}

}
	// MARK: - 帮助类扩展 UITableViewDelegate
extension SYCollectionViewHelp:UICollectionViewDelegate
{

}
// MARK: - 帮助类扩展 UITableViewDataSource
extension SYCollectionViewHelp:UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		collectionView.mj_footer?.isHidden = dataSource?.count == 0
		return dataSource?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell:UICollectionViewCell
		let model = dataSource?[indexPath.row]
		if let model = model as? BaseCellLayoutModel ,model.cellID.count > 0{
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellID, for: indexPath)
		}else{
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
		}
		let bcell = cell as! BaseCollectionCell
		bcell.configModel(model: model!)
		configHandle?(indexPath,model!,bcell)
		return cell
	}
	

}
