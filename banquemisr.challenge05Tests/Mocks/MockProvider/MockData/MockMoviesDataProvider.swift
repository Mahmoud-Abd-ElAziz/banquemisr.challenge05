//
//  MockMoviesDataProvider.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

import Foundation
@testable import banquemisr_challenge05

final class MockMoviesDataProvider {
    
    static func getMockedMovies() -> Data? {
        guard let url = Bundle(for: MockMoviesDataProvider.self).url(forResource: "MockMoviesResponse", withExtension: "json") else {
            print("Mocked Movie JSON file not found.")
            return nil}
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
}

