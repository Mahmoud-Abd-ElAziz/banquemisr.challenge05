//
//  MovieDetailsModuleConfiguration.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//


final class MovieDetailsModuleConfiguration {
    
    static func configureView(with movieID: Int) ->  MovieDetailsViewController{
        let viewModel = MovieDetailsViewModel(movieID: movieID)
        let view = MovieDetailsViewController(viewModel: viewModel)
        return view
    }
    
}
