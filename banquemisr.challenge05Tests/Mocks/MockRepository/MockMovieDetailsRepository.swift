//
//  MockMovieDetailsRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//
@testable import banquemisr_challenge05
import Foundation

final class MockMovieDetailsRepository: MovieDetailsRepository {
    
    func movieDetails(with movieID: Int) async -> Result<MovieDataModel, HttpClientError> {
        if let reponse = MockMovieDetailsResponse.getMockedMovieDetailsResponse() {
            return .success(reponse)
        }else {
            return .failure(.customString("Movie Data is nil"))
        }
    }
    
}
