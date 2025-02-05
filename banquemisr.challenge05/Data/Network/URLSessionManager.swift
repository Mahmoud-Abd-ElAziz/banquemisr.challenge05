//
//  URLSessionManager.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 19/09/2024.
//
import Foundation

// MARK: - URLSession Manager (For Custom Configurations)
final class URLSessionManager {
    static let shared = URLSessionManager()
    
    let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        config.waitsForConnectivity = true
        self.session = URLSession(configuration: config)
    }
}
