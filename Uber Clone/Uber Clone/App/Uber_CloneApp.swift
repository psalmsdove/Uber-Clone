//
//  Uber_CloneApp.swift
//  Uber Clone
//
//  Created by Ali Erdem Kökcik on 31.01.2023.
//

import SwiftUI

@main
struct Uber_CloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}

