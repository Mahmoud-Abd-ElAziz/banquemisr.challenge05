//
//  StorexApiServices.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import Foundation


protocol AppApiServicesProtocol: NetworkManager {
    func movies(with type: MovieCategoryTypes) async throws -> MoviesModel
    func moviesDetails(with movieID: Int) async throws -> MovieDataModel

}
class AppApiServices: AppApiServicesProtocol {
    
    func movies(with type: MovieCategoryTypes) async throws -> MoviesModel {
        try await perform(requestConfig: type.apiRouter, responseType: MoviesModel.self)
    }
    
    func moviesDetails(with movieID: Int) async throws -> MovieDataModel {
        try await perform(requestConfig: MovieDetailsApiRouter.movieDetails(moviId: movieID), responseType: MovieDataModel.self)
    }
    
}
