//
//  HalfPopover.swift
//  SlidingOverlayTest
//
//  Created by Matthias Zarzecki on 17.04.21.
//

import SwiftUI

struct HalfPopover: View {
  var width: CGFloat
  var height: CGFloat
  @Binding var showDetails: Bool
  
  var body: some View {
    VStack {
      // The upper "Empty" part of the view
      Spacer()
      
      // The actual popover
      ZStack {
        Rectangle()
          .foregroundColor(.blue)
          .cornerRadius(24)
          .frame(width: width, height: height * 0.4, alignment: .center)
        
        VStack {
          Text("Overlay!")
            .transition(.move(edge: .bottom))
          
          Button(action: {
            withAnimation {
              showDetails.toggle()
            }
          }) {
            Text("Close")
              .foregroundColor(.white)
          }
        }
      }
      .shadow(radius: 6)
    }
    .transition(.move(edge: .bottom))
  }
}

struct HalfPopover_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      HalfPopover(
        width: geometry.size.width,
        height: geometry.size.height,
        showDetails: .constant(false)
      )
      .background(Color.green)
    }
  }
}
