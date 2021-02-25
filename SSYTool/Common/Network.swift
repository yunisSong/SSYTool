//
//  Network.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/16.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
import Alamofire
/*
	get post 上传文件
*/


struct Network {
	
	static func postRequset(parameters:[String:Any])  {
		
		AF.request("https://httpbin.org/get").responseJSON { response in
			debugPrint(response)
		}
	}
}
