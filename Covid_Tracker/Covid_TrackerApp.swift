//
//  Covid_TrackerApp.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import SwiftUI

@main
struct Covid_TrackerApp: App {
    @StateObject var clasdata = Getdata()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clasdata)
        }
    }
}
