//
//  CommonBlock.swift
//  Baoxin
//
//  Created by Yunis on 2021/2/8.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation


//indexPath
typealias SYClickHandle = ()->Void
typealias SYEventHandle = ()->Void
typealias SYClickEventHandle = (Int,String)->Void


//延迟函数
//异步处理
//回到主线程处理
//任务队列


// FIXME: 1. 封装简单的tableview 单一样式
// FIXME: 2. 封装 复杂的控制器 包好 表格 按钮 下拉刷新 全部通多代理传出去实现
// FIXME: 3. 用 swift 写一个通讯类，看看swift 如何传递参数，如何接受参数，图片如何传递
// FIXME: 4. 工具类 https://www.cnblogs.com/sundaysme/articles/11493694.html 创建圆角 数据为空的时候显示站位字符 通讯加载框
// FIXME: 5. 第一件事情 看 mj 的课程，看 oc 转 swift 注意点 一定要写笔记
