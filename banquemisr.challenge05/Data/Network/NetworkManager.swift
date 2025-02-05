//
//  MainTabBarController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import UIKit

protocol NetworkManager {
    func perform<T: Decodable>(requestConfig: RequestConfig, responseType: T.Type) async throws -> T
}

extension NetworkManager {
    
    func perform<T: Decodable>(requestConfig: RequestConfig, responseType: T.Type) async throws -> T {
        guard let builtRequest = RequestBuilder.buildRequest(with: requestConfig) else {
            throw HttpClientError.invalidResponse
        }
        
        NetworkLogger.logRequest(request: builtRequest)
        
        let session = URLSessionManager.shared.session
        let (data, urlResponse) = try await session.data(for: builtRequest)
        
        NetworkLogger.logResponse(response: urlResponse, data: data)
        
        return try ResponseDecoder.decodeResponse(data: data, response: urlResponse)
    }
    
    func performRequestWithRetry<T: Decodable>(requestConfig: RequestConfig, responseType: T.Type, retries: Int = 3) async throws -> T {
        var attempts = 0
        while attempts < retries {
            do {
                return try await perform(requestConfig: requestConfig, responseType: responseType)
            } catch {
                attempts += 1
                if attempts == retries {
                    throw error
                }
            }
        }
        throw HttpClientError.networkUnknown("")
    }
}
