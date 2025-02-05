//
//  NetworkConstants.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

enum NetworkConstants: String{
    case accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNzc2ODM5YTYzMjM1MjllYzc2MDQ1NDNkZWFmZGFjMiIsIm5iZiI6MTczODM0MDk3Mi4yMjIwMDAxLCJzdWIiOiI2NzljZmE2Yzk1ZDg4M2ZmMjUwMTQwMzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.p-bUOnHYxJJqTxwgznC_pHGBcI1Ft3jFvaCfLP-QUP8"
    case apiKey = "b776839a6323529ec7604543deafdac2"
    
    case imgBaseURL = "https://image.tmdb.org/t/p/"

}
struct ImageConstants {
    enum Size: String {
        case w300 = "w300"
        case w780 = "w780"
    }
    
    static func imageURL(for path: String, size: Size = .w780) -> String {
        return "\(NetworkConstants.imgBaseURL.rawValue)\(size.rawValue)\(path)"
    }
    
}
enum EnviromentType {
    case production
    case debuging
    
    func getEnviroment() ->String {
        switch self {
        case .production:
            return "https://api.themoviedb.org/3/"
        case .debuging:
            return "https://api.themoviedb.org/3/"
        }
    }
}
enum APICollectonType {
    case general
    case movie
    
    var section : String {
        switch self {
        case .general :
            return ""
        case .movie :
            return "movie"
            
        }
    }
}
enum WebServices {
    
    // MARK: - Movies
    case nowPlaying
    case popular
    case upcoming
    case movieDetails(movieId: String)
    
    private var path: String {
        switch self {
        case .nowPlaying:
            return "/now_playing"
        case .popular:
            return "/popular"
        case .upcoming:
            return "/upcoming"
        case .movieDetails(let movieId):
            return "/\(movieId)"
        }
    }
    
    func getURL(for environment: EnviromentType = .debuging ,
                with section: APICollectonType = .movie ) -> String {
        let baseURL = environment.getEnviroment()
        let movieSection = section.section
        return "\(baseURL)\(movieSection)\(self.path)"
    }
    
    
}
