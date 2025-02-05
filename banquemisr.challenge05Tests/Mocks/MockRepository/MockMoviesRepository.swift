//
//  MockMoviesRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

@testable import banquemisr_challenge05
import Foundation

final class MockMoviesRepository: MovieRepository {
    
    func movies(with type: MovieCategoryTypes) async -> Result< MoviesModel,HttpClientError> {
       if let reponse = MockMoviesResponse.getMockedMoviesResponse() {
          return .success(reponse)
       }else {
          return .failure(.customString("Movies is nil"))
       }
    }

}

