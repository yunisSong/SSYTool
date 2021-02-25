//
//  SelectImageCollectionViewCell.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class SelectImageCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var editImageView: UIImageView!
	@IBOutlet weak var iamgeView: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension SelectImageCollectionViewCell: ImageSelectorViewCongigCellProtocol
{
	func config(model: ImageSelectorViewProtocol) {
		self.iamgeView.image = model.image
	}
}
