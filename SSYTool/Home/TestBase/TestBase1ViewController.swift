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
	
	func loadNewData(handle:@escaping ([BaseModel]?) -> Void) {
		let model = BaseModel()
		
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {
				handle([model,model,model])

			}
		}
	}
	
	func loadMoreData(handle: @escaping ([BaseModel]?) -> Void) {
		let model = BaseModel()
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {
				handle([model,model,model])

			}
		}
	}

	
	func cellClickEvent(_ index: IndexPath, _ model: BaseModel) {
		
		
		
		if index.row == 0 {
			let layout = UICollectionViewFlowLayout.init()
			layout.itemSize = .init(width: 150, height: 150)
			layout.scrollDirection = .vertical
			let collCtr = TestCollectionViewController.init(cellType: "TestCollectionViewCell", itemWidth: 100)
			self.navigationController?.pushViewController(collCtr, animated: true)
		}
	}
	
	func configCell(_ index: IndexPath, _ model: BaseModel, _ cell: BaseCell) {
		
	}
}
