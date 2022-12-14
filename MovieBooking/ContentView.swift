//
//  ContentView.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    Text("Location")
                        .tag(Tab.location)
                    
                    TicketView()
                        .tag(Tab.ticket)
                    
                    Text("Category")
                        .tag(Tab.category)
                    
                    Text("Profile")
                        .tag(Tab.profile)
                }
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
