//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Ikbal Demirdoven on 2023-01-16.
//


import SwiftUI

struct ContentView: View {
    var options = ["Rock", "Paper", "Scissor"]
    @State private var computersSelection = ""
    @State private var usersSelection = ""
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var userScore = 0
    @State private var computerScore = 0
    @State private var gameTurn = 0
    @State private var gameEnd = false
    @State private var roundResult = false
    var body: some View {
        VStack
        {
            VStack
            {
                Text("Your score \(userScore)")
                Text("Computer's score \(computerScore)")
            }
            .font(.largeTitle)
            VStack
            {
                ForEach(0..<3)
                { number in
                    Button()
                    {
                        computersSelection = options.randomElement()!
                        usersSelection = options[number]
                        print(usersSelection)
                        print(computersSelection)
                        winOrLose()
                        gameEnded()
                        
                    } label: {
                        Image(options[number])
                            .imageScale(.small)
                            .background(.secondary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .alert(alertTitle, isPresented: $gameEnd)
        {
            Button("Restart")
            {
                resetGame()
            }
        } message: {
            Text(alertMessage)
        }
    }
    func winOrLose()
    {
        gameTurn += 1
        if usersSelection == "Rock" && computersSelection == "Scissor"
        {
            userScore += 1
            computerScore -= 1
        }
        else if usersSelection == "Rock" && computersSelection == "Paper"
        {
            computerScore += 1
            userScore -= 1
        }
        else if usersSelection == "Rock" && computersSelection == "Rock"
        {
            userScore = userScore
            computerScore = computerScore
        }
        else if usersSelection == "Paper" && computersSelection == "Rock"
        {
            userScore += 1
            computerScore -= 1
        }
        else if usersSelection == "Paper" && computersSelection == "Paper"
        {
            userScore = userScore
            computerScore = computerScore
        }
        else if usersSelection == "Paper" && computersSelection == "Scissor"
        {
            computerScore += 1
            userScore -= 1
        }
        else if usersSelection == "Scissor" && computersSelection == "Rock"
        {
            computerScore += 1
            userScore -= 1
        }
        else if usersSelection == "Scissor" && computersSelection == "Paper"
        {
            userScore += 1
            computerScore -= 1
        }
        else if usersSelection == "Scissor" && computersSelection == "Scissor"
        {
            userScore = userScore
            computerScore = computerScore
        }
    }
    func gameEnded()
    {
        if gameTurn == 10
        {
            gameEnd = true
            if userScore > computerScore
            {
                alertTitle = "YOU WON!"
                alertMessage = "Your score was \(score), computer's score was \(computerScore)"
            }
            else if userScore == computerScore
            {
                alertTitle = "DRAW!"
                alertMessage = "Your score was \(score), computer's score was \(computerScore)"
            }
            else
            {
                alertTitle = "YOU LOST"
                alertMessage = "Your score was \(score), computer's score was \(computerScore)"
            }
            userScore = 0
            computerScore = 0
        }
    }
    
    func resetGame()
    {
        userScore = 0
        computerScore = 0
        gameTurn = 0
        gameEnd = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
