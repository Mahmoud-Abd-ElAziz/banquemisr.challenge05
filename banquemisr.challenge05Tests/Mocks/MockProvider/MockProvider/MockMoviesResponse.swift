//
//  MockMoviesResponse.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

@testable import banquemisr_challenge05
import UIKit

final class MockMoviesResponse {
    
    static func getMockedMoviesResponse() -> MoviesModel? {
        guard let url = Bundle(for: MockMovieDetailsResponse.self).url(forResource: "MockMovieDetailsResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let movieResponse = try decoder.decode(MoviesModel.self, from: data)
            return movieResponse
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
