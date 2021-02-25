//
//  TabbarViewController.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/5.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		addChildCtr(title: "首页", icon: "tabbar0_0", selectIcon: "tabbar0_1", ctrType: HomeViewController.self)
		addChildCtr(title: "首页1", icon: "tabbar1_0", selectIcon: "tabbar1_1", ctrType: SYTodoViewController.self)
		addChildCtr(title: "首页2", icon: "tabbar2_0", selectIcon: "tabbar2_1", ctrType: MeViewController.self)

		tabBar.barTintColor = UIColor.white

    }
	func addChildCtr(title:String,icon:String,selectIcon:String,ctrType:UIViewController.Type)  {

		let home = ctrType.init()
		let HomeNC = SYNavigationController.init(rootViewController: home)

		// 改变图片 保证图片不失真
		let homeImage = UIImage(named:icon)?.withRenderingMode(.alwaysOriginal)
		let homeSelectImage = UIImage(named:selectIcon)?.withRenderingMode(.alwaysOriginal)

		HomeNC.tabBarItem = UITabBarItem.init(title: title, image: homeImage, selectedImage: homeSelectImage)
		HomeNC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11),NSAttributedString.Key.foregroundColor : UIColor.gray], for: .normal)
		HomeNC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11),NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
		
		addChild(HomeNC)

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
