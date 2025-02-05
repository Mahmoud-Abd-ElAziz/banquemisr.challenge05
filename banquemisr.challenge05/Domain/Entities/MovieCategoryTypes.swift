//
//  MovieCategoryTypes.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

enum MovieCategoryTypes {
    
    case nowPlaying(page:Int)
    case popular(page:Int)
    case upcoming(page:Int)
    
    var navigationTitle: String {
        switch self {
           case .nowPlaying: return "🚀 Now Playing"
           case .popular:    return "🌟 Popular"
           case .upcoming:   return "🔥 Upcoming"
        }
    }
    
    var apiRouter:MoviesApiRouter {
      switch self {
        case .nowPlaying(let page):
            return .nowPlaying(page: page)
        case .popular(let page):
            return .popular(page: page)
        case .upcoming(let page):
            return .upcoming(page: page)
        }
    }
    
}
