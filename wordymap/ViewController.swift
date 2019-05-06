//
//  ViewController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/2/19.
//  Copyright © 2019 Joanna Bell. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        wordEntryField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
//    func mountText() {
//        let dir = FileManager.default
//        print(dir)
//        var documentsUrl: URL {
//            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        }
////        if let fileurl = dir.urls(for: FileManager.default, in: localDomainMask)
//        documentsUrl.appendPathComponent("/.temp/output.txt")
////        appendingPathComponent("  temp/output.txt") {
//
//            //reading
//            do {
//                let text2 = try String(contentsOf: fileurl, encoding: .utf8)
//                resultsTextBox.stringValue = text2
//            }
//            catch {/* error handling here */}
//        }
//
//    }

    // Properties
    
    @IBOutlet weak var partOfSpeechSelected: NSComboBox!
    @IBOutlet weak var wordEntryField: NSTextField!
    @IBOutlet weak var resultsTextBox: NSTextFieldCell!
    @IBOutlet weak var outputTextView: NSScrollView!
    
    func wordEntryFieldShouldReturn(_ textField: NSTextField) -> Bool {
        // Hide the keyboard. idk if this is necessary for macos
        textField.resignFirstResponder()
        

        return true
    }
    
    func wordEntryFieldDidEndEditing(_ textField: NSTextField) {
        wordEntryField.stringValue = textField.stringValue
    }
    

    // Actions
    @IBAction func searchPressed(_ sender: NSButton) {
//        let wN = wordNetModel();
        if (wordEntryField.stringValue != "WordBox"
            && partOfSpeechSelected.stringValue != "partOfSpeech"
            && wordEntryField.stringValue != "") {
            resultsTextBox.stringValue = wordNetModel.queryWordNet(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)
//            resultsTextBox.stringValue = "nothing"

        }
    }
    
    // wordEntry delegate
    
    
   

    
}

