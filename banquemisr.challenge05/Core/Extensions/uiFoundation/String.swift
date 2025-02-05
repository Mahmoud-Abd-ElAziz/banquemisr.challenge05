//
//  String.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import Foundation

extension String {
    /// Appends query parameters to the URL string
    func addingQueryParameters(_ parameters: [String: Any]?) -> String {
        guard let parameters = parameters, !parameters.isEmpty else { return self }
        
        var urlComponents = URLComponents(string: self)
        var queryItems = urlComponents?.queryItems ?? []
        
        for (key, value) in parameters {
            let stringValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            queryItems.append(URLQueryItem(name: key, value: stringValue))
        }
        
        urlComponents?.queryItems = queryItems
        return urlComponents?.url?.absoluteString ?? self
    }
}
