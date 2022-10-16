//
//  TicketView.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/7/22.
//

import SwiftUI

struct TicketView: View {
    @State var animateCirle = false
    
    var body: some View {
        ZStack {
            
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
            
            VStack (spacing: 30) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                
                Text("Once you buy a movie ticket simply scan a barcode to get an access to your movie")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Tickets()
                .padding(.top, 30)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom))
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
