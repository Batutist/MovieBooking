//
//  Tickets.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 10/7/22.
//

import SwiftUI

struct Tickets: View {
    @State var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
    @State var isDraging = false
    
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                //                let offset: CGFloat = 0 + (ticket)
                InfiniteStackView(tickets: $tickets, ticket: ticket, isDraging: isDraging)
                    .offset(x: 1)
                
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        Tickets()
    }
}

struct InfiniteStackView: View {
    @Binding var tickets: [TicketModel]
    var ticket: TicketModel
    @State var height: CGFloat = 0
    @GestureState var isDraging: Bool
    @State var offset: CGFloat = .zero
    
    var body: some View {
        VStack {
            Ticket(title: ticket.title, subTitle: ticket.subtitle, topImage: ticket.top, bottomImage: ticket.bottom, spacerHeight: $height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(Double(CGFloat(tickets.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .offset(x: offset)
        .rotationEffect(getIndex() == 1 ? .degrees(-6) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1 : 0.85)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x: getIndex() == 2 ? 40 : 0)
        .gesture(
            DragGesture()
                .updating($isDraging, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    var translation = value.translation.width
                    translation = tickets.first?.id == ticket.id ? translation : 0
                    translation = isDraging ? translation : 0
                    withAnimation(.easeInOut(duration: 0.4)) {
                        offset = translation
                        height = -offset / 5
                    }
                })
                .onEnded({ value in
                    let width = UIScreen.main.bounds.width
                    let swipedRight = offset > (width / 2)
                    let swipedLeft = -offset > (width / 2)
                    
                    withAnimation(.easeInOut(duration: 0.5)) {
                        
                        if swipedLeft {
                            offset = -width
                            removeTicket()
                        } else {
                            if swipedRight {
                                offset = width
                                removeAndAddTicket()
                            } else {
                                offset = .zero
                                height = .zero
                            }
                        }
                    }
                })
        )
    }
    
    func getIndex() -> CGFloat {
        let index = tickets.firstIndex { ticket in
            
            return self.ticket.id == ticket.id
            
        } ?? 0
        
        return CGFloat(index)
    }
    
    func getRotation(angle: Double) -> Double {
        let width = UIScreen.main.bounds.width
        let progress = offset / width
        
        return Double(progress * angle)
    }
    
    func removeAndAddTicket() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            var updatedTicket = ticket
            updatedTicket.id = UUID().uuidString
            tickets.append(updatedTicket)
            
            withAnimation(.spring()) {
                _ = tickets.removeFirst()
            }
        }
    }
    func removeTicket() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring()) {
                _ = tickets.removeFirst()
            }
        }
    }
}


