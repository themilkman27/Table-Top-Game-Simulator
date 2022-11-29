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
                Text("Tabletop Game Simulator")
                    .font(Font.custom("Marker Felt", size: 36))

                NavigationLink("Blackjack", destination: Blackjack())
                .font(Font.custom("Marker Felt", size: 24))
                .padding()
                Spacer()
            }
            
         
        }
        .navigationTitle("Blackjack")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
