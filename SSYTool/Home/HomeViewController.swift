//
//  HomeViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/5.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	var handle:SYClickHandle?
	var bbchange:((_ title:String,_ myColor:UIColor)->Void)?
	var bgImage: UIImageView?
	var test: SYBaseListViewController?
	
	
	var count = 1
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor.red

        // Do any additional setup after loading the view.
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {
				self.test?.tableView.help.refreshing(models: [])

			}
		}
    }
    

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		let model = BaseCellLayoutModel()
		model.cellID = "TodoTableViewCell"
		
		let ctr = SYBaseListViewController.init(cellType: "SYTableViewCell",models: [model,BaseCellLayoutModel()])
		self.test = ctr
		self.navigationController?.pushViewController(ctr, animated: true)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
