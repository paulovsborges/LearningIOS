//
//  ContentView.swift
//  Edutainment
//
//  Created by Borges on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTable = 1
    @State private var currentQuestion : Int? = nil
    @State private var currentPlayerScore = 0
    @State private var currentAnswer = ""
    
    var body: some View {
        VStack {
            
            HStack{
                Spacer()
                Text("Current score \(currentPlayerScore)")
            }.padding()
            
            Spacer()
            
            Stepper("Lets practice table of \(currentTable)?", value: $currentTable, in: 1...12)
            
            Spacer()
            
            if currentQuestion != nil{
                VStack{
                    HStack{
                        Text("What is \(currentTable) x \(currentQuestion ?? 1)?")
                        
                        Spacer()
                    }
                    TextField("\(currentTable) x \(currentQuestion ?? 1) = ", text: $currentAnswer)
                    
                    Button("Submit", action: validateResult)
                }
            }
            Spacer()
            
            Button("Ask me a question", action: askQuestion)
            
        }
        .padding()
    }
    
    private func askQuestion(){
        let number = Int.random(in: 1...100)
        
        currentQuestion = number
    }
    
    private func validateResult(){
        let playersAnswer = Int(currentAnswer)
        
        let correctAnswer = currentTable * (currentQuestion ?? 1)
        
        if playersAnswer == correctAnswer{
            currentPlayerScore += 1
        }else{
            currentPlayerScore = 0
        }
        
        currentQuestion = nil
        currentAnswer = ""
        
        askQuestion()
    }
}

#Preview {
    ContentView()
}
