//
//  Rules.swift
//  Table Top Game Simulator
//
//  Created by Owen Johnson on 11/29/22.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        VStack {
            Text("Playing craps in Vegas is an exciting, fast-paced, action-packed game utilizing a pair of dice. One player throws the dice at the craps table. ")
                .font(Font.custom("Marker Felt", size: 20))
                .padding(20)
            Text("You win if a 7 or 11 roll, or lose if 2, 3, or 12 roll. If you roll a 4, 5, 6, 8, 9, or 10, simply reroll.")
                .font(Font.custom("Marker Felt", size: 20))

        }
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        Rules()
    }
}
