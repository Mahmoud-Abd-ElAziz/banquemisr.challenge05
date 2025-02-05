//
//  MovieDetailsUseCaseTests.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

import XCTest
@testable import banquemisr_challenge05
import UIKit

final class MovieDetailsUseCaseTests: XCTestCase {

    private let movieID = 1249289
    private var mockMovieDetailsUseCase: MockMovieDetailsUseCase!
    private var movieUseCase:MovieDetailsUseCase?
    
    
    override func setUp() {
        super.setUp()
        mockMovieDetailsUseCase = MockMovieDetailsUseCase()
        movieUseCase = mockMovieDetailsUseCase
    }

    override func tearDown() {
        mockMovieDetailsUseCase = nil
        movieUseCase = nil
        super.tearDown()
    }

    func executeSuccess() async {
        let result = await movieUseCase?.execute(with: movieID)
        switch result {
        case .success(let movieData):
            XCTAssertNotNil(movieData, "Movie data loaded successfully")
        case .failure:
            XCTFail("Expected success but got failure")
        default :
            XCTFail("Fail with executeSuccess result")

        }
    }

    func executeFailure() async {
        struct MockMovieDetailsResponse {
            static func getMockedMovieDetailsResponse() -> MovieDataModel? {
                return nil
            }
        }
        let result = await movieUseCase?.execute(with: movieID)
        switch result {
        case .success:
            let response = try? result?.get()
            let movieId = response?.id ?? 0
            XCTAssertEqual(movieId, self.movieID)
        case .failure(let error):
            XCTAssertEqual(error, .customString("Movie Data is nil"), "Expected 'Movie Data is nil' error")
        default :
            XCTFail("Fail with executeFailure result")
        }
    }
    
}
