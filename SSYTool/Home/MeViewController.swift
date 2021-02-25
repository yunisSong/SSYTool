//
//  MeViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/14.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		let model = BaseCellLayoutModel()
		model.cellID = "TodoTableViewCell"
		var  tabview = UITableView.init(frame: .zero, style: .plain)

		tabview.ssy.addHelp { help in
			help.dataSource = [BaseCellLayoutModel(),BaseCellLayoutModel(),model,BaseCellLayoutModel(),BaseCellLayoutModel(),BaseCellLayoutModel()]
			help.cellID = "SYTableViewCell"
			help.clickHnadle = {
				[weak self] index,model in
				self?.cellClickEvent(index,model)
			}
//			help.configHandle = {
//				[weak self] index,model,cell in
//				self?.cellConfig(index, model, cell,tabview)
//			}
		}
		view.addSubview(tabview)
		tabview.snp.makeConstraints { (make) in
			make.leading.trailing.bottom.equalToSuperview()
			make.topMargin.equalToSuperview().offset(100)
		}
		tabview.reloadData()
    }
	func cellClickEvent(_ index:IndexPath,_ model:BaseCellLayoutModel)  {
		if index.row == 0 {
			self.navigationController?.pushViewController(MeViewController(), animated: true)
		}
	}
	func cellConfig(_ index:IndexPath,_ model:BaseCellLayoutModel,_ cell:BaseCell,_ tableView:UITableView)  {
//		if (model.cellID == "TodoTableViewCell") {
//			let cell = cell as! TodoTableViewCell
//			cell.frame = tableView.bounds ;
//			cell.layoutIfNeeded()
//			cell.selectImageView?.collectionView.reloadData()
//			//heightConstraint 为内嵌的 collectionView 高度约束
//			let heigth = cell.selectImageView?.collectionView.collectionViewLayout.collectionViewContentSize.height ?? 0.0;
//			print("heigth",heigth)
//			cell.collectionHeigth?.constraint.update(inset: heigth)
//			cell.layoutIfNeeded()
//		}
	}
	deinit {
		print("MeViewController deinit")
	}


}
