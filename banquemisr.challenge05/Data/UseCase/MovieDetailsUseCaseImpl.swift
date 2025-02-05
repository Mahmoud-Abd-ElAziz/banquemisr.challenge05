//
//  MovieDetailsUseCaseImpl.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

class MovieDetailsUseCaseImpl: MovieDetailsUseCase {
 
    private let repository: MovieDetailsRepository
    
    init(repository: MovieDetailsRepository = MovieDetailsRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(with movieID: Int) async -> Result<MovieDataModel, HttpClientError> {
        return await repository.movieDetails(with: movieID)
    }

 
}
