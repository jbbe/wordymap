//
//  CompoundViewController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/6/19.
//  Copyright © 2019 jbbe. All rights reserved.
//

import Cocoa

class CompoundViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        compoundTextView.textStorage?.append(NSAttributedString(string: compoundContents))
    }
    
    var compoundContents: String = ""
    @IBOutlet var compoundTextView: NSTextView!
}
