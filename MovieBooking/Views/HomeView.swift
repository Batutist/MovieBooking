//
//  HomeView.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/10/22.
//

import SwiftUI

struct HomeView: View {
    @State var animateCirle = false
    
    var body: some View {
        ZStack {
            backgroundAnimation
            
            VStack(spacing: 0.0) {
                Text("Chose a movie")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                
                CustomSearchBar()
                    .padding(.vertical, 30)
                    .padding(.horizontal, 20)
                
                // Vertical scroll view for the page content
                ScrollView(.vertical, showsIndicators: true) {
                    // Horizontal scroll views for different categories of movies
                    ScrollView(.horizontal, showsIndicators: true) {
                        VStack {
                            ScrollSection(scrollSectionTitle: "Now Playing", posters: posters1)
                                .padding(.horizontal, 10)
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
    
    private var backgroundAnimation: some View {
        
        Group {
            CircleBackground(color: Color("greenCircle"))
                .offset(x: animateCirle ? -50 : -130, y: animateCirle ? -30 : -100)
                .blur(radius: animateCirle ? 30 : 100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animateCirle.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .offset(x: animateCirle ? 100 : 130, y: animateCirle ? 150 : 100)
                .blur(radius: animateCirle ? 30 : 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
