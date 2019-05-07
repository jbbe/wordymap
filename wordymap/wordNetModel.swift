//
//  wordNetController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/2/19.
//  Copyright © 2019 Joanna Bell. All rights reserved.
//

import Cocoa

public class wordNetModel: NSObject {
    //TODO -pert(a | r)  Display pertainyms of searchstr.
    //    -attr(n | a)  Display adjective values for noun attribute, or noun attributes of adjective values.
    
    class func queryWordNetSims(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-synsn")
        case "Verb":
            return runQuery(word: word, option: "-synsv")
        case "Adverb":
            return runQuery(word: word, option: "-synsr")
        case "Adjective":
            return runQuery(word: word, option: "-synsa")
        default:
            return ""
        }
        
    }
    
    class func queryWordNetAnts(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-antsn")
        case "Verb":
            return runQuery(word: word, option: "-antsv")
        case "Adverb":
            return runQuery(word: word, option: "-antsr")
        case "Adjective":
            return runQuery(word: word, option: "-antsa")
        default:
            return ""
        }
        
    }
    
    class func queryWordNetDomain(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-domnn")
        case "Verb":
            return runQuery(word: word, option: "-domnv")
        case "Adverb":
            return runQuery(word: word, option: "-domnr")
        case "Adjective":
            return runQuery(word: word, option: "-domna")
        default:
            return ""
        }
        
    }
    
    class func queryWordNetInDomain(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-domtn")
        case "Verb":
            return runQuery(word: word, option: "-domtv")
        case "Adverb":
            return runQuery(word: word, option: "-domtr")
        case "Adjective":
            return runQuery(word: word, option: "-domta")
        default:
            return ""
        }
        
    }
    
    class func queryWordNetCompounds(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-grepn")
        case "Verb":
            return runQuery(word: word, option: "-grepv")
        case "Adverb":
            return runQuery(word: word, option: "-grepr")
        case "Adjective":
            return runQuery(word: word, option: "-grepa")
        default:
            return ""
        }
        
    }
    
    // hypernims and pertynims
    class func queryWordNetHyperAndPert(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-hypen")
        case "Verb":
            return runQuery(word: word, option: "-hypev")
        case "Adjective":
            return runQuery(word: word, option: "-perta")
        case "Adverb":
            return runQuery(word: word, option: "-pertr")
        default:
            return ""
        }
        
    }
    
    
    
    class func queryWordNetHyponims(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-hypon")
        case "Verb":
            return runQuery(word: word, option: "-hypov")
            
        default:
            return ""
        }
        
    }
    
    class func queryWordNetTree(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-treen")
        case "Verb":
            return runQuery(word: word, option: "-treev")
            
        default:
            return ""
        }
        
    }
    
    class func queryWordNetFamily(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-famln")
        case "Verb":
            return runQuery(word: word, option: "-famlv")
        case "Adverb":
            return runQuery(word: word, option: "-famlr")
        case "Adjective":
            return runQuery(word: word, option: "-famla")
        default:
            return ""
        }
        
    }



   
    
    class func runQuery(word: String, option: String) -> String {
        // Create a Task instance (was NSTask on swift pre 3.0)
        let task = Process()
        
//        return shell("wn", word, "-synsn")
        // Set the task parameters
        task.launchPath = "/usr/local/bin/wn"
//        task.launchPath = "/backend/"
//        task.arguments = ["./callWn.py", word, "-synsn"]
        task.arguments = [word, option]

        // Create a Pipe and make the task
        // put all the output there
        let pipe = Pipe()
        task.standardOutput = pipe
        print(option)
        do {
            // Launch the task
            try task.run()
            task.waitUntilExit()
        }
        catch let error {
            print(error.localizedDescription, error.self)
            return "error"
        }
        
        // Get the data
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print(output!)
        return output! as String
    }
    
  
}
