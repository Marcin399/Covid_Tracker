//
//  GetData.swift
//  Covid_Tracker
//
//  Created by Marcin on 14/01/2022.
//
import SwiftUI
import Foundation
import Combine

class Getdata : ObservableObject{
    @Published var todayCases : [String:Int] = [:]
    @Published var todayDeadths : [String : Int] = [:]
    @Published var todayRecovered : [String:Int] = [:]
    @Published var countyList : [String] = []
    @Published var flagURL : [String : String] = [:]
    @Published var highestTodayCases : [String : Int] = [:]
    @Published var highestTodayDeadths : [String : Int] = [:]
    @Published var highestTodayRecovered : [String : Int] = [:]
    @Published var allTodayCases : Int = 0
    @Published var population : [String : Int] = [:]
    
    @Published var highestTodayCasesValue : Int = 0
    @Published var highestTodayDeadthsValue : Int = 0
    @Published var highestTodayRecoveredValue : Int = 0
    
    @Published var highestTodayCasesCountry : String = ""
    @Published var highestTodayDeadthsCountry : String = ""
    @Published var highestTodayRecoveredCountry : String = ""
    
    
    static let shared = Getdata()
    
    func getDetailData(putcountry:String){
        
        
        var url2 = ""
        
        url2 = "https://disease.sh/v3/covid-19/countries/\(putcountry)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url2)!){ (data, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                
                
                
                let json = try! JSONDecoder().decode(DetailData.self, from: data!)
                let cases = json.todayCases
                let deaths = json.todayDeaths
                let recovered = json.todayRecovered
                let flagURL = json.countryInfo.flag
                print(flagURL)
                
                
                if cases == 0 || deaths == 0 || recovered == 0 {
                    
                    print("wyjątek z zerami ")
                    return
                }else{
                    self.todayCases[putcountry] = cases
                    self.todayDeadths[putcountry] = deaths
                    self.todayRecovered[putcountry] = recovered
                    self.population[putcountry] = json.population
                    var highestTodayCases = self.todayCases.max { a, b in a.value < b.value }
                    self.highestTodayCases.removeAll()
                    self.highestTodayCases[highestTodayCases?.key as! String] = highestTodayCases?.value
                    self.highestTodayCasesValue = highestTodayCases?.value as! Int
                    self.highestTodayCasesCountry = highestTodayCases?.key as! String
                    print("max poziom przypadkow \(self.highestTodayCases)")
                   
                    var highestTodayDeadths = self.todayDeadths.max { a, b in a.value < b.value }
                    self.highestTodayDeadths.removeAll()
                    self.highestTodayDeadths[highestTodayDeadths?.key as! String] = highestTodayDeadths?.value
                    self.highestTodayDeadthsValue = highestTodayDeadths?.value as! Int
                    self.highestTodayDeadthsCountry = highestTodayDeadths?.key as! String
                    print("max poziom smierci \(self.highestTodayDeadths)")
                    
                    var highestTodayRecovered = self.todayRecovered.max { a, b in a.value < b.value }
                    self.highestTodayRecovered.removeAll()
                    self.highestTodayRecovered[highestTodayRecovered?.key as! String] = highestTodayRecovered?.value
                    self.highestTodayRecoveredValue = highestTodayRecovered?.value as! Int
                    self.highestTodayRecoveredCountry = highestTodayRecovered?.key as! String
                    print("max poziom ozdrowien \(self.highestTodayRecovered)")
                    
                    self.flagURL[putcountry] = flagURL
                   // print(self.todayCases)
                   // print(self.todayDeadths)
                   // print(self.todayRecovered)
                }
                
                self.sortCountryData()
            }
            
        }
        .resume()
    }
    
    func getAllAvailable(){
        
        var url3 = ""
        
        url3 = "https://disease.sh/v3/covid-19/countries/"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url3)!){ (data3, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                
                return
            }
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                
                
                
                let json = try! JSONDecoder().decode([covidCountry].self, from: data3!)
                let countrylist = json
               
              
                
            }
            
        }
        .resume()
        
    }
    
    
    func getAllCase(){
        
        var url3 = ""
        
        url3 = "https://disease.sh/v3/covid-19/all"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url3)!){ (data3, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                
                return
            }
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                
                
                
                let json = try! JSONDecoder().decode(allCasesStruc.self, from: data3!)
                self.allTodayCases = json.todayCases
               
              
                
            }
            
        }
        .resume()
        
    }
    
    
    
    
    
    func allCountryTodayData(){
        
        for i in countryList{
            
            getDetailData(putcountry: i)
        }
    }
    
    func sortCountryData(){
       
        
        self.todayCases.sorted(by:{
            $0.value > $1.value
        })
       
        
    }
}
