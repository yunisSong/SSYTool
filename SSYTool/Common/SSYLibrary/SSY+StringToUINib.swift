//
//  SSY+UINib.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/18.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
extension String:SSYCompatible{}
extension SSYHelp where Base == String
{
	func ssy_nib() -> UINib? {
		if self.base.count == 0 {
			return nil
		}
		return UINib.init(nibName: self.base, bundle: nil)
	}

}
