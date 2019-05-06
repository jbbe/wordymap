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
    class func runWordNetQuery(word: String, option: String) -> (String? , Int32) {
        // Create a Task instance (was NSTask on swift pre 3.0)

    
        let task = Process()
        
        // Set the task parameters
        // TODO: MULTIPLE OPTIONS AS INPUT, INPUT SANITIZATION
        task.arguments = [word, option]
        
        // Create a Pipe and make the task
        // put all the output there
        let pipe = Pipe()
        task.standardOutput = pipe
        print(task.arguments ?? "none")
        do {
            // Launch the task
            try task.run()
            task.waitUntilExit()
        }
        catch let error {
            print(error.localizedDescription, error.self)
            return ("error", 13)
        }
        
        // Get the data
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print(output ?? "No output")
        return (output! as String, 0)
    }
    
    
    
    class func nounCall(word: String) -> String {
        let opt = "-synsn"
        return runWordNetQuery(word: word, option: opt).0 ?? "No Output"
        
        
        
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
