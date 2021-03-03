//
//  BaseScrollContainerViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/25.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
/*
这个类要做什么？

*/
class BaseScrollContainerViewController: BaseViewController {

	var scrollView = UIScrollView(frame: .zero)
	var containerView = UIView(frame: .zero)

	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(scrollView)
		scrollView.addSubview(containerView)
		scrollView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
        // Do any additional setup after loading the view.
    }
    

}
