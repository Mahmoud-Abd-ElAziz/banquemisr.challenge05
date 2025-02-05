//
//  OptionalType.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//


import Combine


extension Publisher where Output: OptionalType {
    func unwrapAndLog(_ message: String = "Processing data") -> Publishers.CompactMap<Self, Output.Wrapped> {
        self.compactMap { optionalValue in
            if let unwrappedValue = optionalValue.value {
                Logger.logging("\(message): \(unwrappedValue)")
                return unwrappedValue
            }
            return nil
        }
    }
}

// MARK: - OptionalType Protocol
protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

// MARK: - Optional Conformance
extension Optional: OptionalType {
    var value: Wrapped? { self }
}
