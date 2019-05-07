//
//  nounViewController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/6/19.
//  Copyright © 2019 jbbe. All rights reserved.
//

import Cocoa

class nounViewController: NSViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        subsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.querySubs(word: word)))
        partTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryPart(word: word)))
        membTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryMemb(word: word)))
        meronTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryMeron(word: word)))
        hmernTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryHmern(word: word)))
        sprtnTextView.textStorage?.append(NSAttributedString(string: wordNetModel.querySprt(word: word)))
        smemTextView.textStorage?.append(NSAttributedString(string: wordNetModel.querySmem(word: word)))
        ssubnTextView.textStorage?.append(NSAttributedString(string: wordNetModel.querySsub(word: word)))
        holonTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryHolo(word: word)))
        hholnTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryHholn(word: word)))
        
        
        
    }
    
    // variables
    
    @IBOutlet var subsTextView: NSTextView!
    @IBOutlet var partTextView: NSTextView!
    @IBOutlet var membTextView: NSTextView!
    @IBOutlet var meronTextView: NSTextView!
    @IBOutlet var hmernTextView: NSTextView!
    @IBOutlet var sprtnTextView: NSTextView!
    @IBOutlet var smemTextView: NSTextView!
    @IBOutlet var ssubnTextView: NSTextView!
    @IBOutlet var holonTextView: NSTextView!
    @IBOutlet var hholnTextView: NSTextView!
    var word: String = ""

}


//    -subsn         Display substance meronyms of searchstr (HAS SUBSTANCE relation).
//
//    -partn         Display part meronyms of searchstr (HAS PART relation).
//
//    -membn         Display member meronyms of searchstr (HAS MEMBER relation).
//
//    -meron         Display all meronyms of searchstr (HAS PART, HAS MEMBER, HAS SUBSTANCE relations).
//
//    -hmern         Display meronyms for searchstr tree.  This is a recursive search that prints all the meronyms of searchstr and all of its hypernyms.
//
//    -sprtn         Display part of holonyms of searchstr (PART OF relation).
//
//    -smemn         Display member of holonyms of searchstr (MEMBER OF relation).
//
//    -ssubn         Display substance of holonyms of searchstr (SUBSTANCE OF relation).
//
//    -holon         Display all holonyms of searchstr (PART OF, MEMBER OF, SUBSTANCE OF relations).
//
//    -hholn         Display holonyms for searchstr tree.  This is a recursive search that prints all the holonyms of searchstr and all of each holonym's holonyms.
