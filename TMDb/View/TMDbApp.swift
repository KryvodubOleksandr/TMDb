//
//  TMDbApp.swift
//  TMDb
//
//  Created by Alexander Sharko on 24.05.2021.
//

import SwiftUI

@main
struct TMDbApp: App {
    
    init() {
        UINavigationBar.appearance().tintColor = UIColor(Color.primary)
        UINavigationBar.appearance().shadowImage = UIImage.init()
        UIButton.appearance().tintColor = UIColor(Color.primary)
    }
    
    var body: some Scene {
        WindowGroup {
            PopularMoviesView()
        }
    }
}
