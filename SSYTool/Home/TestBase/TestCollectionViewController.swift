//
//  TestCollectionViewController.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TestCollectionViewController: BaseCollectionViewCtr {

	


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TestCollectionViewController {
	func configCell(_ index: IndexPath, _ model: Any, _ cell: UICollectionViewCell) {
		if let cell = cell as? TestCollectionViewCell {
			cell.contentLabel.text = String.init(index.row)
		}
	}
	
	func loadNewData(handle: @escaping requestDataHandle) {
		let model = BaseModel()
		
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {
				handle([model,model,model])
			}
		}
	}
	
	func loadMoreData(handle: @escaping requestDataHandle) {
		let model = BaseModel()
		
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {
				handle([model,model,model])

			}
		}
	}
	
	func cellClickEvent(_ index: IndexPath, _ model: Any) {
		clickHnadle?(index,model)
	}
	
}
