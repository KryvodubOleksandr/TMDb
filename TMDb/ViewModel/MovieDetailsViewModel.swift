//
//  MovieDetailsViewModel.swift
//  TMDb
//
//  Created by Alexander Sharko on 26.05.2021.
//

import Foundation

final class MovieDetailsViewModel: ObservableObject {
    @Published var movieRequest = MovieRequest()
    @Published var movie: MovieDetails?
    
    var title: String {
        movie?.title ?? ""
    }
    var genres: String {
        guard let genres = movie?.genres else {
            return ""
        }
        return genres.map { String($0.name) }.joined(separator: ", ")
    }
    var duration: String {
        movie?.duration ?? ""
    }
    
    func get(with movieID: Int?) {
        guard let id = movieID else {
            return
        }
        movieRequest.getDetails(with: id) { [weak self] result in
            switch result {
            case .failure:
                print("There was an error getting the movie details")
            case .success(let movie):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.movie = movie
                }
            }
        }
    }
}
