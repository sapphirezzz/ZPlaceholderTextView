//
//  ZPlaceholderTextView.swift
//  test
//
//  Created by Zack･Zheng on 16/9/27.
//  Copyright © 2016年 Zack･Zheng. All rights reserved.
//

import Foundation
import UIKit

open class ZPlaceholderTextView: UITextView {
    
    fileprivate(set) var placeholderLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        return label
    }()
    
    @IBInspectable open var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            updatePlaceholderLabelFrame()
        }
    }
    
    @IBInspectable open var placeholderColor: UIColor? {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    deinit {
        print("\(self) deinit")
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidBeginEditingNotification, object: self)
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidEndEditingNotification, object: self)
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        updatePlaceholderLabelFrame()
    }
    
    override open var font: UIFont? {
        didSet {
            placeholderLabel.font = font
            updatePlaceholderLabelFrame()
        }
    }
    
    override open var text: String! {
        didSet {
            if text.count > 0 {
                placeholderLabel.isHidden = true
            }else {
                placeholderLabel.isHidden = false
            }
        }
    }
    
    override open var attributedText: NSAttributedString! {
        didSet {
            if attributedText.string.count > 0 {
                placeholderLabel.isHidden = true
            }else {
                placeholderLabel.isHidden = false
            }
        }
    }
    
    fileprivate func updatePlaceholderLabelFrame() {
        let lineFragmentPadding = textContainer.lineFragmentPadding
        let topInsets = textContainerInset.top
        let width = bounds.width - 2 * lineFragmentPadding
        
        let font = self.font ?? UIFont.systemFont(ofSize: 14.0)
        
        guard let placeholder = placeholder, placeholder.count > 0 else {
            placeholderLabel.frame = CGRect(x: lineFragmentPadding, y: topInsets, width: width, height: font.lineHeight)
            return
        }
        let height = (placeholder as NSString).boundingRect(with: CGSize(width: width, height: 400), options: [NSStringDrawingOptions.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil).height
        placeholderLabel.frame = CGRect(x: lineFragmentPadding, y: topInsets, width: width, height: height)
    }
}

private extension ZPlaceholderTextView {
    func setup() {
        backgroundColor = .white
        placeholderLabel.font = self.font
        addSubview(placeholderLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidBeginEditing(_:)), name: UITextView.textDidBeginEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidEndEditing(_:)), name: UITextView.textDidEndEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidChange(_:)), name: UITextView.textDidChangeNotification, object: self)
    }
}

extension ZPlaceholderTextView {
    @objc func textViewDidBeginEditing(_ notification: Notification) -> Void {
        if self.text.count > 0 {
            placeholderLabel.isHidden = true
        }else {
            placeholderLabel.isHidden = false
        }
    }
    
    @objc func textViewDidChange(_ notification: Notification) {
        if self.text.count > 0 {
            placeholderLabel.isHidden = true
        }else {
            placeholderLabel.isHidden = false
        }
    }
    
    @objc func textViewDidEndEditing(_ notification: Notification) -> Void {
        if self.text.count > 0 {
            placeholderLabel.isHidden = true
        }else {
            placeholderLabel.isHidden = false
        }
    }
}
