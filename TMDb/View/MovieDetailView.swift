//
//  MovieDetailView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var movieDetails = MovieDetailsViewModel()
    let movie: Movie?
    
    var body: some View {
        ScrollView {
            VStack {
                BackdropImageView(backdropPath: movie?.backdropPathString ?? "", voteAverage: movie?.voteAverage ?? 0)
                DescriptionView(language: movie?.language ?? "")
                SynopsisView(synopsis: movie?.overview ?? "")
                MainCastView()
                MainTechnicalTeamView()
             Spacer()
                .navigationTitle("Movie details")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Image(systemName: "square.and.arrow.up"))
            }
            .onAppear {
                movieDetails.get(with: movie?.id)
            }
            .environmentObject(movieDetails)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: TestData.movies[0])
    }
}
