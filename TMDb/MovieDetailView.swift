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
        ScrollView {
            VStack {
                BackdropImageView(movie: movie)
                DescriptionView()
                SynopsisView()
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
        MovieDetailView(movie: "1917")
    }
}
