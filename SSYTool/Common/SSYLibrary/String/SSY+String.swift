//
//  SSY+String.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/10.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
/*
nsstring 长度  数字 电话 身份证？是否包含表情 以XXX开头，以XXX结尾

attributeString 删除 颜色 字体 行间距
*/
extension NSString:SSYCompatible{}
extension SSYHelp where Base: NSString {
	func isPhone() -> Bool {
		let predicateStr:String! = "^1[34578]\\d{9}$"
		let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
		return predicate.evaluate(with: self.base)
	}
}

enum Validate {
    case email(_: String)
    case phoneNum(_: String)
    case carNum(_: String)
    case username(_: String)
    case password(_: String)
    case nickname(_: String)
    
    case URL(_: String)
    case IP(_: String)
    
    
    var isRight: Bool {
        var predicateStr:String!
        var currObject:String!
        switch self {
        case let .email(str):
            predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            currObject = str
        case let .phoneNum(str):
            predicateStr = "^1[34578]\\d{9}$$"
            currObject = str
        case let .carNum(str):
            predicateStr = "^[A-Za-z]{1}[A-Za-z_0-9]{5}$"
            currObject = str
        case let .username(str):
            predicateStr = "^[A-Za-z0-9]{6,20}+$"
            currObject = str
        case let .password(str):
            predicateStr = "^[a-zA-Z0-9]{6,20}+$"
            currObject = str
        case let .nickname(str):
            predicateStr = "^[\\u4e00-\\u9fa5]{4,8}$"
            currObject = str
        case let .URL(str):
            predicateStr = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
            currObject = str
        case let .IP(str):
            predicateStr = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
            currObject = str
        }
        
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
		return predicate.evaluate(with: currObject)
    }
}
