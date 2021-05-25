//
//  SynopsisView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct SynopsisView: View {
    @State private var isReadingMore = false
    let synopsisText = "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla "
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("Synopsis")
                    .font(.title2)
                Text(synopsisText)
                    .foregroundColor(.secondary)
                    .lineLimit(isReadingMore ? .max : 3)
                HStack {
                    Spacer()
                    Button("Read more") {
                        withAnimation {
                            isReadingMore.toggle()
                        }
                    }.foregroundColor(.red)
                }
            }.padding()
    }
}

struct SynopsisView_Previews: PreviewProvider {
    static var previews: some View {
        SynopsisView()
    }
}
