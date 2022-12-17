//
//  playGame.swift
//  Table Top Game Simulator
//
//  Created by Owen Johnson on 11/30/22.
//

import SwiftUI

struct playGame: View {
    @State public var point = 0
    @State private var randomValueOne = 0
    @State private var randomValueTwo = 0
    @State private var rotationOne = 0.0
    @State private var rotationTwo = 0.0
    @State private var duration = 0.5
    @State private var roleOneOver = false
    @State private var roleTwoOver = false
    @State private var gameOver = false
    @State private var gameLoss = false
    @State private var gameWon = false
    @State private var loss = "Darn you lost! Try again?"
    @State private var winMessage = "Congrats! You win!"
    
    var body: some View {
        ZStack {
            //background image
            Image("Craps0")
                .resizable()
                .frame(width: 150, height: 150)
            VStack {
             
                Text("Craps")
                HStack {
                    //dice made rollable and shown on screen
                    Image("pips \(randomValueOne)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotationOne))
                        .rotation3DEffect(.degrees(rotationOne), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                        .onTapGesture {
                            chooseRandom(times: Int.random(in: 1..<5))
                            withAnimation(.linear(duration: duration)) {
                                rotationOne += 360
                            }
                           
                        }
                    Image("pips \(randomValueTwo)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotationTwo))
                        .rotation3DEffect(.degrees(rotationTwo), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                        .onTapGesture {
                            chooseRandom2(times: Int.random(in: 1..<5))
                            withAnimation(.linear(duration: duration)) {
                                rotationTwo += 360
                            }
                           
                            
                        }
                    
                }
        // Showing point on screen
                let point = randomValueOne + randomValueTwo
                Text("Point: \(point)")
                Text("Roll One Over " ) + Text(roleOneOver ? "yes" : "no")
                Text("Roll Two Over " ) + Text(roleTwoOver ? "yes" : "no")
                Button ("Test Point") {
                    calculatePoint()
                }
            }
        }
        
        
        // deciding a winner
        
        .onChange(of: randomValueOne + randomValueTwo, perform: { newValue in
            calculatePoint()
        })
        
        //alerts on win and loss
        .alert(isPresented: $gameOver) {
            Alert(title: Text(gameWon ? winMessage : loss), dismissButton: .destructive(Text("play again"),
                                                                       action: {
                withAnimation {
                    point = 0
                    gameOver = false
                    gameWon = false
                    gameLoss = false
                    roleOneOver = false
                    roleTwoOver = false
                    randomValueOne = 0
                    randomValueTwo = 0
                }
            }))
        }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            roleOneOver = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValueOne = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
        else {
            roleOneOver = true
            
        }
    }
    //calculate win and loss
    func calculatePoint() {
        if !roleOneOver || !roleTwoOver {
            return
        }
        if randomValueOne + randomValueTwo == 7 {
            gameWon = true
        }
        if randomValueOne + randomValueTwo == 11 {
            gameWon = true
        }
        if randomValueOne + randomValueTwo == 2 {
            gameLoss = true
        }
        if randomValueOne + randomValueTwo == 3 {
            gameLoss = true
        }
        if randomValueOne + randomValueTwo == 12 {
            gameLoss = true
        }
        gameOver = gameLoss || gameWon
       
    }
    // for dice
    func chooseRandom2(times:Int) {
    
        if times > 0 {
            roleTwoOver = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValueTwo = Int.random(in: 1...6)
                chooseRandom2(times: times - 1)
            }
        }
        else {
            roleTwoOver = true
        }
    }
    struct playGame_Previews: PreviewProvider {
        static var previews: some View {
            playGame()
        }
    }
}
