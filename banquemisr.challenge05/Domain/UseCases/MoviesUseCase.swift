//
//  MoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

protocol MoviesUseCase {
    func execute(category: MovieCategoryTypes, page: Int) async -> Result<MoviesModel, HttpClientError>
}


