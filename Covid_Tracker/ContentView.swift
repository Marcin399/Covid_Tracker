//
//  ContentView.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @Namespace var animation
    var body: some View {
        
//Home(animation: animation)
        CustomTabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
