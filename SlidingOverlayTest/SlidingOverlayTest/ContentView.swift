//
//  ContentView.swift
//  SlidingOverlayTest
//
//  Created by Matthias Zarzecki on 07.11.20.
//

import SwiftUI

struct ContentView: View {
  @State private var showDetails = false
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Button(action: {
          withAnimation {
            self.showDetails.toggle()
          }
        }) {
          Text("Tap to show details")
        }
        
        if showDetails {
          HalfPopover(
            width: geometry.size.width,
            height: geometry.size.height,
            showDetails: $showDetails
          )
        }
      }
    }
  }
  
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
      }
      .transition(.move(edge: .bottom))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
