//
//  ImageSelectorView.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit
import SnapKit
/*

1. 支持传入数组，数组里面包含信息 image 或者 URL
2. 支持编辑、添加和删除
3. 支持点击大图浏览
4. 支持传入最大显示图片数量


拖拽排序？最后一个拖拽按钮不能排序？
要写出 添加按钮显示和隐藏的逻辑



append(ImageSelectorViewProtocol)
delete(index,ImageSelectorViewProtocol)
click(index,ImageSelectorViewProtocol)
	
*/
struct ImageModel:ImageSelectorViewProtocol{
	var image:UIImage?
	var imageURL: String?
	var cellId: String
}

protocol ImageSelectorViewProtocol {
	var image:UIImage? { get set }
	var imageURL: String? { get set }
	var cellId:String  { get set }
	
}
protocol ImageSelectorViewCongigCellProtocol
{
	func config(model:ImageSelectorViewProtocol)
}
enum EditType {
	case Click(Int,ImageSelectorViewProtocol)
	case Add(Int?,ImageSelectorViewProtocol?)
	case Delete(Int,ImageSelectorViewProtocol)

}
typealias imageSelectorEditHandle = (EditType)->Void

class ImageSelectorView: UIView {
	
	var models: [ImageSelectorViewProtocol] {
		didSet {
			hiddenOrShowAddButton()
		}
	}
	lazy var addModel:ImageModel = {
		var model = ImageModel.init(image: UIImage.init(named: "icon_addFile"), imageURL: nil, cellId: "AddCollectionViewCell")
		return model
	}()
	var canEdit: Bool
	var maxCount: Int
	var handle:imageSelectorEditHandle?
	var collectionHeigth:ConstraintMakerFinalizable?
	
	lazy var collectionView:UICollectionView =  {
		var layout = UICollectionViewFlowLayout.init()
		layout.itemSize = CGSize(width: 90.0,height: 90.0)
		layout.minimumLineSpacing = 5.0
		layout.minimumInteritemSpacing = 5.0
		var collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
		collectionView.SSY.ssy_register(nib: "SelectImageCollectionViewCell")
		collectionView.SSY.ssy_register(nib: "AddCollectionViewCell")
		collectionView.delegate = self
		collectionView.dataSource = self

		return collectionView
	}()
	
		
	
	init(imageModels:[ImageSelectorViewProtocol] = [],canEdit:Bool = false,maxCount:Int = 9) {
		
		self.models = imageModels
		self.canEdit = canEdit
		self.maxCount = maxCount
		super.init(frame: .zero)
		
		loadView()
		settingAppearance()
		hiddenOrShowAddButton()

	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

	override func layoutSubviews() {
		super.layoutSubviews()
		
	}
	
	

	
}

extension ImageSelectorView {
	private func loadView()  {
		
		self.addSubview(collectionView)
		collectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10))
			collectionHeigth = make.height.equalTo(90).priority(666)
		}

		
	}
	private func settingAppearance() {
		self.backgroundColor = .red
		collectionView.backgroundColor = .brown
	}

}
extension ImageSelectorView {
	func clickModel(index:Int,model:ImageSelectorViewProtocol)  {

		handle?(.Click(index, model))
	}
	
	func appendModels(models:[ImageSelectorViewProtocol])  {
		fatalError()

	}
	
	func deleteModels(index:Int,model:ImageSelectorViewProtocol)  {
		handle?(.Delete(index, model))

	}
	
	
	func hiddenOrShowAddButton()  {
		
		if models.count < maxCount && canEdit{
			//显示
			if !models.contains(where: { $0.cellId == addModel.cellId})
			{
				models.append(addModel)
			}
		}else{
			//隐藏
			if models.contains(where: { $0.cellId == addModel.cellId})
			{
				models.removeLast()
			}
		}

		DispatchQueue.main.async(execute: {
			self.collectionView.snp.updateConstraints { (make) in
				make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10))
				make.height.equalTo(MAXFLOAT).priority(666)
			}
			self.collectionView.reloadData()
			self.collectionView.layoutIfNeeded()

			let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
			self.collectionView.snp.updateConstraints { (make) in
				make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10))
				make.height.equalTo(height).priority(666)
			}

			self.collectionView.SSY.parentTableView()?.beginUpdates()
			self.collectionView.SSY.parentTableView()?.endUpdates()

		})
		
		

	}
}

extension ImageSelectorView :UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.models.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let model = models[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellId, for: indexPath)
		let selectCell = cell as! ImageSelectorViewCongigCellProtocol
		selectCell.config(model: model)
		return cell
	}
	
	
}
extension ImageSelectorView :UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("didSelectItemAt",indexPath)
	}
}
