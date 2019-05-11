//
//  VerbViewController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/8/19.
//  Copyright © 2019 jbbe. All rights reserved.
//

import Cocoa

class VerbViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        entavTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryEntav(word: word)))
        framvTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryFramv(word: word)))
        causvTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryCausv(word: word)))
    }
 
    
    @IBOutlet var entavTextView: NSTextView!
    @IBOutlet var framvTextView: NSTextView!
    @IBOutlet var causvTextView: NSTextView!
    
    var word: String = ""

    
    
}
