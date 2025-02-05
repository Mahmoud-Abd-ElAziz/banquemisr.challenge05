//
//  MovieDetailsViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import UIKit
import Combine

final class MovieDetailsViewModel:BaseViewModel {
    
    private let movieDetailUseCase: MovieDetailsUseCase
    private let movieID: Int

    @Published private(set) var sections: [MovieDetailsSection] = []
    
    let movieDetailsPublisher = PassthroughSubject<[MovieDetailsSection], Never>()

    
    init(movieUseCase: MovieDetailsUseCase = MovieDetailsUseCaseImpl(),
         movieID:Int) {
        self.movieDetailUseCase = movieUseCase
        self.movieID = movieID
        Logger.logging("Movie Id === \(movieID)")
    }
    
    
}
// MARK: - Network
extension MovieDetailsViewModel {
    
    @MainActor
    func fetchMovieDetails() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            let response: MovieDataModel? = await strongSelf.performRequest {
                try await strongSelf.movieDetailUseCase.execute(with: strongSelf.movieID).get()
            }
            if let response = response {
                strongSelf.handleFetchedMovie(with: response)
            }
        }
    }
    
    private func handleFetchedMovie(with response: MovieDataModel) {
        let posterSection = MovieDetailsSection(type: .poster, items: [response.posterPath ?? ""])
        let genres = response.genres?.compactMap { $0.name }.joined(separator: ", ") ?? "N/A"
        let productionCompanies = response.productionCompanies ?? []

        let detailsSection = MovieDetailsSection(type: .details, items: [
            "Title: \(response.title ?? "N/A")",
            "Release Date: \(response.releaseDate ?? "N/A")",
            "Rating: 🌟 \(response.voteAverage ?? 0)",
            "Genres: 🌟 \(genres)",
            "\(response.overview ?? "N/A")"

        ])
        
        let productionCompaniesSection = MovieDetailsSection(type: .productionCompanies, items: productionCompanies)
        
        self.sections = [posterSection, detailsSection,productionCompaniesSection]
        self.movieDetailsPublisher.send(sections)
    }
    
    
}
