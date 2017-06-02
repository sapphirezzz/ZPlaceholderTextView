//
//  ViewController.swift
//  ZPlaceholderTextView
//
//  Created by sapphirezzz on 09/28/2016.
//  Copyright (c) 2016 sapphirezzz. All rights reserved.
//

import UIKit
import ZPlaceholderTextView

class ViewController: UIViewController {

    @IBOutlet var textView: ZPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickButton(_ sender: UIButton) {
        view.endEditing(true)
//        textView.placeholder = "非常对"
//        textView.placeholderColor = UIColor.blueColor()
//        textView.font = UIFont.systemFontOfSize(10)
//        textView.text = "测试测试"
//        textView.attributedText = NSAttributedString.init(string: "啦啦啦啦啦", attributes: [NSForegroundColorAttributeName : UIColor.cyanColor()])
    }
}
