//
//  Ticket.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/7/22.
//

import SwiftUI

struct Ticket: View {
    @State var title = "Thor"
    @State var subTitle = "Love and Thunder"
    @State var topImage = "thor-top"
    @State var bottomImage = "thor-bottom"
    @Binding var spacerHeight: CGFloat
    
    var colors = [Color.cyan, Color.cyan.opacity(0), Color.cyan.opacity(0)]
    
    
    var body: some View {
        VStack(spacing: 0) {
            ticketTopPart
            
            Spacer(minLength: spacerHeight)
            
            ticketBottomPart
        }
        .frame(height: 460)
        .font(.footnote)
        .shadow(radius: 10)
    }
    
    
    private var ticketTopPart: some View {
        VStack(spacing: 4) {
            Text(title)
                .bold()
            
            Text(subTitle)
        }
        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
        .frame(width: 250, height: 325, alignment: .top)
        .foregroundColor(.white)
        .background(
            Image(topImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask {
            Image(topImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
        }
        .cornerRadius(40, corners: [.topLeft, .topRight])
    }
    
    private var ticketBottomPart: some View {
        VStack(spacing: 10) {
            Line()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                .frame(width: 200, height: 1 )
                .opacity(0.6)
            
            HStack(spacing: 20) {
                HStack(spacing: 4) {
                    Text("Date:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    
                    Text("April 23")
                        .foregroundColor(.black)
                }
                
                HStack(spacing: 4) {
                    Text("Time:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    
                    Text("6 p.m.")
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 20) {
                HStack(spacing: 4) {
                    Text("Row:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    
                    Text("3")
                        .foregroundColor(.black)
                }
                
                HStack(spacing: 4) {
                    Text("Seats:")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    
                    Text("6, 7")
                        .foregroundColor(.black)
                }
            }
            
            Image("code")
        }
        .frame(width: 250, height: 135, alignment: .top)
        .background(.ultraThinMaterial)
        .background(
            Image(bottomImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            Image(bottomImage)
                .resizable()
                .aspectRatio(contentMode: .fill))
        
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
        Ticket(spacerHeight: .constant(0))
    }
}
