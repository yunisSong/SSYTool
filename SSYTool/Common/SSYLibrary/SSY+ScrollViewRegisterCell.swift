//
//  SSY+ScrollViewToUINib.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
extension SSYHelp where Base :UITableView
{
	func ssy_register(nib:String)  {
		guard nib.count > 0 else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forCellReuseIdentifier: nib)
	}
	func ssy_registerClass(cellClass:String)  {
		guard cellClass.count > 0 else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forCellReuseIdentifier: cellClass)
	}
}
extension SSYHelp where Base :UICollectionView
{
	func ssy_register(nib:String)  {
		guard nib.count > 0 else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forCellWithReuseIdentifier: nib)

	}
	func ssy_registerClass(cellClass:String)  {
		guard cellClass.count > 0 else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forCellWithReuseIdentifier: cellClass)
	}
}
