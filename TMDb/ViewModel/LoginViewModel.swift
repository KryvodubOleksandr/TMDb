//
//  LoginViewModel.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var isNotLoggedIn = true
    var token: Token?
    var session: Session?
    var loginRequest = LoginRequest()
    
    init() {
        getToken()
    }
    
    func getToken() {
        loginRequest.getToken { result in
            switch result {
            case .failure:
                print("There was an error getting the new token")
            case .success(let newToken):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.token = newToken
                }
            }
        }
    }
    func validateToken(username: String, password: String, token: String) {
        loginRequest.validateToken(username: username, password: password, token: token) { result in
            switch result {
            case .failure:
                print("There was an error getting validating token")
            case .success(let validatedToken):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.token = validatedToken
                    self.getSession(with: validatedToken.requestToken)
                }
            }
        }
    }
    
    func getSession(with token: String) {
        loginRequest.getSession(with: token) { result in
            switch result {
            case .failure:
                print("There was an error getting the session")
            case .success(let newSession):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.session = newSession
                    self.isNotLoggedIn = false
                }
            }
        }
    }
}
