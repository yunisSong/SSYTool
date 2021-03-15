//
//  ShowInputNuberTextView.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

class ShowInputNuberTextView: UIView {

    var placeholder = "" {
        didSet {
            self.placeholderLabel.text = placeholder
        }
    }
    var maxInputNumer = 250 {
        didSet {
            self.textLengthLabel.text = "最多输入\(maxInputNumer)字"
        }
    }
    
    
    lazy var placeholderLabel :UILabel =  {
        let labele = UILabel.init()
        labele.configCellTitle()
        labele.textAlignment = NSTextAlignment.center
        labele.backgroundColor = .clear
        return labele
    }()
    
    lazy var textLengthLabel :UILabel =  {
        let labele = UILabel.init()
        labele.configCellTitle()
        labele.textAlignment = NSTextAlignment.center
        labele.backgroundColor = .green
        return labele
    }()
    lazy var textView :UITextView =  {
        let text = UITextView.init()
        text.delegate = self
        text.backgroundColor = .white
        text.font = .cellTitleFont
        return text
    }()

    
    // MARK: - Public Method
    //外部方法
    func config(placeholder:String,maxInputNumer:Int)  {
        self.placeholder = placeholder
        self.maxInputNumer = maxInputNumer

        assignDate()
        settingAppearance()
        loadSubViews()
    }
    // MARK: - Life Cycle
    //系统方法
    init(placeholder:String,maxInputNumer:Int) {
        super.init(frame: .zero)
        
        self.config(placeholder: placeholder, maxInputNumer: maxInputNumer)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Intial Methods
    //初始化数据
    func assignDate() {
        
    }
    
    func settingAppearance() {
        self.backgroundColor = .white

    }
    
    func loadSubViews() {
        self.addSubview(self.textView)
        self.addSubview(self.placeholderLabel)
        self.addSubview(self.textLengthLabel)
        self.textView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(self.textLengthLabel.snp.top).offset(0).priority(745)
        }
        self.placeholderLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(SYDefaultTextViewOffset)
            make.top.equalToSuperview().offset(SYDefaultTextViewOffset)
        }
        self.textLengthLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-SYDefaultTextViewOffset)
            make.bottom.equalToSuperview().offset(-SYDefaultTextViewOffset)
        }

        
    }
    // MARK: - Network Methods && Target Methods
    //网络请求 && 点击事件
    
    // MARK: - Private Method
    //私有方法
    
    // MARK: - Delegate
    //代理方法
    
    // MARK: - Lazy Loads
}

extension ShowInputNuberTextView : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    func textViewDidChange(_ textView: UITextView) {
        self.placeholderLabel.isHidden = (textView.text.count > 0)

    }
    func textViewDidEndEditing(_ textView: UITextView) {
        self.placeholderLabel.isHidden = (textView.text.count > 0)


    }
}
