//
//  SYTodoViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/9.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
class SYTodoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		var tabview = UITableView.init(frame: .zero, style: .plain)
		tabview.ssy.addHelp { help in
			help.dataSource = [BaseCellLayoutModel(),BaseCellLayoutModel(),BaseCellLayoutModel(),BaseCellLayoutModel(),BaseCellLayoutModel(),BaseCellLayoutModel()]
			help.cellID = "SYTableViewCell"
			help.clickHnadle = {
				[weak weakSelf = self] index,model in
				print(index,model)
				if index.row == 0 {
					weakSelf?.navigationController?.pushViewController(MeViewController(), animated: true)
				}
			}

				
		}
//		tabview.registerNib(nib: "SYTableViewCell")
		view.addSubview(tabview)
		tabview.snp.makeConstraints { (make) in
			make.leading.trailing.top.bottom.equalToSuperview()
		}
		tabview.reloadData()
		
    }
	deinit {
		print("SYTodoViewController deinit")
	}

}
