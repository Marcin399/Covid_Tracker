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
                                        image
                                            .resizable()
                                            .frame(width: 200, height: 125)
                                            .cornerRadius(20)
                                            .shadow(color: (Color("myGray").opacity(1)), radius: 10, x: 0, y: 0)
                                            .matchedGeometryEffect(id: "Flag\(CasesData.flagURL[tabData.currentCountry])", in: animation)
                                    } else if phase.error != nil {
                                        Color.red
                                        
                                            .frame(width: 40, height: 25)
                                    } else {
                                        Color.blue
                                        
                                            .frame(width: 40, height: 25)
                                    }
                                }
                            }
                            
                    Text("\(tabData.countryCases)") 
                    .font(.title2.bold())
                    .fixedSize(horizontal: true, vertical: true)
                    .matchedGeometryEffect(id: "Cases\(tabData.countryCases)", in: animation)
                        
                    Text("\(tabData.counrtyDeadths)")
                                .font(.title2.bold())
                            
                    Text("\(tabData.counrtyRecovered)")
                                        .font(.title2.bold())
                                
                              
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("\(tabData.currentCard)") //panstwo u góry 
                            .fixedSize(horizontal: true, vertical: true)
                            .font(.title2.bold())
                            .padding(.top, 40)
                            .padding(.all, 5)
                            .matchedGeometryEffect(id: "Cases\(tabData.currentCard)", in: animation)
                        
                       
                    }
                    .padding()
                    .padding(.top)
                }
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


