//
//  MovieRequest.swift
//  TMDb
//
//  Created by Alexander Sharko on 25.05.2021.
//

import Foundation

enum MovieRequestError: Error {
    case noData
    case decodingError
    case responseFailed
}

struct MovieRequest {
    let baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getPopularMovies(completion: @escaping (Result<MovieList, MovieRequestError>) -> Void) {
        let path = baseURL + "popular" + API.key
        guard let url = URL(string: path) else {
            fatalError("Unable to create URL")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let resources = try JSONDecoder().decode(MovieList.self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getDetails(with movieID: Int, completion: @escaping (Result<MovieDetails, MovieRequestError>) -> Void) {
        let path = baseURL + String(movieID) + API.key
        guard let url = URL(string: path) else {
            fatalError("Unable to create URL")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let resources = try JSONDecoder().decode(MovieDetails.self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
