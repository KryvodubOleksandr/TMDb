//
//  ContentView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct PopularMoviesView: View {
    
    @State private var selectedMovie: String? = nil
    @State private var isShowingMovieDetailView = false
    let movies = ["django", "kong", "1917", "titanic", "joker", "moonlight"]
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
                    ForEach(movies, id: \.self) { movie in
                        Button(action: {
                            selectedMovie = movie
                            isShowingMovieDetailView = true
                        }) {
                            Image(movie)
                                .resizable()
                                .scaledToFill()
                                .overlay(
                                    HStack {
                                        Spacer()
                                        Text(movie)
                                            .padding(5)
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
