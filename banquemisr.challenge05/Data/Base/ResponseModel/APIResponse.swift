//
//  APIResponse.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

protocol GeneralResponseModel: Decodable{
    var page:Int?{get set}
    var totalResults:Int?{get set}
    var totalPages:Int?{get set}
}

struct BaseResponseModel:GeneralResponseModel {
    var page: Int?
    
    var totalResults: Int?
    
    var totalPages: Int?
    
    
}
