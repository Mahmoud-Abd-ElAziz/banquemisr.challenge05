//
//  RequestBuilder.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 19/09/2024.
//

import UIKit

// MARK: - Request Builder
final class RequestBuilder {
    
    static func buildRequest(with requestConfig: RequestConfig) -> URLRequest? {
        guard let url = URL(string: requestConfig.urlString) else { return nil }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let queryParams = requestConfig.queryParameters {
            components?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let finalURL = components?.url else { return nil }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = requestConfig.method.rawValue
        request.allHTTPHeaderFields = requestConfig.headers
        request.httpBody = httpBody(requestConfig)
        
        return request
    }
    
    private static func httpBody(_ requestConfig: RequestConfig) -> Data? {
        guard let parameters = requestConfig.body else { return nil }
        return try? JSONSerialization.data(withJSONObject: parameters)
    }
}

// MARK: - Response Decoder
final class ResponseDecoder {
    
    static func decodeResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HttpClientError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return try decodeData(data)
        case 400...499:
            let customErrorModel: BaseResponseModel = try decodeData(data)
            throw HttpClientError.customString("Response code: \(httpResponse.statusCode) Client-side error.")
         //   throw HttpClientError.customString(customErrorModel.message ?? "Client-side error")
        case 500...599:
            throw HttpClientError.serverError("\(httpResponse.statusCode)")
        default:
            throw HttpClientError.networkUnknown("\(httpResponse.statusCode)")
        }
    }
    
    private static func decodeData<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let decodingError {
            throw HttpClientError.decodingFailed(decodingError)
        }
    }
}
