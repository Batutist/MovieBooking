//
//  CustomSearchBar.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/10/22.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var search = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $search)
            
            Image(systemName: "mic.fill")
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .background(.ultraThinMaterial)
        .font(.headline)
        .foregroundColor(.white.opacity(0.6))
        .cornerRadius(10)
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    } 
}
