//
//  wordNetController.swift
//  wordymap
//
//  Created by Joanna Bell on 5/2/19.
//  Copyright © 2019 Joanna Bell. All rights reserved.
//

import Cocoa

public class wordNetModel: NSObject {
    
    class func queryWordNet(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return nounCall(word: word)
        case "Verb":
            return verbCall(word: word)
        case "Adverb":
            return adverbCall(word: word)
        case "Adjective":
            return adjectiveCall(word: word)
        default:
            return ""
        }
        
    }
    
    class func nounCall(word: String) -> String {
        // Create a Task instance (was NSTask on swift pre 3.0)
        let task = Process()
        
//        return shell("wn", word, "-synsn")
        // Set the task parameters
        task.launchPath = "/usr/local/bin/wn"
//        task.launchPath = "/backend/"
//        task.arguments = ["./callWn.py", word, "-synsn"]
        task.arguments = [word, "-synsn"]

        // Create a Pipe and make the task
        // put all the output there
        let pipe = Pipe()
        task.standardOutput = pipe
        
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
        print(output)
        return output! as String
    }
    
    class func verbCall(word: String) -> String {
        // Create a Task instance (was NSTask on swift pre 3.0)
        return "nothing here yet"
    }
    
    class func adjectiveCall(word: String) -> String {
        return "nothing here yet"

    }
    
    class func adverbCall(word: String) -> String {
        return "nothing here yet"

    }
    
    

}
