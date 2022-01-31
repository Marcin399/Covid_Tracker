//
//  CustomTabBar.swift
//  Covid_Tracker
//
//  Created by Marcin on 13/01/2022.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @StateObject var tabData = TabViewModel()
    
    // Hiding Tab View...
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        
        TabView(selection: $tabData.currentTab2) {
            
            Home(animation: animation)
                .environmentObject(tabData)
                .tag("Home")
            
            FallowView(animation: animation)
                .environmentObject(tabData)
                .tag("Follow")
            
        }
        .overlay(
        
            HStack{
                
                TabBarButton(title: "Home", image: "house", animation: animation)
                
                TabBarButton(title: "Follow", image: "heart", animation: animation)
                
               
            }
            .environmentObject(tabData)
                .padding(.vertical,10)
                .padding(.horizontal)
                
                .background(.thinMaterial,in: Capsule())
                .padding(.horizontal,20)
                .padding(.bottom,8)
            // Shadow...
                .shadow(color: .black.opacity(0.09), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.09), radius: 5, x: -5, y: 0)
            // Hiding Tab Bar...
                .offset(y: tabData.showDetail ? 250 : 15)
            // always light tab bar ...
               // .colorScheme(.light)
                
            
            ,alignment: .bottom
        )
        
        // Detail View...
        .overlay(
        
            DetailView(animation: animation)
                .environmentObject(tabData)
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

// TabBarButton...
struct TabBarButton: View{
    
    var title: String
    var image: String
    // For Slide Tab Indicator Aniamtion...
    var animation: Namespace.ID
    @EnvironmentObject var tabData: TabViewModel
    
    var body: some View{
        
        Button {
            
            withAnimation{
                tabData.currentTab2 = title
            }
            
        } label: {
            
            VStack{
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(height: 13)
                
                Text(title)
                    .font(.caption.bold())
            }
            //.foregroundColor(Color.black)
            .foregroundColor(tabData.currentTab2 == title ? Color("Tab") : .primary.opacity(0.5))
            .frame(maxWidth: .infinity)
           
        }

    }
}

// Custom Tab Lighting Indicator...
// Shape..

struct TabIndicator: Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
        }
    }
}
