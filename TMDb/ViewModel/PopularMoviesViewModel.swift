//
//  PopularMoviesViewModel.swift
//  TMDb
//
//  Created by Alexander Sharko on 25.05.2021.
//

import Foundation

final class PopularMoviesViewModel {
    let movies: [Movie]
    
    init() {
        movies = TestData.movies
    }
}
