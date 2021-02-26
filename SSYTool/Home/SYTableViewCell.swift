//
//  SYTableViewCell.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/9.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class SYTableViewCell: BaseCell {

	@IBOutlet weak var creatUserLabel: UILabel!
	@IBOutlet weak var predicateLabel: UILabel!
	@IBOutlet weak var operationName: UILabel!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var userLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var operationTime: UILabel!
	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var genderImageView: UIImageView!
	
	@IBOutlet weak var titleView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	override func layoutSubviews() {
		super.layoutSubviews()
		titleView.ssy.corner(byRoundingCorners: [.topLeft,.topRight], radii: 15)

	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	override func configModel(model: BaseModel) {
		creatUserLabel.text = "陈安安"
		predicateLabel.text = "发起"
		operationName.text = "评估申请"
		timeLabel.text = "2021-02-09"
		userLabel.text = "林华"
		addressLabel.text = "评估地点：高新南西一刀果实大厦909 1😯2c手机"
		operationTime.text = "2021-02-09"
		stateLabel.text = "评估分配"

	}
    
}

