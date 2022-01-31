//
//  Home.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var tabData: TabViewModel
    
    @EnvironmentObject var CasesData: Getdata
    
    // @State var url1 = CasesData.flagURL["Poland"]
    
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack{
            VStack{
                
                
                
                Text("All new cases today")
                    .font(.title2.bold())
                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                    .padding(.top,30)
                    
                    
                ZStack{
                Text("\(CasesData.allTodayCases)")
                    .font(.system(size: 30,  weight: .black ))
                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,  alignment: .leading)
                    .padding(.top, -5 )
                
                    Image(systemName: "arrow.up.forward.circle.fill")
                        .font(.system(size: 25))
                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/6.5,alignment: .center)
                        .foregroundColor(Color.red)
                        .offset(x: -5, y: -2)
                
                }.padding(.bottom)
            }
            if CasesData.todayCases.count > 10{
                HStack{
                    Spacer()
                    ZStack{
                        Button {
                            withAnimation(.spring()){
                            var country = Array(CasesData.highestTodayCases.keys)[0] as! String
                            tabData.currentCard = Array(CasesData.highestTodayCases.keys)[0] as! String
                            tabData.showDetail = true
                            tabData.countryCases =  Array(CasesData.highestTodayCases.values)[0]
                            tabData.counrtyDeadths = CasesData.todayDeadths[country] as! Int
                            tabData.counrtyRecovered = CasesData.todayRecovered[country] as! Int
                            tabData.currentCountry = Array(CasesData.highestTodayCases.keys)[0] as! String
                            }
                            
                        } label: {
                            ZStack{
                                
                                Rectangle()
                                    .cornerRadius(15)
                                    .padding(1)
                                    .frame(width: UIScreen.main.bounds.width/3 - 10, height: 115)
                                    .foregroundColor(Color("myBlue"))
                                    .shadow(color: (Color("myBlue").opacity(1)), radius: 10, x: 0, y: 0)
                                    .ignoresSafeArea()
                                
                                
                                ForEach (CasesData.highestTodayDeadths.sorted(by: >), id: \.value) { key, value in //wypisywanie największej ilosci przypadkow
                                    VStack{
                                        
                                        
                                        Text("cases")
                                            .padding(1)
                                        Text("\(CasesData.highestTodayCasesValue)") //wypisywanie wartosci dla klucza
                                            .font(.system(size: 20, weight: .bold))
                                        Text("\(CasesData.highestTodayCasesCountry)") // wypisanie klucza czyli kraju
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                    ZStack{
                        Button {
                            withAnimation(.spring()){
                            var country = Array(CasesData.highestTodayRecovered.keys)[0] as! String
                            tabData.currentCard = Array(CasesData.highestTodayRecovered.keys)[0] as! String
                            tabData.showDetail = true
                            tabData.countryCases =  Array(CasesData.highestTodayCases.values)[0]
                            tabData.counrtyDeadths = CasesData.todayDeadths[country] as! Int
                            tabData.counrtyRecovered = CasesData.todayRecovered[country] as! Int
                            tabData.currentCountry = Array(CasesData.highestTodayRecovered.keys)[0] as! String
                            }
                            
                        } label: {
                            ZStack{
                                
                                Rectangle()
                                    .cornerRadius(15)
                                    .padding(1)
                                    .frame(width: UIScreen.main.bounds.width/3 - 10, height: 115)
                                    .foregroundColor(Color("myGreen"))
                                    .shadow(color: (Color("myGreen").opacity(1)), radius: 2, x: 0, y: 0)
                                    .ignoresSafeArea()
                                    
                                
                                ForEach (CasesData.highestTodayRecovered.sorted(by: >), id: \.value) { key, value in //wypisywanie największej ilosci przypadkow
                                    VStack{
                                        Text("recover")
                                            .padding(1)
                                            .foregroundColor(Color.green)
                                        Text("\(CasesData.highestTodayRecoveredValue)")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color.green)
                                        Text("\(CasesData.highestTodayRecoveredCountry)")
                                            .foregroundColor(Color.green)
                                        
                                    }
                                }
                            }
                        }
                    }
                    ZStack{
                        
                        Button {
                            withAnimation(.spring()){
                            var country = Array(CasesData.highestTodayDeadths.keys)[0] as! String
                            tabData.currentCard = Array(CasesData.highestTodayDeadths.keys)[0] as! String
                            tabData.showDetail = true
                            tabData.countryCases =  Array(CasesData.highestTodayCases.values)[0]
                            tabData.counrtyDeadths = CasesData.todayDeadths[country] as! Int
                            tabData.counrtyRecovered = CasesData.todayRecovered[country] as! Int
                                tabData.currentCountry = Array(CasesData.highestTodayDeadths.keys)[0] as! String
                            }
                            
                        } label: {
                            ZStack{
                                
                                Rectangle()
                                    .cornerRadius(15)
                                    .padding(1)
                                    .frame(width: UIScreen.main.bounds.width/3 - 10, height: 115)
                                    .foregroundColor(Color("myRed"))
                                    .shadow(color: (Color("myRed").opacity(1)), radius: 2, x: 0, y: 0)
                                    .ignoresSafeArea()
                                   
                                
                                
                                ForEach (CasesData.highestTodayDeadths.sorted(by: >), id: \.value) { key, value in //wypisywanie największej ilosci przypadkow
                                    VStack{
                                        Text("deadths")
                                            .padding(1)
                                            .foregroundColor(Color.red.opacity(0.7))
                                        Text("\(CasesData.highestTodayDeadths[key]! )") //wypisywanie wartosci dla klucza
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color.red.opacity(0.7))
                                        Text("\(key)") // wypisanie klucza czyli kraju
                                            .foregroundColor(Color.red.opacity(0.7))
                                    }
                                }
                            }
                        }
                        
                    }//end
                    
                    Spacer()
                    
                }.padding(.bottom)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    CasesData.allCountryTodayData()
                }
                Text("All countries")
                // .border(Color.blue)
                    .font(.title2.bold())
                    .offset(x: 0, y: 20)
                VStack(){
                    
                    
                
                    if CasesData.todayCases.count > 0{
                        ForEach(CasesData.todayCases.sorted(by: { a, b in a.value > b.value }), id: \.value) { key, value in
                            
                            
                            
                            Button {
                                
                                withAnimation(.spring()){
                                    tabData.currentCard = key
                                    tabData.countryCases = value
                                    tabData.counrtyDeadths = CasesData.todayDeadths[key] as! Int
                                    tabData.counrtyRecovered = CasesData.todayRecovered[key] as! Int
                                    tabData.showDetail = true
                                    tabData.currentCountry = key
                                }
                                
                            } label: {
                                ZStack{
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                                        .cornerRadius(13)
                                        .foregroundColor(Color.clear)
                                        .matchedGeometryEffect(id: "Rectangle\(value)", in: animation)
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
                                                    .matchedGeometryEffect(id: "Flag\(CasesData.flagURL[key])", in: animation)
                                                
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
                                                .matchedGeometryEffect(id: "Cases\(value)", in: animation)
                                                .font(.title2.bold())
                                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                            
                                            Text("\(key)")
                                                .foregroundColor(Color.gray)
                                                .fixedSize(horizontal: true, vertical: true)
                                            // .padding(10)
                                                .matchedGeometryEffect(id: "Cases\(key)", in: animation)
                                                .font(.system(size: 15, weight: .bold))
                                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width/5, height: 20, alignment: .leading)
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        HStack( spacing: 0){
                                            
                                            
                                            
                                            
                                            
                                            Button {
                                                if  tabData.liked[key] == false || tabData.liked[key] == nil {
                                                    tabData.liked[key] = true
                                                }else{
                                                    tabData.liked[key] = false
                                                }
                                                
                                            }label: {
                                                if tabData.liked[key] == true{
                                                    Image(systemName: "heart.fill")
                                                        .font(.system(size: 20,  weight: .bold ))
                                                        .foregroundColor(Color.gray)
                                                }else{
                                                    Image(systemName: "heart")
                                                        .font(.system(size: 20,  weight: .bold ))
                                                        .foregroundColor(Color.gray)
                                                }
                                            }
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
                // Bottom Padding to show the content available on bottom....
                // Safe area edge is not working on TabView...
                // it's only working with scrollview....
                //   .padding(.bottom,80)
                
            }.coordinateSpace(name: "pullToRefresh")
                .cornerRadius(50)
                .ignoresSafeArea()
            //.border(Color.red)
                .onAppear{
                    CasesData.allCountryTodayData()
                    CasesData.getAllCase()
                    // CasesData.getAllAvailable()
                    
                    
                }
        }
        
    }
    @ViewBuilder
    func cardBG(card: Card)-> some View{
        
        ZStack{
            
            if tabData.showDetail == true{
                LinearGradient(
                    colors: [
                        
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        Color("\(card.cardColor)3"),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .cornerRadius(15)
                    .opacity(0)
            }
            else{
                LinearGradient(
                    colors: [
                        
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        Color("\(card.cardColor)3"),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: card.id + "BG", in: animation)
            }
        }
    }
    
    @ViewBuilder
    func CardView(card: Card)->some View{
        VStack(spacing: 15){
            
            if tabData.showDetail == true{
                
                //Rectangle()
                //    .frame(height: 20)
                
                Text(card.title)
                    .font(.title2.bold())
                    .opacity(0)
            }
            else{
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(Color.clear)
                
                
            }
        }
    }
    struct PullToRefresh: View {
        
        var coordinateSpaceName: String
        var onRefresh: ()->Void
        
        @State var needRefresh: Bool = false
        
        var body: some View {
            GeometryReader { geo in
                if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                    Spacer()
                        .onAppear {
                            needRefresh = true
                        }
                } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                    Spacer()
                        .onAppear {
                            if needRefresh {
                                needRefresh = false
                                onRefresh()
                            }
                        }
                }
                HStack {
                    Spacer()
                    if needRefresh {
                        ProgressView()
                    } else {
                        Text("...")
                    }
                    Spacer()
                }
            }.padding(.top, -50)
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Custom Hoverable Card Button...
struct CardButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
        // decreasing scale when clicked...
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeIn, value: configuration.isPressed)
    }
}
