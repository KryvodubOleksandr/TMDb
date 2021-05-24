//
//  MovieDetailView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: String?
    
    var body: some View {
            Image(movie ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: "kong")
    }
}
