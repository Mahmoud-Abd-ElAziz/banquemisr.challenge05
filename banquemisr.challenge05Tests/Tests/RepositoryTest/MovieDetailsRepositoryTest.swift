//
//  MovieDetailsRepositoryTest.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 05/02/2025.
//
@testable import banquemisr_challenge05
import UIKit
import XCTest

final class MovieDetailsRepositoryTests: XCTestCase {

    private let movieID = 1249289
    private var mockRepository: MockMovieDetailsRepository!
    private var repository: MovieDetailsRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockMovieDetailsRepository()
        repository = mockRepository
    }

    override func tearDown() {
        mockRepository = nil
        repository = nil
        super.tearDown()
    }

    func testMovieDetailsSuccess() async {
        let result = await repository.movieDetails(with: movieID)
        
        switch result {
        case .success(let movieData):
            XCTAssertEqual(movieData.id, movieID, "Movie ID match the requested ID")
        case .failure:
            XCTFail("Movie got failure")
        }
    }

}
