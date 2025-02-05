//
//  Logger.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

final class Logger {
    
    static func logNetwork<T>(_ items: T, separator: String = " ", terminator: String = "\n") {
        print("""
            \n===================== 📟 ⏳ 📡 =========================
            \(items)
            ======================= 🚀 ⌛️ 📡 =========================
            """, separator: separator, terminator: terminator)
    }
    
    static func logging<T>(_ message: T,
                           file: String = #file,
                           funcName: String = #function,
                           lineNum: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("⚡️🚀 \(fileName):(\(lineNum)) - \(message)")
        #endif
    }
    
}
