//
//  Token.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

struct Token: Decodable {
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
