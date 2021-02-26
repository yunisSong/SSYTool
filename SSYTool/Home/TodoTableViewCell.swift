//
//  TodoTableViewCell.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/14.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
import SnapKit

class TodoTableViewCell: BaseCell {
	var collectionHeigth:ConstraintMakerFinalizable?
	var selectImageView:ImageSelectorView?

	@IBOutlet weak var imageView1: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		selectImageView = ImageSelectorView.init(imageModels: [], canEdit: true, maxCount: 9)
		
		guard let selectImageView = selectImageView else {
			return
		}
		self.contentView.addSubview(selectImageView)
		
		selectImageView.snp.makeConstraints { (make) in
			make.left.right.top.bottom.equalToSuperview()
			make.height.greaterThanOrEqualTo(80)
		}
				
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	override func configModel(model: BaseModel) {
		
	}
	
    
}
