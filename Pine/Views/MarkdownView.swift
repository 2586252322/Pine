//
//  MarkdownView.swift
//  Pine
//
//  Created by Luka Kerr on 21/6/18.
//  Copyright © 2018 Luka Kerr. All rights reserved.
//

import Cocoa

class MarkdownView: NSView {

  override func updateLayer() {
    updateUI()
  }

  private func updateUI() {
    var appAppearance = window?.appearance?.name

    if #available(OSX 10.14, *) {
      appAppearance = NSApp.effectiveAppearance.name
    }

    self.window?.titlebarAppearsTransparent = preferences[Preference.modernTitlebar]

    // Not using system appearance, so stick with theme
    if !preferences[Preference.useSystemAppearance] {
      if let bg = theme.highlightr.theme.themeBackgroundColor {
        setThemeAndWindowAppearance(
          isDark: bg.isDark,
          color: bg
        )
      }
    } else {
      if let appearance = appAppearance {
        setThemeAndWindowAppearance(
          isDark: appearance == .dark,
          color: NSColor.textBackgroundColor
        )
      }

      window?.appearance = nil
    }

    NotificationCenter.send(.appearanceChanged)
  }

  private func setThemeAndWindowAppearance(isDark: Bool, color: NSColor) {
    if isDark {
      theme.code = color.lighter
      theme.text = .white
      window?.appearance = NSAppearance(named: .dark)
    } else {
      theme.code = color.darker
      theme.text = .black
      window?.appearance = NSAppearance(named: .light)
    }

    theme.background = color
    window?.backgroundColor = color
  }

}
