//
//  ZPlaceholderTextView.swift
//  test
//
//  Created by Zack･Zheng on 16/9/27.
//  Copyright © 2016年 Zack･Zheng. All rights reserved.
//

import Foundation
import UIKit

public class ZPlaceholderTextView: UITextView {
    
    private(set) var placeholderLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    @IBInspectable public var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    @IBInspectable public var placeholderColor: UIColor? {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    deinit {
        print("\(self) deinit")
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidBeginEditingNotification, object: self)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidEndEditingNotification, object: self)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidChangeNotification, object: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePlaceholderLabelFrame()
    }
    
    override public var font: UIFont? {
        didSet {
            placeholderLabel.font = font
            updatePlaceholderLabelFrame()
        }
    }
    
    override public var text: String! {
        didSet {
            if text.characters.count > 0 {
                placeholderLabel.hidden = true
            }else {
                placeholderLabel.hidden = false
            }
        }
    }
    
    override public var attributedText: NSAttributedString! {
        didSet {
            if attributedText.string.characters.count > 0 {
                placeholderLabel.hidden = true
            }else {
                placeholderLabel.hidden = false
            }
        }
    }
    
    private func updatePlaceholderLabelFrame() {
        let lineFragmentPadding = textContainer.lineFragmentPadding
        let topInsets = textContainerInset.top
        let width = bounds.width - 2 * lineFragmentPadding
        let height: CGFloat = {
            let font = self.font ?? UIFont.systemFontOfSize(14.0)
            return font.lineHeight
        }()
        placeholderLabel.frame = CGRect.init(x: lineFragmentPadding, y: topInsets, width: width, height: height)
    }
}

private extension ZPlaceholderTextView {
    func setup() {
        placeholderLabel.font = self.font
        addSubview(placeholderLabel)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidBeginEditing(_:)), name: UITextViewTextDidBeginEditingNotification, object: self)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidEndEditing(_:)), name: UITextViewTextDidEndEditingNotification, object: self)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ZPlaceholderTextView.textViewDidChange(_:)), name: UITextViewTextDidChangeNotification, object: self)
    }
}

extension ZPlaceholderTextView {
    func textViewDidBeginEditing(_ notification: NSNotification) -> Void {
        if self.text.characters.count > 0 {
            placeholderLabel.hidden = true
        }else {
            placeholderLabel.hidden = false
        }
    }
    
    func textViewDidChange(_ notification: NSNotification) {
        if self.text.characters.count > 0 {
            placeholderLabel.hidden = true
        }else {
            placeholderLabel.hidden = false
        }
    }
    
    func textViewDidEndEditing(_ notification: NSNotification) -> Void {
        if self.text.characters.count > 0 {
            placeholderLabel.hidden = true
        }else {
            placeholderLabel.hidden = false
        }
    }
}
