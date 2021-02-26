//
//  TestBase1ViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/25.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TestBase1ViewController: BaseTableViewCtr {

	

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
}

extension TestBase1ViewController {
	func loadNewDate() -> [BaseModel]? {
		let model = BaseModel()
		return [model,model,model]
	}
	
	func loadMoreDate() -> [BaseModel]? {
		let model = BaseModel()
		return [model,model,model]
	}
	
	func cellClickEvent(_ index: IndexPath, _ model: BaseModel) {
			
	}
	
	func configCell(_ index: IndexPath, _ model: BaseModel, _ cell: BaseCell) {
		
	}
}
