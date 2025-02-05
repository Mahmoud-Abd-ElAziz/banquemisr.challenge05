//
//  MovieRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//


protocol MovieRepository {
    func movies(with type: MovieCategoryTypes) async -> Result<MoviesModel, HttpClientError>
}
