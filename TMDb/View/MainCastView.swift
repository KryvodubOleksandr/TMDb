//
//  MainCastView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct MainCastView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text ("Main cast")
                .font(.title2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach((1...10), id: \.self) { _ in
                        VStack {
                            Text("Character")
                                .bold()
                                .foregroundColor(.secondary)
                            Circle()
                                .fill(Color.gray)
                                .frame(height: 60)
                            Text("Actor")
                                .foregroundColor(.secondary)
                        }
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}

struct MainCastView_Previews: PreviewProvider {
    static var previews: some View {
        MainCastView()
    }
}
