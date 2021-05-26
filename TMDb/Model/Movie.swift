//
//  Movie.swift
//  TMDb
//
//  Created by Alexander Sharko on 25.05.2021.
//

import Foundation

struct Movie: Decodable {
    let posterPath: String?
    let overview: String
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let voteAverage: Double
    var posterPathString: String {
        "https://www.themoviedb.org/t/p/w1280" + (posterPath ?? "")
    }
    var backdropPathString: String {
        "https://www.themoviedb.org/t/p/w1280" + (backdropPath ?? "")
    }
    var language: String {
        switch originalLanguage {
            case "en": return "English"
            case "fr": return "French"
            case "nl": return "Dutch"
            case "ja": return "Japanese"
            case "ko": return "Korean"
            default: return "Other"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case overview = "overview"
        case id = "id"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title = "title"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
    }
}

struct MovieList: Decodable {
    let results: [Movie]
}
