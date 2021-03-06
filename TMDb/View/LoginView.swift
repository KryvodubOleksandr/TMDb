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
    @State private var password = "weAreLaunching"
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("TMDb")
                    .resizable()
                    .scaledToFit()
                    .mask(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 180, height: 180, alignment: .center)
                Spacer()
            }
            Text("USERNAME")
                .foregroundColor(.secondary)
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray5))
                .mask(RoundedRectangle(cornerRadius: 8))
            Text("PASSWORD")
                .foregroundColor(.secondary)
            TextField("Password", text: $password)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray5))
                .mask(RoundedRectangle(cornerRadius: 8))
            HStack {
                Spacer()
                Button(action: {
                    if login.getTokenValue() != nil {
                        login.validateToken(username: username, password: password, token: login.getTokenValue()!)
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
