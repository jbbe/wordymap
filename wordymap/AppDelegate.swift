//
//  AppDelegate.swift
//  wordymap
//
//  Created by Joanna Bell on 5/2/19.
//  Copyright © 2019 Joanna Bell. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
//
//    var textView: NSTextView!
//    var textStorage: NSTextStorage! // STORE A REFERENCE
//
//    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        var view = window.contentView as NSView
//        textStorage = NSTextStorage()
//        var layoutManager = NSLayoutManager()
//        textStorage.addLayoutManager(layoutManager)
//        var textContainer = NSTextContainer(containerSize: view.bounds.size)
//        layoutManager.addTextContainer(textContainer)
//        textView = NSTextView(frame: view.bounds, textContainer: textContainer)
//        
//        textView.editable = true
//        textView.selectable = true
//        view.addSubview(textView)
//
//        textView.textStorage?.appendAttributedString(NSAttributedString(string: "Hello more complex"))
//    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

