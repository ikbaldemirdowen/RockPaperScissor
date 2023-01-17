//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Ikbal Demirdoven on 2023-01-16.
//

import SwiftUI

struct ContentView: View {
    var options = ["Rock", "Paper", "Scissor"]
    @State private var randomNum = Int.random(in: 0..<3)
    @State private var computersSelection : String = ""
    var body: some View {
        VStack
        {
            ForEach(0..<3)
            { number in
                Button()
                {
                    gameStart()
                } label: {
                    Image(options[number])
                        .imageScale(.small)
                }
            }
        }
    }
    
    func gameStart()
    {
        computersSelection = options[randomNum]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
