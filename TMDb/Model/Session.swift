//
//  Session.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

struct Session: Decodable {
    let success: Bool
    let sessionID: String
    
    struct Create: Encodable {
        let requestToken: String
        
        enum CodingKeys: String, CodingKey {
            case requestToken = "request_token"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case sessionID = "session_id"
    }
}
