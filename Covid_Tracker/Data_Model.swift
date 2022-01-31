//
//  Data_Model.swift
//  Covid_Tracker
//
//  Created by Marcin on 14/01/2022.
//

import Foundation

struct DetailData : Decodable{
    var country : String
    var todayDeaths : Int
    var updated : Double
    var todayCases : Int
    var cases : Int
    var todayRecovered : Int
    var countryInfo : countryinfo
    var active : Int
    var population : Int
    
    
    //var flag : String
}

struct AllCountry : Decodable{
    
    var countries : [covidCountry]
    
}

struct covidCountry : Decodable{
    
    var country : String
    
}
struct countryinfo : Decodable{
    var flag  : String
   // var id : Int
}

struct allCasesStruc : Decodable{
    var todayCases : Int
}
