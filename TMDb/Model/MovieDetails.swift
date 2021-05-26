//
//  MovieDetails.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

struct MovieDetails: Decodable {
    let id: Int
    let title: String
    let backdropPath: String?
    let genres: [Genre]
    let originalLanguage: String
    let overview: String
    let runtime: Int
    var duration: String {
        let hours = runtime / 60
        let minutes = runtime % 60
        return "\(hours)h \(minutes)m"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case originalLanguage = "original_language"
        case overview = "overview"
        case runtime = "runtime"
    }
}
struct Genre: Decodable {
    let name: String
}
