//
//  MoviesApiRouter.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

enum MoviesApiRouter: RequestConfig {
    
    case nowPlaying(page: Int)
    case popular(page: Int)
    case upcoming(page: Int)
    
    var path: WebServices {
        switch self {
        case .nowPlaying: return .nowPlaying
        case .popular: return .popular
        case .upcoming: return .upcoming
        }
    }
    
    var method: HTTPMethods {
        switch self {
        default: return .get
        }
    }
    
    var body: [String: Any]? {
        switch self {
        default: return nil
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default: return customHeader
        }
    }
    
    var requestType: RequestType {
        switch self {
        default: return .normal
        }
    }
    
    var queryParameters: [String: Any]? {
        var query = APIQueryDefaults.defaultQuery
        switch self {
        case .nowPlaying(let page), .popular(let page), .upcoming(let page):
            query["page"] = page
        }
        return query
    }
    
}
