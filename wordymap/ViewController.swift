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
    
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "compoundSegue" {
            if (self.wordEntryField.stringValue != "WordBox" && self.wordEntryField.stringValue != "") {
                let compVC: CompoundViewController = segue.destinationController as! CompoundViewController
                compVC.compoundContents = wordNetModel.queryWordNetCompounds(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)
            }
        } else if segue.identifier == "treeSegue" {
            if (self.wordEntryField.stringValue != "WordBox"
                && (self.partOfSpeechSelected.stringValue == "Noun" || self.partOfSpeechSelected.stringValue == "Verb")
                && self.wordEntryField.stringValue != "") {
                let treeVC: treeViewController = segue.destinationController as! treeViewController
                treeVC.treeContents = wordNetModel.queryWordNetTree(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)
            } else {
                let treeVC: treeViewController = segue.destinationController as! treeViewController
                treeVC.treeContents = "Select noun or verb and enter a word"
            }
        } else if segue.identifier == "nounSegue" {
            if self.wordEntryField.stringValue != "WordBox" && self.partOfSpeechSelected.stringValue == "Noun"
                && self.wordEntryField.stringValue != "" {
                let nounVC: nounViewController = segue.destinationController as! nounViewController
                nounVC.word = wordEntryField.stringValue
            }
        } else if segue.identifier == "verbSegue" {
            if self.wordEntryField.stringValue != "WordBox" && self.partOfSpeechSelected.stringValue == "Verb"
                && self.wordEntryField.stringValue != "" {
                let verbVC: VerbViewController = segue.destinationController as! VerbViewController
                verbVC.word = wordEntryField.stringValue
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    // Properties
    
    @IBOutlet weak var partOfSpeechSelected: NSComboBox!
    @IBOutlet weak var wordEntryField: NSTextField!
    @IBOutlet var synonymsTextView: NSTextView!
    @IBOutlet var hypernimsTextView: NSTextView!
    @IBOutlet var antonymsTextView: NSTextView!
    @IBOutlet var hypoTextView: NSTextView!
    @IBOutlet var famlTextView: NSTextView!
    
//    @IBOutlet var famlTextView: NSTextView!
    
    
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
    // A search can be submitted by a button press or pressing tab or enter on the word or part of speech entries
    
    @IBAction func searchPressed(_ sender: NSButton) {
        performSearch()
    }
    
    @IBAction func partOfSpeechSelected(_ sender: NSComboBox) {
        performSearch()
    }
    
    @IBAction func wordEntered(_ sender: NSTextField) {
        performSearch()
    }
    
    func performSearch() {
        //TODO make parts of speech case insensitive
        
        if (wordEntryField.stringValue != "WordBox"
            && partOfSpeechSelected.stringValue != "partOfSpeech"
            && wordEntryField.stringValue != "") {
            
            // Clear stored values from text views
            clearStoredVals(textView: synonymsTextView)
            clearStoredVals(textView: antonymsTextView)
            clearStoredVals(textView: hypernimsTextView)
            clearStoredVals(textView: hypoTextView)
            clearStoredVals(textView: famlTextView)
            
            // Run queries and fill textviews
            synonymsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetSims(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            antonymsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetAnts(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            hypernimsTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetCoorAndPert(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            hypoTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetHyponims(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            famlTextView.textStorage?.append(NSAttributedString(string: wordNetModel.queryWordNetFamily(word: wordEntryField.stringValue, partOfSpeech: partOfSpeechSelected.stringValue)))
            
        }
    }
}

