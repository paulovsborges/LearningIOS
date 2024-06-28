//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Borges on 28/06/24.
//

import SwiftUI

struct Response : Codable{
    let results : [Result]
}

struct Result : Codable{
    let trackId : Int
    let trackName: String
    let collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.self.trackId){track in
            VStack(alignment: .leading){
                Text(track.trackName).padding()
                
                Text(track.collectionName).padding()
            }
        }
        .onAppear()
        .onDisappear()
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse  = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
            
        } catch{
            print("Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
