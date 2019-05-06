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
        synonymsTextView.textStorage?.mutableString.setString("")
        hypernimsTextView.textStorage?.mutableString.setString("")
        antonymsTextView.textStorage?.mutableString.setString("")
        famlTextView.textStorage?.mutableString.setString("")
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    // Properties
    
    @IBOutlet weak var partOfSpeechSelected: NSComboBox!
    @IBOutlet weak var wordEntryField: NSTextField!
    @IBOutlet weak var synonymsResultsTextBox: NSTextFieldCell!
    @IBOutlet weak var antonymsResultsTextBox: NSClipView!
   
    //    @IBOutlet var antonymsResultsTextView: NSTextView!
    
    @IBOutlet var synonymsTextView: NSTextView!
    @IBOutlet var antonymsTextView: NSTextView!
    @IBOutlet var hypernimsTextView: NSTextView!
    
    @IBOutlet var famlTextView: NSTextView!
    
    var antonymTextStorage: NSTextStorage?
    
    func wordEntryFieldShouldReturn(_ textField: NSTextField) -> Bool {
        // Hide the keyboard. idk if this is necessary for macos
        textField.resignFirstResponder()
        
        return true
    }
    
    func wordEntryFieldDidEndEditing(_ textField: NSTextField) {
        wordEntryField.stringValue = textField.stringValue
    }
    
    // Clears stored vals of textview if they exist
    func clearStoredVals(textView: NSTextView?) {
        if (textView?.textStorage) != nil {
            textView?.textStorage?.mutableString.setString("")
        }
    }
    // Actions
    @IBAction func searchPressed(_ sender: NSButton) {
//        let wN = wordNetModel();
        if (wordEntryField.stringValue != "WordBox"
            && partOfSpeechSelected.stringValue != "partOfSpeech"
            && wordEntryField.stringValue != "") {
//            synonymsResultsTextBox.stringValue = wordNetModel.queryWordNetSims(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)
            
            // Clear stored values from text views
            
//            synonymsTextView.textStorage?.mutableString.setString("")
//            hypernimsTextView.textStorage?.mutableString.setString("")
//            antonymsTextView.textStorage?.mutableString.setString("")
            clearStoredVals(textView: synonymsTextView)
            clearStoredVals(textView: antonymsTextView)
            clearStoredVals(textView: hypernimsTextView)
            
            // Run queries and fill textviews
            antonymsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetAnts(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            hypernimsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetHypernims(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            synonymsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetSims(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            famlTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetFamily(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))

        }
    }
    
    
    @IBAction func openTreeWin(_ sender: NSButton) {
        
        
        
    }
    
    
    // wordEntry delegate
    
    
   

    
}

