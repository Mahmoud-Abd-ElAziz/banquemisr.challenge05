//
//  MovieRepositoryImpl.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {

    private let apiService: AppApiServicesProtocol
    static let cache = Cache<String, CachedMoviesModel>()

    
    init(apiService: AppApiServicesProtocol = AppApiServices()) {
        self.apiService = apiService
    }
    
    func movies(with type: MovieCategoryTypes) async -> Result<MoviesModel, HttpClientError> {
        let cacheKey = "\(type.apiRouter)"
        if let cachedMovies = Self.cache.value(forKey: cacheKey) {
            return .success(cachedMovies.moviesModel)
        }
        do {
            let response = try await apiService.movies(with: type)
            let cachedMovies = CachedMoviesModel(moviesModel: response)
            Self.cache.insert(cachedMovies, forKey: cacheKey)
            return .success(response)
        } catch let error as DecodingError {
            return .failure(.customString("Decoding failed: \(error.localizedDescription)"))
        } catch {
            return .failure(.customString("Network request failed: \(error.localizedDescription)"))
        }
    }
    
}
