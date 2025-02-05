//
//  MovieRepositoryTest.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 05/02/2025.
//

import UIKit
@testable import banquemisr_challenge05
import XCTest

final class MoviesRepositoryTest: XCTestCase {

    private var mockRepository: MockMoviesRepository!
    private var repository: MovieRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockMoviesRepository()
        repository = mockRepository
    }

    override func tearDown() {
        mockRepository = nil
        repository = nil
        super.tearDown()
    }

    func testMoviesSuccess() async {
        let result = await repository.movies(with: .nowPlaying(page: 1))
        switch result {
        case .success(let moviesModel):
            XCTAssertNotNil(moviesModel, "Movies List Loaded successfully")
        case .failure:
            XCTFail("Movie got failure")
        }
    }

}
