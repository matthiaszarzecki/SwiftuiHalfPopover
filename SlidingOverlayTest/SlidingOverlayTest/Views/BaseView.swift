//
//  ContentView.swift
//  SlidingOverlayTest
//
//  Created by Matthias Zarzecki on 07.11.20.
//

import SwiftUI

struct BaseView: View {
  @State private var showPopover = false
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack {
          Spacer()
          
          Button(
            action: {
              withAnimation {
                self.showPopover.toggle()
              }
            },
            label: {
              Text("Tap to show details")
                .padding()
                .background(Color.blue)
                .cornerRadius(6)
                .foregroundColor(.white)
            }
          )
          
          Spacer()
        }

        if showPopover {
          HalfPopover(
            width: geometry.size.width,
            height: geometry.size.height,
            showDetails: $showPopover
          )
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BaseView()
  }
}
