//
//  FallowView.swift
//  Covid_Tracker
//
//  Created by Marcin on 31/01/2022.
//

import SwiftUI

struct FallowView: View {
    @EnvironmentObject var tabData: TabViewModel
    @EnvironmentObject var CasesData: Getdata
    var animation: Namespace.ID
    
    var body: some View {
      
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
               
                Text("Follow Country")
                // .border(Color.blue)
                    .font(.title2.bold())
                    .offset(x: 0, y: 20)
                VStack(){
                    
                    if CasesData.todayCases.count > 1{
                        ForEach(CasesData.todayCases2.sorted(by: { a, b in a.value > b.value }), id: \.value) { key, value in
                            
                            Button {
                        
                                    tabData.currentCard = key
                                    tabData.countryCases = value
                                    tabData.counrtyDeadths = CasesData.todayDeadths[key] as! Int
                                    tabData.counrtyRecovered = CasesData.todayRecovered[key] as! Int
                                    tabData.showDetail = true
                                    tabData.currentCountry = key
                                
                            } label: {
                                ZStack{
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                                        .cornerRadius(13)
                                        .foregroundColor(Color.clear)
                                     
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                                        .cornerRadius(13)
                                        .foregroundColor(Color.white)
                                    
                                    
                                    if CasesData.flagURL[key] != nil{ // pobieranie flag
                                        let url1 = CasesData.flagURL[key]!
                                        AsyncImage(url: URL(string: url1)) { phase in
                                            if let image = phase.image {
                                                image
                                                    .resizable()
                                                    .frame(width: 40, height: 25)
                                                    .cornerRadius(4)
                                                    .shadow(color: (Color("myGray").opacity(1)), radius: 10, x: 0, y: 0)
                                                    .offset(x: 120, y: 0)
                                                    
                                                
                                            } else if phase.error != nil {
                                                Color.red
                                                
                                                    .frame(width: 40, height: 25)
                                            } else {
                                                Color.blue
                                                
                                                    .frame(width: 40, height: 25)
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width - 50 , height: 0.4, alignment: .bottom)
                                        .foregroundColor(Color("myGray"))
                                        .offset(x: 0, y: UIScreen.main.bounds.height/22)
                                    
                                    HStack{
                                        
                                        
                                        VStack{
                                            
                                            Text("\(value)")
                                                .fixedSize(horizontal: true, vertical: true)
                                            //.padding(10)
                                           
                                                .font(.title2.bold())
                                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                            
                                            Text("\(key)")
                                                .foregroundColor(Color.gray)
                                                .fixedSize(horizontal: true, vertical: true)
                                            // .padding(10)
                                     
                                                .font(.system(size: 15, weight: .bold))
                                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                            
                                        }
                                        
                                    }
                                }
                                
                            }
                            .buttonStyle(CardButtonStyle())
                            
                        }
                    }else{
                        Text("\(CasesData.todayCases.count)")
                    }
                }
                .padding()
               
            }
    }
}

}
