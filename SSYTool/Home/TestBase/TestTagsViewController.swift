//
//  TestTagsViewController.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TestTagsViewController: BaseTagListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		var view1 = UIView.init()
		view1.backgroundColor = .red
		
		var view2 = UIView.init()
		view2.backgroundColor = .blue
		
		var view3 = UIView.init()
		view3.backgroundColor = .orange
		
		let model = BaseCellLayoutModel()
		model.cellID = "TodoTableViewCell"
		let ctr = TestBase1ViewController.init()
		ctr.cellType = "SYTableViewCell";
//		self.config(titles: ["1","2","3"], contentViews: [view1,view2,view3])
		self.config(titles: ["1","2","3"], contentCtrs: [BaseViewController(),ctr,BaseViewController()])

    }
    

}
