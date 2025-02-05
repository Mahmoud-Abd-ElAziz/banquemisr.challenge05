//
//  FormattedData.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation


extension Dictionary {
    func format(options: JSONSerialization.WritingOptions) -> Any? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return try JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments])
        } catch {
            Logger.logging(error.localizedDescription)
            return nil
        }
    }
}
extension Dictionary where Key: CustomDebugStringConvertible, Value:CustomDebugStringConvertible {

    var prettyprint : String {
        for (key,value) in self {
            print("\(key) = \(value)")
        }

        return self.description
    }
}
