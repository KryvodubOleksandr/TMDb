//
//  DescriptionView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Duration")
                    .font(.title2)
                Text("1h 50m")
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Genre")
                    .font(.title2)
                Text("Drama, Music")
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Language")
                    .font(.title2)
                Text("English")
                    .foregroundColor(.secondary)
            }
        }.padding()
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
