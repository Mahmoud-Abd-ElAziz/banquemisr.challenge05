//
//  MoviesViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit
import Combine

final class MoviesViewModel:BaseViewModel {
    
    private let moviesUseCase: MoviesUseCase
    let moviesCategoeyType: MovieCategoryTypes

    @Published private(set) var movies: [MovieDataModel]? = nil
    @Published private(set) var isFetching: Bool = false
    @Published private(set) var hasMorePages: Bool = true

    let moviesPublisher = PassthroughSubject<[MovieDataModel], Never>()

    private var currentPage = 1
    private var totalPages = 1

    
    init(moviesUseCase: MoviesUseCase = MoviesUseCaseImpl() ,
         cateType: MovieCategoryTypes
        ) {
        self.moviesUseCase = moviesUseCase
        self.moviesCategoeyType = cateType
    }
    
    
}
// MARK: - Network
extension MoviesViewModel {
    
    @MainActor
    func fetchMovies(page: Int = 1, isLoadMore: Bool = false) {
        guard !isFetching else {
            Logger.logging("fetchMovies aborted: already fetching")
            return
        }
        guard page <= totalPages else {
            Logger.logging("fetchMovies aborted: exceeded totalPages")
            return
        }
        Logger.logging("fetchMovies on fire 🚀")
        isFetching = true
        Task { [weak self] in
            guard let strongSelf = self else { return }
            let response: MoviesModel? = await strongSelf.performRequest {
                try await strongSelf.moviesUseCase.execute(category: strongSelf.moviesCategoeyType, page: page).get()
            }
            strongSelf.isFetching = false
            if let response = response {
                strongSelf.handleFetchedMovies(response, page: page, isLoadMore: isLoadMore)
            }
        }
    }
    
    @MainActor
    func loadMoreMovies() {
        guard hasMorePages, !isFetching else {
             Logger.logging("Not load More Movies - already fetching or no more pages")
             return
         }
        fetchMovies(page: currentPage + 1, isLoadMore: true)
    }
    
    private func handleFetchedMovies(_ response: MoviesModel, page: Int, isLoadMore: Bool) {
        let fetchedMovies = response.results ?? []
        if isLoadMore {
            self.movies?.append(contentsOf: fetchedMovies)
        } else {
            self.movies = fetchedMovies
        }
        self.currentPage = page
        self.totalPages = response.totalPages ?? self.totalPages
        self.hasMorePages = currentPage < totalPages
        self.moviesPublisher.send(self.movies ?? [])
    }
    
    
}
//MARK: - Helpers
extension MoviesViewModel {
    func getMovies() -> [MovieDataModel] {
        return movies ?? []
    }
}
