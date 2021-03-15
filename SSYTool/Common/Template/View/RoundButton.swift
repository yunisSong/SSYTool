//
//  RoundButton.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setStyle()

	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.setStyle()
	}
	
	func setStyle()  {
		self.layer.borderWidth = 0.5
		self.layer.borderColor = UIColor.viewBGColor.cgColor
		self.layer.cornerRadius = CGFloat(SYDefaultViewRadius)
		self.layer.masksToBounds = true
		self.titleLabel?.font = .cellContentFont
		self.setTitleColor(.white, for: .normal)
		self.backgroundColor = .viewBGColor
	}

}
