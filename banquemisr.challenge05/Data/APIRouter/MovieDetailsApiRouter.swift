//
//  MovieDetailsApiRouter.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

enum MovieDetailsApiRouter:RequestConfig {
   
    case movieDetails(moviId:Int)
    
    var path: WebServices{
        switch self {
        case .movieDetails(let movieId): return .movieDetails(movieId: movieId.description)
        }
    }
    
    var method: HTTPMethods{
        switch self {
           default : .get
        }
    }
    
    var body: [String : Any]?{
        switch self {
           default : return nil
        }
    }
    
    var headers: [String : String]?{
        switch self {
           case .movieDetails: return customHeader
        }
    }
    
    var requestType: RequestType{
        switch self {
          default : .normal
        }
    }
    
    var queryParameters: [String: Any]? {
        switch self {
        default : return APIQueryDefaults.defaultQuery
        }
    }
    
    
    
}
