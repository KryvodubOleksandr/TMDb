//
//  MovieDetailView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie?
    
    var body: some View {
        ScrollView {
            VStack {
                BackdropImageView(backdropPath: movie?.backdropPath ?? "", title: movie?.title ?? "", voteAverage: movie?.voteAverage ?? 0)
                DescriptionView(language: movie?.originalLanguage ?? "")
                SynopsisView(synopsis: movie?.overview ?? "")
                MainCastView()
                MainTechnicalTeamView()
             Spacer()
                .navigationTitle("Movie details")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Image(systemName: "square.and.arrow.up"))
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: TestData.movies[0])
    }
}
