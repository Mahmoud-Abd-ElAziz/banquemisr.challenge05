//
//  MovieDetailsSectionType.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//


enum MovieDetailsSectionType {
    case poster
    case details
    case productionCompanies
    
    var title: String {
        switch self {
        case .poster:
            return ""
        case .details:
            return "Details"
        case .productionCompanies:
            return "Production Companies"
        }
    }
    
}
struct MovieDetailsSection {
    let type: MovieDetailsSectionType
    let items: [Any]
}
