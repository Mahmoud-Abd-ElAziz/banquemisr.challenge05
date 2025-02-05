//
//  CachedMovieDataModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

final class CachedMovieDataModel: NSObject {
    let movieData: MovieDataModel
    
    init(movieData: MovieDataModel) {
        self.movieData = movieData
    }
}
