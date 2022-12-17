//
//  playGame.swift
//  Table Top Game Simulator
//
//  Created by Owen Johnson on 11/30/22.
//

import SwiftUI

struct playGame: View {
    @State public var point = 0
    @State private var randomValue = 0
    @State private var randomValue2 = 0
    @State private var rotation2 = 0.0
    @State private var rotation = 0.0
    @State private var gameOver = false
    @State private var gameLoss = false
    @State private var gameWon = false
    @State private var loss = "Darn you lost! Try again?"
    @State private var winMessage = "Congrats! You win!"
    
    var body: some View {
        ZStack {
            Image("Craps0")
                .resizable()
                .frame(width: 150, height: 150)
            VStack {
             
                Text("Craps")
                HStack {
                    Image("pips \(randomValue)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotation))
                        .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                        .onTapGesture {
                            chooseRandom(times: Int.random(in: 1..<11))
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation += 360
                            }
                        }
                    Image("pips \(randomValue2)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotation2))
                        .rotation3DEffect(.degrees(rotation2), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                        .onTapGesture {
                            chooseRandom2(times: Int.random(in: 1..<11))
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation2 += 360
                            }
                        }
                }
                let point = randomValue + randomValue2
                Text("Point: \(point)")
                    .padding()
                Button ("Test Point") {
                    calculatePoint()
                }
            }
        }
        
        
        // deciding a winner
        .onChange(of: randomValue + randomValue2, perform: { newValue in
            calculatePoint()
        })
        
        
        .alert(isPresented: $gameLoss) {
            Alert(title: Text(loss), dismissButton: .destructive(Text("play again"),
                                                                 action: {
                withAnimation {
                    point = 0
                    gameOver = false
                }
            }))
        }
        .alert(isPresented: $gameWon) {
            Alert(title: Text(winMessage), dismissButton: .destructive(Text("play again"),
                                                                       action: {
                withAnimation {
                    point = 0
                    gameOver = false
                }
            }))
        }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
    func calculatePoint() {
        if randomValue + randomValue2 == 7 {
            gameWon = true
        }
        if randomValue + randomValue2 == 11 {
            gameWon = true
        }
        if randomValue + randomValue2 == 2 {
            gameLoss = true
        }
        if randomValue + randomValue2 == 3 {
            gameLoss = true
        }
        if randomValue + randomValue2 == 12 {
            gameLoss = true
        }
        
    }
    
    func chooseRandom2(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue2 = Int.random(in: 1...6)
                chooseRandom2(times: times - 1)
            }
        }
    }
    struct playGame_Previews: PreviewProvider {
        static var previews: some View {
            playGame()
        }
    }
}
