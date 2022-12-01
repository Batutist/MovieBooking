//
//  BookingView.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 12/1/22.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2"), Color("backgroundColor2")]
    
    @State var mockSelected = false
    
    @State var selectedDate = false
    @State var selectedTime = false
    @State var showAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Image("booking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    // Gradient for the image fade effect
                    VStack {
                        LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                            .frame(height: geometry.size.height / 1.5)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    
                    // Custom back navigation and options buttons
                    VStack(spacing: 0) {
                        
                        CustomNavigationBar(rightButtonAction: {})
                        
                        // Main Content
                        VStack {
                            Spacer()
                            
                            content
                            
                            NavigationLink {
                                Text("Seats View")
                            } label: {
                                LargeButton()
                                    .padding(20)
                                    .offset(y: selectedTime && selectedDate ? 0 : 500)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .background(Color("backgroundColor2"))
                .ignoresSafeArea()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            labels
            
            dateCards
            
            timeButtons
        }
    }
    
    
    // Movie labels
    private var labels: some View {
        VStack(spacing: 30) {
            VStack(spacing: 0) {
                Text("Doctor Strange")
                    .font(.title3.bold())
                
                
                Text("in the Multiverse of Madness")
                    .font(.headline).opacity(0.9)
            }
            Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of... read more")
                .font(.subheadline)
                .padding(.horizontal, 30)
            
            Text("Select date and time")
                .font(.headline)
        }
        .foregroundColor(.white)
    }
    
    // Date Cards
    private var dateCards: some View {
        HStack(alignment: .top, spacing: 20) {
            DateButton(weekDay: "Thu", numDay: "1", isSelected: $mockSelected) {}
                .padding(.top, 90)
            
            DateButton(weekDay: "Fri", numDay: "2", isSelected: $mockSelected) {}
                .padding(.top, 70)
            
            DateButton(weekDay: "Sat", numDay: "3", width: 70, height: 100, isSelected: $selectedDate) {
                
                withAnimation(.spring()) {
                    selectedDate.toggle()
                }
            }
            .padding(.top, 30)
            
            DateButton(weekDay: "Sun", numDay: "4", isSelected: $mockSelected) {}
                .padding(.top, 70)
            
            DateButton(weekDay: "Mon", numDay: "5", isSelected: $mockSelected) {}
                .padding(.top, 90)
        }
    }
    
    private var timeButtons: some View {
        HStack(alignment: .top, spacing: 20) {
            TimeButton(hour: "16:00", isSelected: $mockSelected) {}
                .padding(.top, 20)
            
            TimeButton(hour: "18:00", isSelected: $mockSelected) {}
            
            TimeButton(hour: "20:00", width: 70, isSelected: $selectedTime) {
                withAnimation(.spring()) {
                    selectedTime.toggle()
                }
            }
            .padding(.top, -20)
            
            TimeButton(hour: "22:00", isSelected: $mockSelected) {}
            
            TimeButton(hour: "00:00", isSelected: $mockSelected) {}
                .padding(.top, 20)
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
