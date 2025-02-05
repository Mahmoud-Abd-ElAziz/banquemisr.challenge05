//
//  MovieModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

struct MoviesModel: GeneralResponseModel {
    var results: [MovieDataModel]?
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
