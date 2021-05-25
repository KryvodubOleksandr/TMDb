//
//  ContentView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct PopularMoviesView: View {
    let popularMovies = PopularMoviesViewModel()
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
                            Image(movie.posterPath ?? "")
                                .resizable()
                                .scaledToFill()
                                .overlay(
                                    HStack {
                                        Text(movie.title)
                                            .bold()
                                            .padding(8)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .background(Color.black)
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
