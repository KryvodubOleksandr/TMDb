//
//  MainCastView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI
import SwURL

struct ProductionCompaniesView: View {
    @EnvironmentObject var movieDetails: MovieDetailsViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text ("Production companies:")
                .font(.title2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(movieDetails.productionCompanies, id: \.name) { company in
                        VStack(alignment: .center, spacing: 5) {
                            Text(company.name)
                                .font(.callout)
                                .foregroundColor(.secondary)
                            RemoteImageView(url: URL(string: company.logoPathString) ?? URL(string: "https://")!)
                                .scaledToFit()
                            Spacer()
                        }
                        .padding(8)
                        .background(Color(.secondarySystemFill))
                        .mask(RoundedRectangle(cornerRadius: 8))
                    }.frame(height: 100)
                    Spacer()
                }
            }
        }.padding()
    }
}

struct MainCastView_Previews: PreviewProvider {
    static var previews: some View {
        ProductionCompaniesView()
    }
}
