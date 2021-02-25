//
//  AddCollectionViewCell.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class AddCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var imageView: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		contentView.backgroundColor = .gray
    }

}

extension AddCollectionViewCell: ImageSelectorViewCongigCellProtocol
{
	func config(model: ImageSelectorViewProtocol) {
		self.imageView.image = model.image
	}
}
