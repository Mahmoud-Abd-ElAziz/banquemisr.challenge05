//
//  MovieDetailsModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation


//struct MovieDataModel: Codable{
//    var id: Int?
//    var title: String?
//    var releaseDate: String?
//    var voteAverage: Double?
//    var posterPath: String?
//    var overview: String?
//    var originalTitle: String?
//    var adult: Bool?
//    var genres: [GenreModel]?
//    var originCountry: [String]?
//    var originalLanguage: String?
//    var spokenLanguages: [SpokenLanguageModel]?
//    var productionCompanies: [ProductionCompanyModel]?
//    var productionCountries: [ProductionCountryModel]?
//    var runtime: Int?
//    var tagline: String?
//    var voteCount: Int?
//    var revenue: Double?
//    var budget: Double?
//    var status: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case releaseDate = "release_date"
//        case voteAverage = "vote_average"
//        case posterPath = "poster_path"
//        case overview
//        case originalTitle = "original_title"
//        case adult
//        case genres
//        case originCountry = "origin_country"
//        case originalLanguage = "original_language"
//        case spokenLanguages = "spoken_languages"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case runtime
//        case tagline
//        case voteCount = "vote_count"
//        case revenue
//        case budget
//        case status
//
//    }
//}
//
//struct GenreModel: Codable {
//    var name: String?
//}
//
//struct ProductionCompanyModel: Codable {
//    var id: Int?
//     var logoPath: String?
//     var name: String?
//     var originCountry: String?
//     
//     enum CodingKeys: String, CodingKey {
//         case id
//         case logoPath = "logo_path"
//         case name
//         case originCountry = "origin_country"
//     }
//}
//
//struct ProductionCountryModel: Codable {
//    var name: String?
//}
//
//struct SpokenLanguageModel: Codable {
//    var englishName: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case englishName = "english_name"
//    }
//}
//
//struct CreditsModel: Codable {
//    var cast: [CastModel]
//}

struct MovieDataModel: Codable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: CollectionInfoModel?
    var budget: Int?
    var genres: [GenreModel]?
    var homepage: String?
    var id: Int?
    var imdbID: String?
    var originCountry: [String]?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompanyModel]?
    var productionCountries: [ProductionCountryModel]?
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    var spokenLanguages: [SpokenLanguageModel]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbID = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct CollectionInfoModel: Codable {
    var id: Int?
    var name: String?
    var posterPath: String?
    var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

struct GenreModel: Codable {
    var id: Int?
    var name: String?
}

struct ProductionCompanyModel: Codable {
    var id: Int?
    var logoPath: String?
    var name: String?
    var originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountryModel: Codable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct SpokenLanguageModel: Codable {
    var englishName: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case name
    }
}
