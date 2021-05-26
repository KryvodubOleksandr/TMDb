//
//  BackdropImageView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI
import SwURL

struct BackdropImageView: View {
    @EnvironmentObject var movieDetails: MovieDetailsViewModel
    let backdropPath: String
    let voteAverage: Double
    var body: some View {
        ZStack {
            Color.clear
            RemoteImageView(url: (URL(string: backdropPath) ?? URL(string: "https://")!))
                .scaledToFill()
            VStack(alignment: .leading) {
                Spacer()
                Text(movieDetails.movie?.title ?? "")
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
