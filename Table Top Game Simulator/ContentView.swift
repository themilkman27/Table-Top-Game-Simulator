//
//  ContentView.swift
//  Table Top Game Simulator
//
//  Created by Owen Johnson on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Craps: Simplified")
                    .font(Font.custom("Marker Felt", size: 40))
                    .padding()
                NavigationLink("Rules", destination: Rules())
                    .font(Font.custom("Marker Felt", size: 30))
                    .padding()
                Spacer()
                // create rule page
                NavigationLink("Play Game",destination: playGame())
                    .font(Font.custom("Marker Felt", size: 30))
                    .padding()
                Spacer()
                Spacer()
                Spacer()
                Image("crapsBackground").frame(width: 50, height: 500, alignment: .center)
                
                
            }
        
    }
  }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
