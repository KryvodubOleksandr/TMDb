//
//  BackdropImageView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct BackdropImageView: View {
    let backdropPath: String
    let title: String
    let voteAverage: Double
    var body: some View {
        ZStack {
            Rectangle()
            Image(backdropPath)
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Spacer()
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(.yellow)
                    Text(String(voteAverage))
                        .font(.title2)
                        .bold()
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
        BackdropImageView(backdropPath: TestData.movies[0].backdropPath ?? "", title: TestData.movies[0].title, voteAverage: TestData.movies[0].voteAverage)
    }
}
