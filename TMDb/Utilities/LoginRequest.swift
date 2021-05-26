//
//  LoginRequest.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

enum TokenRequestError: Error {
    case noData
    case decodingError
    case responseFailed
}
enum SessionRequestError: Error {
    case noData
    case decodingError
    case responseFailed
}

struct LoginRequest {
    
    func getToken(completion: @escaping (Result<Token, TokenRequestError>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new" + API.key) else {
            fatalError("Unable to create URL")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let newToken = try JSONDecoder().decode(Token.self, from: jsonData)
                completion(.success(newToken))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func validateToken(username: String, password: String, token: String, completion: @escaping (Result<Token, TokenRequestError>) -> Void) {
        let login = Login(username: username, password: password, requestToken: token)
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/validate_with_login" + API.key) else {
            fatalError("Unable to create URL")
        }
        guard let data = try? JSONEncoder().encode(login) else {
            fatalError("Unable to encode login data")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.noData))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.responseFailed))
                return
            }
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let validatedToken = try JSONDecoder().decode(Token.self, from: jsonData)
                completion(.success(validatedToken))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getSession(with token: String, completion: @escaping (Result<Session, SessionRequestError>) -> Void) {
        let requestToken = Session.Create(requestToken: token)
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new" + API.key) else {
            fatalError("Unable to create URL")
        }
        guard let data = try? JSONEncoder().encode(requestToken) else {
            fatalError("Unable to encode token data")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.noData))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.responseFailed))
                return
            }
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let newSession = try JSONDecoder().decode(Session.self, from: jsonData)
                completion(.success(newSession))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
