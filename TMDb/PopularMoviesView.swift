//
//  ContentView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct PopularMoviesView: View {
    
    @State private var isShowingMovieDetailView = false
    let movies = Array(1...100).map { "Movie №\($0)" }
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(movies, id: \.self) { movie in
                        
                        NavigationLink(destination: Text("Movie details"),
                                       isActive: $isShowingMovieDetailView) {
                            Rectangle()
                                .fill(Color(.lightGray))
                                .frame(minHeight: 200)
                                .overlay(
                                    HStack {
                                        Spacer()
                                        Text(movie)
                                            .padding(5)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .background(Color.black.opacity(0.3))
                                    , alignment: .bottomLeading)
                                .mask(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }.padding()
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
