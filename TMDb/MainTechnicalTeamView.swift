//
//  MainTechnicalTeamView.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

struct MainTechnicalTeamView: View {
    let team = ["Alice", "John", "Peter", "Bob"]
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text ("Main Technical Team")
                    .font(.title2)
                ForEach(team, id: \.self) { teamMember in
                    Text(teamMember)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }.padding()
    }
}

struct MainTechnicalTeamView_Previews: PreviewProvider {
    static var previews: some View {
        MainTechnicalTeamView()
    }
}
