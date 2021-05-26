//
//  DescriptionView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var movieDetails: MovieDetailsViewModel
    let language: String
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Duration")
                    .font(.title2)
                Text(movieDetails.duration)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Genre")
                    .font(.title2)
                Text(movieDetails.genres)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Language")
                    .font(.title2)
                Text(language)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }.padding()
    }
}
