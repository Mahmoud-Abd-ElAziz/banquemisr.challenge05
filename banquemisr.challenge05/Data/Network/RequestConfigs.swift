//
//  RequestConfigs.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 19/09/2024.
//


import UIKit

enum RequestType {
    case normal
    case rawJson
    case multipart(images: [UIImage], imageName: String, isSingleImage: Bool)
}

enum HTTPMethods: String {
    case get
    case post
    case put
    case delete
    case patch
}
// Request Configs
protocol RequestConfig {
    var path: WebServices { get }
    var method: HTTPMethods { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
    var requestType: RequestType { get }
    var queryParameters: [String: Any]? { get }
}

//MARK: - Custom Header
extension RequestConfig {
    
    var customHeader: [String:String]? {
        var allHeaders:[String:String] = [:]
        
        let accessToken  = NetworkConstants.accessToken.rawValue
    
        allHeaders["Content-Type"]     = "application/json"
        allHeaders["Authorization"]    = "Bearer \(accessToken)"

        return allHeaders
    }
    
    var urlString: String {
        var string  = path.getURL()
        return string
    }

}
struct APIQueryDefaults {
    static let defaultQuery: [String: Any] = [
        "api_key": NetworkConstants.apiKey.rawValue,
        "language": "en-US",
        "include_adult": false
    ]
}
