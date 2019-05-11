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
    
    
    // -syns(n | v | a | r)
//    Display synonyms and immediate hypernyms of synsets containing searchstr.  Synsets are ordered by estimated frequency of use.  For adjectives, if searchstr is in
//    a head synset, the cluster's satellite synsets are displayed in place of hypernyms.  If searchstr is in a satellite synset, its head synset is also displayed.
//
//    -simsv         Display verb synonyms and immediate hypernyms of synsets containing searchstr.  Synsets are grouped by similarity of meaning.
//

    //Synonyms
    class func queryWordNetSims(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-synsn")
        case "Verb":
            let syns = runQuery(word: word, option: "-synsv")
            let sims = runQuery(word: word, option: "-simsv")
            print(sims)
            return (syns) + "\n" + (sims)
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
    
    //hypernims are included with synonyms do different q
    // coor and pertynims
    class func queryWordNetCoorAndPert(word: String, partOfSpeech:String) -> String {
        switch(partOfSpeech) {
        case "Noun":
            return runQuery(word: word, option: "-coorn")
        case "Verb":
            return runQuery(word: word, option: "-coorv")
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

   
    class func querySubs(word: String) -> String {
        return runQuery(word: word, option: "-subsn")
    }
    
    class func queryPart(word: String) -> String {
        return runQuery(word: word, option: "-partn")
    }
    
    class func queryMemb(word: String) -> String {
        return runQuery(word: word, option: "-membn")
    }
    
    class func queryMeron(word: String) -> String {
        return runQuery(word: word, option: "-meron")
    }
    
    class func queryHmern(word: String) -> String {
        return runQuery(word: word, option: "-hmern")
    }
    
    class func querySprt(word: String) -> String {
        return runQuery(word: word, option: "-sprtn")
    }
    
    class func querySmem(word: String) -> String {
        return runQuery(word: word, option: "-smemn")
    }
    
    class func querySsub(word: String) -> String {
        return runQuery(word: word, option: "-ssubn")
    }
    
    class func queryHolo(word: String) -> String {
        return runQuery(word: word, option: "-holosn")
    }
    
    class func queryHholn(word: String) -> String {
        return runQuery(word: word, option: "-hholn")
    }
//    -entav         Display entailment relations of searchstr.
//
//    -framv         Display applicable verb sentence frames for searchstr.
//
//    -causv         Display cause to relations of searchstr.
//

    class func queryEntav(word: String) -> String {
        return runQuery(word: word, option: "-entav")
    }
    
    class func queryFramv(word: String) -> String {
        return runQuery(word: word, option: "-framv")
    }
    
    class func queryCausv(word: String) -> String {
        return runQuery(word: word, option: "-causv")
    }
    
    class func runQuery(word: String, option: String) -> String {
        // Create a Task instance (was NSTask on swift pre 3.0)
        let task = Process()
        
        // Set the task parameters
        task.launchPath = "/usr/local/bin/wn"

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
