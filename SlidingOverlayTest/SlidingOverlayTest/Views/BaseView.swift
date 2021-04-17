//
//  ContentView.swift
//  SlidingOverlayTest
//
//  Created by Matthias Zarzecki on 07.11.20.
//

import SwiftUI

struct BaseView: View {
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BaseView()
  }
}
