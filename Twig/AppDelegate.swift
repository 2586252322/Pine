//
//  AppDelegate.swift
//  Twig
//
//  Created by Luka Kerr on 25/4/18.
//  Copyright © 2018 Luka Kerr. All rights reserved.
//

import Cocoa

let defaults = UserDefaults.standard

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  func applicationDidFinishLaunching(_ aNotification: Notification) {

    // Restore default syntax theme
    if let defaultSyntax = defaults.string(forKey: "syntax") {
      theme.syntax = defaultSyntax
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
  }
  
  func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
    return false
  }

}
