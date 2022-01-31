//
//  DetailView.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import Foundation
import SwiftUI
import Combine

struct DetailView: View {
    @EnvironmentObject var tabData: TabViewModel
    @EnvironmentObject var CasesData: Getdata
   
    
    
    
    var animation: Namespace.ID
    
    // Showing Data with delay...
    @State var showData = false
    
    var body: some View {
        var card : String = self.tabData.currentCard
        
        if  tabData.showDetail == true{
            
            VStack(spacing: 0){
                ZStack{
                    
                    ZStack{
                        Rectangle()
                            .ignoresSafeArea()
                            .cornerRadius(30)
                            .foregroundStyle(Material.ultraThinMaterial)
                            .matchedGeometryEffect(id: "Rectangle\(tabData.countryCases)", in: animation)
                        VStack{
                            
                            if CasesData.flagURL[tabData.currentCountry] != nil{ // pobieranie flag
                                let url1 = CasesData.flagURL[tabData.currentCountry]!
                                AsyncImage(url: URL(string: url1)) { phase in
                                    if let image = phase.image {
                                        ZStack{
                                        image
                                            .resizable()
                                            .frame(width: 200, height: 125)
                                            .cornerRadius(20)
                                            .shadow(color: (Color("myGray").opacity(1)), radius: 10, x: 0, y: 0)
                                            .matchedGeometryEffect(id: "Flag\(CasesData.flagURL[tabData.currentCountry])", in: animation)
                                            .padding(.bottom, 50)
                                         
                                            ZStack{
                                                
                                                Rectangle()
                                                    .frame(width: 150, height: 40)
                                                    .foregroundStyle(.ultraThinMaterial)
                                                    .cornerRadius(20)
                                                Text("\(tabData.currentCard)")
                                                    .foregroundColor(Color.white)
                                                    .font(.title2.bold())
                                      
                                                
                                                
                                            }.offset(x: 0, y: 40)
                                            
                                        }
                                        
                                    } else if phase.error != nil {
                                        Color.clear
                                            .frame(width: 200, height: 125)
                                            .cornerRadius(20)
                                            .shadow(color: (Color("myGray").opacity(1)), radius: 10, x: 0, y: 0)
                                            .matchedGeometryEffect(id: "Flag\(CasesData.flagURL[tabData.currentCountry])", in: animation)
                                            .padding(.bottom, 50)
                                    } else {
                                        Color.clear
                                            .frame(width: 200, height: 125)
                                            .cornerRadius(20)
                                            .shadow(color: (Color("myGray").opacity(1)), radius: 10, x: 0, y: 0)
                                            .matchedGeometryEffect(id: "Flag\(CasesData.flagURL[tabData.currentCountry])", in: animation)
                                            .padding(.bottom, 50)
                                    }
                                }
                            }
                            
                            
                
                            
                            ZStack{ // 1 today csces
                                
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.todayCases[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                      //  .matchedGeometryEffect(id: "Cases\(tabData.countryCases)", in: animation)
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("Today cases")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                  
                                    Image(systemName: "arrow.up.forward.circle.fill")
                                        .font(.system(size: 25))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                        .foregroundColor(Color.red)
                                        .offset(x: 135, y: 0)
                                        .padding(.leading, 30)
                                    
                            
                            }
                            
                            ZStack{ // 2 today deadths
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.todayDeadths[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                      
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("Today deadths")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                
                                Image(systemName: "arrow.up.forward.circle.fill")
                                    .font(.system(size: 25))
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                    .foregroundColor(Color.red)
                                    .offset(x: 135, y: 0)
                                    .padding(.leading, 30)
                                
                            }
                            
                            ZStack{ // 3 today recovered
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.todayRecovered[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                        
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("Today recovered")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                
                                Image(systemName: "arrow.down.forward.circle.fill")
                                    .font(.system(size: 25))
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                    .foregroundColor(Color.green)
                                    .offset(x: 135, y: 0)
                                    .padding(.leading, 30)
                            }
                            
                            ZStack{ // 4 activ cases
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.cases[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                      
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("All cases")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                
                                Image(systemName: "arrow.down.forward.circle.fill")
                                    .font(.system(size: 25))
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                    .foregroundColor(Color.green)
                                    .offset(x: 135, y: 0)
                                    .padding(.leading, 30)
                            }
                            
                            ZStack{ // 5 cases
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.active[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                     
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("Active cases")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                
                                Image(systemName: "arrow.up.forward.circle.fill")
                                    .font(.system(size: 25))
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                    .foregroundColor(Color.red)
                                    .offset(x: 135, y: 0)
                                    .padding(.leading, 30)
                            }
                            
                            ZStack{ // 5 population
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 70)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("\(CasesData.population[tabData.currentCountry]!)")
                                        .foregroundColor(Color.black)
                                        .font(.title2.bold())
                                        .fixedSize(horizontal: true, vertical: true)
                                        
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                                    
                                    Text("Population")
                                        .foregroundColor(Color.gray)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                }
                                
                                Image(systemName: "arrow.down.forward.circle.fill")
                                    .font(.system(size: 25))
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/2)
                                    .foregroundColor(Color.green)
                                    .offset(x: 135, y: 0)
                                    .padding(.leading, 30)
                            }
                            
                            
                        }
                    }
                    
                    // CLose Button...
                    .overlay(
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5)) {
                                tabData.showDetail = false
                            }
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .padding()
                                .background(.white,in: Circle())
                            
                        })
                        
                            .padding(.top, 40)
                            .padding(.all, 20)
                            .opacity(showData ? 1 : 1)
                        ,alignment: .topTrailing
                        
                    )
                    
                    //   .matchedGeometryEffect(id: "Cases\(card)", in: animation)
                    
                 
                }.ignoresSafeArea()
            }
            .background(Color.white)
            
        }
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


