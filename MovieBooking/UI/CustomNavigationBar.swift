//
//  CustomNavigationBar.swift
//  MovieBooking
//
//  Created by Sergey Kovalev on 12/1/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    @State var rightButtonAction: () -> Void
    @State var leftButtonIcon: String = "arrow.left"
    @State var rightButtonIcon: String = "ellipsis"
    //    @State var leftButtonAction: () -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            // Left button
            CircleButton(action: {
                dismiss()
            }, image: leftButtonIcon)
            
            Spacer()
            
            // Right button
            CircleButton(action: {
                rightButtonAction()
                
            }, image: rightButtonIcon)
        }
        .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(rightButtonAction: {})
    }
}
