//
//  MockMovieDetailsResponse.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//
@testable import banquemisr_challenge05
import UIKit

final class MockMovieDetailsResponse {
    
    static func getMockedMovieDetailsResponse() -> MovieDataModel? {
        Logger.logging("Bundle Path: \(Bundle(for: MockMovieDetailsResponse.self).bundlePath)")
        guard let url = Bundle(for: MockMovieDetailsResponse.self).url(forResource: "MockMovieDetailsResponse", withExtension: "json") else {
            Logger.logging("Mocked JSON file not found.")
            return nil}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let movieResponse = try decoder.decode(MovieDataModel.self, from: data)
            return movieResponse
        } catch {
            Logger.logging("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
