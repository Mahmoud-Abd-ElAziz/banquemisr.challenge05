//
//  MovieDetailsRepositoryImpl.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

class MovieDetailsRepositoryImpl: MovieDetailsRepository {
    
    private let apiService: AppApiServicesProtocol
    static let cache = Cache<Int, CachedMovieDataModel>()
    
    init(apiService: AppApiServicesProtocol = AppApiServices()) {
        self.apiService = apiService
    }
    func movieDetails(with movieID: Int) async -> Result<MovieDataModel, HttpClientError> {
        if let cachedMovie = Self.cache.value(forKey: movieID) {
            return .success(cachedMovie.movieData)
        }
        do {
            let response = try await apiService.moviesDetails(with: movieID)
            let cachedMovie = CachedMovieDataModel(movieData: response)
            Self.cache.insert(cachedMovie, forKey: movieID)
            return .success(response)
        } catch let error as DecodingError {
            return .failure(.customString("Decoding failed: \(error.localizedDescription)"))
        } catch {
            return .failure(.customString("Network request failed: \(error.localizedDescription)"))
        }
    }
    
    
}
