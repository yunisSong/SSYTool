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
	var test: TestBase1ViewController?
	
	
	var count = 1
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor.red

        // Do any additional setup after loading the view.
		DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
			DispatchQueue.main.async {

			}
		}
		
		var head = TagListHeadView.init(titles: ["1","2","3"], clickHandle: {(index,title) in
			
		})
		self.view.addSubview(head)
		head.snp.makeConstraints { (make) in
			make.width.equalToSuperview()
			make.left.equalToSuperview()
			make.centerY.equalToSuperview()
			make.height.equalTo(50)
		}
		
		var round = RoundButton.init(type: .custom)
		
		self.view.addSubview(round)
		
		round.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().offset(150)
			make.width.equalTo(100)
			make.height.equalTo(100)

		}
		
		var tbBiew = TopBottomTitleView.init(topTitle: "地图", bottomTitle: "哒哒哒哒哒哒")
		
		self.view.addSubview(tbBiew)
		
		tbBiew.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().offset(250)

		}

    }
    

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		let model = BaseCellLayoutModel()
		model.cellID = "TodoTableViewCell"
		
		let ctr = TestBase1ViewController.init()
		ctr.cellType = "SYTableViewCell";
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
