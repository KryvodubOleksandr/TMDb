//
//  ContentView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI
import SwURL

struct PopularMoviesView: View {
    @ObservedObject var popularMovies = PopularMoviesViewModel()
    @State private var selectedMovie: Movie?
    @State private var isShowingMovieDetailView = false

    let layout = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink(destination: MovieDetailView(movie: selectedMovie),
                               isActive: $isShowingMovieDetailView) { EmptyView() }
                
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(popularMovies.movies, id: \.title) { movie in
                        Button(action: {
                            selectedMovie = movie
                            isShowingMovieDetailView = true
                        }) {
                            RemoteImageView(url: URL(string: movie.posterPathString) ?? URL(string: "https://")!)
                                .scaledToFill()
                                .overlay(
                                    HStack {
                                        Text(movie.title)
                                            .bold()
                                            .padding(8)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .background(Color.black.opacity(0.5))
                                    , alignment: .bottomLeading)
                                .mask(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }.padding(10)
                .navigationTitle("Popular Movies")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
