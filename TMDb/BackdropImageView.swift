//
//  BackdropImageView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct BackdropImageView: View {
    let movie: String?
    var body: some View {
        ZStack {
            Rectangle()
            Image(movie ?? "")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Spacer()
                Text(movie ?? "")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    ForEach((1...5), id: \.self) { _ in
                        Image(systemName: "star.fill")
                    }
                    Spacer()
                }
            .font(.title2)
            .foregroundColor(.white)
        }.padding()
    }
    .frame(height: 200)
}
}

struct BackdropImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackdropImageView(movie: "1917")
    }
}
