//
//  MoviesUseCaseImpl.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//


import UIKit

class MoviesUseCaseImpl: MoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository = MovieRepositoryImpl()) {
        self.repository = repository
    }

    func execute(category: MovieCategoryTypes, page: Int) async -> Result<MoviesModel, HttpClientError> {
        switch category {
        case .nowPlaying:
            return await repository.movies(with: .nowPlaying(page: page))
        case .upcoming:
            return await repository.movies(with: .upcoming(page: page))
        case .popular:
            return await repository.movies(with: .popular(page: page))
        }
    }
    
}
