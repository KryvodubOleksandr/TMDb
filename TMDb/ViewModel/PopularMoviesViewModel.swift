//
//  PopularMoviesViewModel.swift
//  TMDb
//
//  Created by Alexander Sharko on 25.05.2021.
//

import Foundation

final class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    var movieRequest = MovieRequest()
    
    init() {
        get()
    }
    
    func get() {
        movieRequest.getPopularMovies { [weak self] result in
            switch result {
            case .failure:
                print("There was an error getting the popular movies")
            case .success(let movies):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.movies = movies.results
                }
            }
        }
    }
}
