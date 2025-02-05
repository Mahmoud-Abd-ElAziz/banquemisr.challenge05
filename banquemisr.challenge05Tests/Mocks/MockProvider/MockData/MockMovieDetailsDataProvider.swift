//
//  MockMovieDetailsDataProvider.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//


import UIKit

final class MockMovieDetailsDataProvider {
    
    static func getMockedMovieDetailsData() -> Data? {
        guard let url = Bundle(for: MockMovieDetailsDataProvider.self).url(forResource: "MockMovieDetailsResponse", withExtension: "json") else {
            print("Mocke Movie Details File JSON not found.")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
}
