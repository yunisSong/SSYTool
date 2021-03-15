//
//  TestTableViewCell.swift
//  SSYTool
//
//  Created by Yunis on 2021/2/26.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class TestTableViewCell: BaseCell {
	@IBOutlet weak var roundLabel: SSYRoundedCornersLabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
