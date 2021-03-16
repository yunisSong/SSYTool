//
//  BaseColletionViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/25.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
这个类要做什么？

*/

protocol BaseCollectionCtrMustMethod:BaseScrollMustMethod {
	func configCell(_ index:IndexPath,_ model:Any,_ cell:UICollectionViewCell)
}
typealias BaseCollectionViewCtr = BaseCollectionViewController & BaseCollectionCtrMustMethod

class BaseCollectionViewController: BaseViewController {

   // MARK: - parameter property
	var collectionView : UICollectionView
	var cellType:String
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

	init(cellType:String,layout:UICollectionViewLayout) {
		self.cellType = cellType
		self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		self.collectionView.backgroundColor = .white
		super.init(nibName: nil, bundle: nil)
	}
	
	convenience init(cellType:String,itemWidth:CGFloat,itemHeigth:CGFloat,scrollDirection:UICollectionView.ScrollDirection = .vertical,lineSpacing:CGFloat = 5.0,itemSpacing:CGFloat = 5.0) {
		let layout = UICollectionViewFlowLayout.init()
		layout.itemSize = CGSize.init(width: itemWidth, height: itemHeigth)
		layout.scrollDirection = scrollDirection
		layout.minimumLineSpacing = lineSpacing
		layout.minimumInteritemSpacing = itemSpacing

		self.init(cellType:cellType,layout:layout)
	}
	convenience init(cellType:String,itemWidth:CGFloat) {

		self.init(cellType:cellType,itemWidth:itemWidth,itemHeigth:itemWidth)
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		beginRefresh()
	}
	deinit {
		print("BaseCollectionViewController deinit")
	}
	// MARK: - config
	//初始化数据
	
	override func loadSubViews() {
		
		guard let ctr = self as? BaseCollectionViewCtr else {
			return;
		}
		//配置 tableview
		collectionView.ssy.addHelp { [weak ctr](help) in
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
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview()
			make.top.bottom.equalToSuperview()
		}
		//配置 刷新和加载更多
		collectionView.ssy.refreshingBlock {
			[weak ctr] in
			ctr?.afterRefresh()
		}
		collectionView.ssy.loadMoreBlock{
			[weak ctr] in
			ctr?.afterLoadMore()
		}
	}
	func withoutMJ()  {
		collectionView.mj_footer = nil;
		collectionView.mj_header = nil;
	}
	func beginRefresh()  {
		collectionView.ssy.beginRefreshing()
	}

	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func afterRefresh(){
		guard let ctr = self as? BaseCollectionViewCtr else {
			return;
		}
		ctr.loadNewData { (model) in
			ctr.collectionView.help.refreshing(models: model)
			ctr.pageIndex = 0;
		}
		
	}
	func afterLoadMore(){
		guard let ctr = self as? BaseCollectionViewCtr else {
			return;
		}
		ctr.loadMoreData { (model) in
			ctr.collectionView.help.loadMore(models: model)
			ctr.pageIndex += 1;
		}
	}
	// MARK: - Private Method
	//私有方法

	// MARK: - Delegate
	//代理方法
	
	// MARK: - Lazy Loads


}
