//
//  HttpClientErrorCodes.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

enum HttpClientError: LocalizedError , Equatable {
    
    case invalidURL
    case invalidResponse
    case decodingFailed(Error)
    case serverError(String)
    case timeout
    case requestFailed(Error)
    case networkUnknown(String)
    case customString(String)

    var errorDescription: String? {
        
        switch(self) {
            case .invalidURL:
                return "This url is not valid."
            case .invalidResponse:
                return "Network response is not valid."
            case .decodingFailed(let error):
                return "Faild to decode data with error \(error.localizedDescription)."
            case .serverError(let code):
                return "An error has been occurred while processing your request with code \(code)"
            case .timeout:
               return "Connection timeout."
            case .requestFailed(let error):
               return "Request faild with error \(error.localizedDescription)."
            case .networkUnknown(let error):
               return "Network Unknown Error \(error)."
            case .customString(let error):
               return "Request faild with error \(error)."

        }
    }
    
    static func == (lhs: HttpClientError, rhs: HttpClientError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.invalidResponse, .invalidResponse),
             (.timeout, .timeout):
            return true
        case (.decodingFailed(let lhsError), .decodingFailed(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.serverError(let lhsCode), .serverError(let rhsCode)):
            return lhsCode == rhsCode
        case (.requestFailed(let lhsError), .requestFailed(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.networkUnknown(let lhsError), .networkUnknown(let rhsError)):
            return lhsError == rhsError
        case (.customString(let lhsError), .customString(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
    
}
