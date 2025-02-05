//
//  MoviesUseCaseTest.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 05/02/2025.
//

import UIKit
import XCTest
@testable import banquemisr_challenge05

final class MoviesUseCaseTests: XCTestCase {

    private let category: MovieCategoryTypes = .nowPlaying(page: 1)
    private var mockMoviesUseCase: MockMoviesUseCase!
    private var moviesUseCase: MoviesUseCase!

    override func setUp() {
        super.setUp()
        mockMoviesUseCase = MockMoviesUseCase()
        moviesUseCase = mockMoviesUseCase
    }

    override func tearDown() {
        mockMoviesUseCase = nil
        moviesUseCase = nil
        super.tearDown()
    }

    func executeSuccess() async {
        let result = await moviesUseCase.execute(category: category, page: 1)
        switch result {
        case .success(let movies):
            XCTAssertNotNil(movies, "Movies is loaded")
        case .failure:
            XCTFail("Movies got failure")
        }
    }

    func executeFailure() async {
        struct MockMoviesResponse {
            static func getMockedMoviesResponse() -> MoviesModel? {
                return nil
            }
        }
        let result = await moviesUseCase.execute(category: category, page: 1)
        switch result {
        case .success:
            XCTFail("Movies is loaded")
            let response = try? result.get()
            let movies = response?.results?.first?.title
            XCTAssertNotNil(movies)
        case .failure(let error):
            XCTAssertEqual(error, .customString("Movies is nil"), "Expected 'Movies is nil' error")
        }
    }
}
