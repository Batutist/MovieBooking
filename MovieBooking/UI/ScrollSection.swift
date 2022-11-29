//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 11/29/22.
//

import SwiftUI

struct ScrollSection: View {
    @State var scrollSectionTitle = "Now Playing"
    @State var posters = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrollSectionTitle)
                .font(.headline)
            //                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(posters, id: \.self) { poster in
                        Image(poster)
                            .resizable()
                            .frame(width: 100, height: 130)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(20)
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}
