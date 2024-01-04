//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by paulo borges on 02/01/24.
//

import SwiftUI

let allCountries = ["Estonia",
                    "France",
                    "Germany",
                    "Ireland",
                    "Italy",
                    "Nigeria",
                    "Poland",
                    "Spain",
                    "UK",
                    "Ukraine",
                    "US"]

struct ContentView: View {
    
    @State private var countries = allCountries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var playersAnswer = 0
    @State private var isShowingResultAlert = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    @State private var attemptsCount = 0
    @State private var hits = [String]()
    
    private let maxAttempts = 8
    
    var body: some View {
        
        //        ZStack{
        //            VStack(spacing:0){
        //
        //                Color(red: 255, green: 0, blue:255)
        //                    .frame( minWidth: 200, maxWidth: .infinity, maxHeight: 500)
        //
        //                Color.blue
        //            }
        //
        //            Text("Your content")
        //                .padding(50)
        //                .background(.ultraThinMaterial)
        //                .foregroundStyle(.secondary)
        //        }
        //        .ignoresSafeArea()
        //        .background(.ultraThinMaterial)
        
        //        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        //        LinearGradient(stops: [
        //            .init(color: .white, location: 0.45),
        //            Gradient.Stop(color: .black, location: 0.65)
        //        ], startPoint: .top, endPoint: .bottom)
        
        //        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 0, endRadius: 200)
        
        //        AngularGradient(colors: [.red,.purple,  .blue, .green, .yellow, .orange, .red], center: .center)
        
        //        Text("My content")
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .foregroundStyle(.white)
        //            .background(.red.gradient)
        
        
        //        Button("Click here to do something", role: .destructive, action: doSomething )
        //            .buttonStyle(.bordered)
        //            .tint(.indigo)
        
        
        //        Button("Do something", systemImage: "pencil"){
        //            print("Doing something")
        //        }
        //
        //        Button{
        //            print("Doing something")
        //        } label: {
        //
        //            HStack{
        //                Label("Do something", systemImage: "pencil")
        //            }
        //        }
        
        
        //        VStack{
        //            Text("There is some dummy content")
        //
        //            Button("Show alert", role: .destructive){
        //                isShowingAlert = true
        //            }
        //        }
        //        .alert("Warning", isPresented: $isShowingAlert){
        //            Button("Ok"){
        //                isShowingAlert = false
        //            }
        //            Button("Done"){
        //                isShowingAlert = false
        //            }
        //        } message: {
        //            Text("Bullocks!!!")
        //        }
        
        ZStack{
            
            //            LinearGradient(stops: [.init(color: .blue, location: 0.40),
            //                                   .init(color: .cyan, location: 1.0)
            //            ], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack{
                    
                    Spacer()
                    
                    Text("Guess the flag")
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.bold))
                    
                    Text("Tap the flag of")
                        .foregroundStyle(.primary)
                        .font(.subheadline.weight(.bold))
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    } label: {
                        
                        Image(countries[number])
                            .clipShape(.buttonBorder)
                            .shadow(radius: 5)
                    }
                }
                
                Spacer()
                Spacer()
                
                Text("Score \(playerScore)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
        }
        .alert(scoreTitle, isPresented: $isShowingResultAlert){
            if attemptsCount == 8 {
                Button("Reset", action: resetGame)
            }else{
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text(getAnswerMessage())
        }
    }
    
    private func flagTapped(_ number : Int){
        
        playersAnswer = number
        
        attemptsCount += 1
        
        let isCorrect = playersAnswer == correctAnswer
        
        handleUserScore(isCorrect: isCorrect)
        
        scoreTitle = isCorrect ? "Correct" : "Wrong"
        
        isShowingResultAlert = true
    }
    
    private func askQuestion(){
        
        let isPrevieousAnswerCorrect =  playersAnswer == correctAnswer
        
        if isPrevieousAnswerCorrect {
            countries.remove(at: correctAnswer)
        }
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func handleUserScore(isCorrect: Bool){
        if isCorrect {
            playerScore += 1
        }else{
            if playerScore > 0 {
                playerScore -= 1
            }
        }
    }
    
    private func getAnswerMessage()-> String{
        if attemptsCount == maxAttempts {
            if(playerScore == maxAttempts){
                return "Your nailed! Do you wanna play again?"
            } else {
                return "That is the end! Your score is \(playerScore), do you wish to reset?"
            }
        }
        
        if playersAnswer == correctAnswer {
            return "Congratulations"
        }else{
            return "That is the flag of \(countries[playersAnswer])"
        }
    }
    
    private func resetGame(){
        countries = allCountries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        playerScore = 0
        attemptsCount = 0
    }
}

#Preview {
    ContentView()
}
