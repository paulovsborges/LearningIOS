//
//  ContentView.swift
//  WordScramble
//
//  Created by Borges on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var playerScore = 0
    
    @State private var alertTittle = ""
    @State private var alertMessage = ""
    @State private var isShowingAlert = false
    
    
    var body: some View {
        NavigationStack{
            List{
                HStack {
                    Section{
                            TextField("Enter a new word", text: $newWord)
                                .textInputAutocapitalization(.never)
                            
                    }
                    Section{
                        Text("Your score \(playerScore)")
                    }
                }
                
                Section{
                    ForEach(usedWords, id: \.self){word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text("\(word)")
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(alertTittle, isPresented: $isShowingAlert){} message: {
                Text(alertMessage)
            }
            .toolbar(content: {
                Button("Start game", action: restartGame)
            })
        }
    }
    
    private func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: newWord) else{
            showError(title: "Word already used", message: "Try another one")
            return
        }
        
        guard isPossible(word: newWord)else{
            showError(title: "Word not possible", message: "You cant spell \(rootWord) like that")
            return
        }
        
        guard isReal(word: newWord)else{
            showError(title: "Word not recognized", message: "You can not just make them up")
            return
        }
        
        guard validLetterCount(word: newWord)else{
            showError(title: "Word too short", message: "You can do better than this")
            return
        }
        
        playerScore += 1
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    private func startGame(){
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsUrl){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Unable to load start.txt from bundle")
        
    }
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word) && word != rootWord
    }
    
    private func isPossible(word: String) -> Bool {
        
        var tempWord = word
        
        for letter in tempWord {
            
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else{
                return false
            }
            
            
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelled = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelled.location == NSNotFound
    }

    private func validLetterCount(word: String) -> Bool {
        word.utf16.count >= 3
    }
    
    private func restartGame(){
        usedWords.removeAll()
        newWord = ""
        playerScore = 0
        startGame()
    }
    
    private func showError(title:String, message: String){
        alertTittle = title
        alertMessage = message
        isShowingAlert = true
    }
}

#Preview {
    ContentView()
}
