//
//  FoundationEx.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 21/07/2024.
//

import Foundation

extension  NSObject {
    static var className:String {
        return String(describing:self)
    }
}
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
