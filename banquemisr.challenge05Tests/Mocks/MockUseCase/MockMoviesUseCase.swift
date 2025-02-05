//
//  MockMoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

import Foundation
@testable import banquemisr_challenge05

class MockMoviesUseCase: MoviesUseCase {
    func execute(category: MovieCategoryTypes, page: Int) async -> Result<MoviesModel, HttpClientError> {
        if let reponse = MockMoviesResponse.getMockedMoviesResponse() {
           return .success(reponse)
        }else {
           return .failure(.customString("Movies is nil"))
        }
    }

}
