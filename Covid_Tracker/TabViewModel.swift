//
//  TabViewModel.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import SwiftUI
import CoreData

class TabViewModel: ObservableObject {
    
    @Published var currentTab = "Home"
    
    // Detail Data...
    @Published var currentCard: String = ""
    @Published var showDetail: Bool = false
    @Published var countryCases: Int = 0
    @Published var counrtyDeadths : Int = 0
    @Published var counrtyRecovered : Int = 0
    @Published var liked : [String : Bool] = [:]
    @Published var currentCountry : String = ""
}


