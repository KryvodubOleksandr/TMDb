//
//  BackdropImageView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct BackdropImageView: View {
    let movie: Movie?
    var body: some View {
        ZStack {
            Rectangle()
            Image(movie?.posterPath ?? "")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Spacer()
                Text(movie?.title ?? "")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(movie?.voteAverage ?? 0))
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
        BackdropImageView(movie: TestData.movies[0])
    }
}
