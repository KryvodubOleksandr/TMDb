//
//  Login.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

struct Login: Codable {
    var username: String
    var password: String
    var requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
        case requestToken = "request_token"
    }
}
