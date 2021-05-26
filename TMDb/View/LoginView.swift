//
//  LoginView.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var login: LoginViewModel
    @State private var username = "KryvodubOleksandr"
    @State private var password = "tmdbChemburizio"
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("USERNAME")
                .foregroundColor(.secondary)
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray5))
                .mask(RoundedRectangle(cornerRadius: 8))
            Text("PASSWORD")
                .foregroundColor(.secondary)
            TextField("Password", text: $password)
                .padding()
                .background(Color(.systemGray5))
                .mask(RoundedRectangle(cornerRadius: 8))
            HStack {
                Spacer()
                Button(action: {
                    if login.token != nil {
                        login.validateToken(username: username, password: password, token: login.token!.requestToken)
                    }
                }) {
                    Text("LOGIN")
                        .padding()
                        .foregroundColor(.primary)
                        .mask(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
