//
//  treeViewController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/6/19.
//  Copyright © 2019 jbbe. All rights reserved.
//

import Cocoa

class SingleTextViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        treeTextView.textStorage?.append(NSAttributedString(string:treeContents))
    }
    
    var treeContents: String = ""
    @IBOutlet var treeTextView: NSTextView!
}
