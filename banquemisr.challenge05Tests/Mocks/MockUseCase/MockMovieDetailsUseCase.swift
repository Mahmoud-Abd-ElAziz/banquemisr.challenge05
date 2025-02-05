//
//  MockMovieDetailsUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

@testable import banquemisr_challenge05
import UIKit

class MockMovieDetailsUseCase: MovieDetailsUseCase {
    
    func execute(with movieID: Int) async -> Result<MovieDataModel, HttpClientError> {
        if let reponse = MockMovieDetailsResponse.getMockedMovieDetailsResponse() {
            Logger.logging("Success with data = \(reponse)")
            return .success(reponse)
        }else {
            Logger.logging("Error with response")
            return .failure(.customString("Movie Data is nil"))
        }
    }
    
    
}

