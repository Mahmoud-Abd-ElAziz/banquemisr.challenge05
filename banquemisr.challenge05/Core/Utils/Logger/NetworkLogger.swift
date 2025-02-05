//
//  NetworkLogger.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation


final class NetworkLogger {
    static func logRequest(request: URLRequest?) {
      #if DEBUG
        print("-------------------------- NETWORK REQUEST START 📟 ⏳ 📡 --------------------------")
        if let url = request?.url, let httpMethod = request?.httpMethod {
            print("📎 \(httpMethod) \(url)")
        }
        if let headers = request?.allHTTPHeaderFields?.format(options: .prettyPrinted) {
            print("🧾 Headers: \(headers)")
        }
        if let httpBody = request?.httpBody, let bodyString = String(data: httpBody, encoding: .utf8) {
            print("📝 Body: \(bodyString)")
        }
        print("----------------------------------🚀 ⌛️ 📡----------------------------------------------")
       #endif
    }

    static func logResponse(response: URLResponse, data: Data?) {
     #if DEBUG
        print("--------------------------- NETWORK RESPONSE START 📟 ⏳ 📡 ---------------------------")
        if let httpResponse = response as? HTTPURLResponse {
            print("📎 Response URL: \(httpResponse.url?.absoluteString ?? "Unknown URL")")
            print("✅ Response - Status Code: \(httpResponse.statusCode)")
        }
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("⬇️ Response Body: \(dataString)")
        }
        print("--------------------------- NETWORK RESPONSE END 🚀 ⌛️ 📡 -----------------------------")
      #endif
    }
}

