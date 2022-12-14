//
//  SeatsView.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 12/1/22.
//

import SwiftUI

struct SeatsView: View {
    private var title = "Chose Seat"
    private var rightButtonIcon = "calendar"
    
    @State var animate = false
    @State var showButton = false
    
    // Unused two states for now
    @State private var isSeatPressed: Bool = false
    @State var seatsRow = [
        SeatView(booked: true, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: true, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false),
        SeatView(booked: false, chosen: false)
    ]
    
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            CustomNavigationBar(rightButtonAction: {}, rightButtonIcon: rightButtonIcon, customBarTitle: title)
                
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: Color.pink, radius: 20)

            Image("seats")
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showButton.toggle()
                    }
                }
            
            HStackLayout(spacing: 20) {
                StatusUI()
                StatusUI(color: Color("majenta"), text: "Reserved")
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            .padding(.top, 60)
            
            ZStack(alignment: .topLeading) {
                
                circlesAnimation
                
                VStack(alignment: .leading, spacing: 30) {
                    HStack(spacing: 10.0) {
                        Image(systemName: "calendar")
                        
                        Text("December 10, 2022")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("6 p.m.")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                        
                        Text("VIP Section")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("Seat(s) 9, 10")
                    }
                    
                    HStackLayout(spacing: 10) {
                        Image(systemName: "cart.fill")
                        Text("Total: $30")
                    }
                }
                .padding(42)
                .font(.subheadline)
                
                HStack {
                    Spacer()
                    
                    RoundButton()
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 50)
//            .offset(y: showButton ? 0 : 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
//        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
        
    }
    private var circlesAnimation: some View {
        Group {
            Circle()
                .frame(width: 200, height: 230)
                .foregroundColor(Color("purple"))
                .blur(radius: animate ? 70 : 100)
                .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }
            
            Circle()
                .frame(width: 200, height: 230)
                .foregroundColor(Color("lightBlue"))
                .blur(radius: animate ? 50 : 100)
                .offset(x: animate ? 50 : 70, y: animate ? -20 : 20)
            
            Circle()
                .frame(width: 200, height: 230)
                .foregroundColor(Color("pink"))
                .blur(radius: animate ? 70 : 100)
                .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
        }
    }
    
    // unfinished option of usable seats buttons
    // Change the color: Available - grey, Booked - red, Clicked - mint
    private var usableSeats: some View {
        HStack {
            ForEach($seatsRow) { $seat in
                
                Button {
                    withAnimation(.easeIn) {
                        seat.chosen.toggle()
                        let _ = print("seat: \(seat.id) \(seat.chosen)")
                    }
                } label: {
                    seat.icon
                        .renderingMode(.template)
                        .foregroundColor(seat.chosen ? .mint : seat.booked ? .red : .gray)
                }
                .disabled(seat.booked ? true : false)
            }
        }
        .padding(EdgeInsets(top: 55, leading: 20, bottom: 20, trailing: 20))
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}

struct SeatView: Identifiable {
    let id = UUID()
    let icon: Image = Image("seat")
    var booked: Bool
    var chosen: Bool
}

