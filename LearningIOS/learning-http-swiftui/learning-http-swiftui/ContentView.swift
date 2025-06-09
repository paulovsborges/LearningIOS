//
//  ContentView.swift
//  learning-http-swiftui
//
//  Created by Premiersoft on 06/06/25.
//

import SwiftUI

struct ContentView: View {
    
    enum ButtonState : String{
        case idle = "Continue"
        case loading = "Loading"
    }
    
    @State private var buttonState = ButtonState.idle
    @State private var textFromPost: String? = nil
    @State private var posts: [PostResponse] = []
    
    var body: some View {
        ZStack {
            List(posts){post in
                PostListItem(title: post.title, postBody: post.body)
            }
        }
        .onAppear(perform: fetchData)
    }
    
    private func fetchData(){
        DispatchQueue.main.async {
            self.buttonState = .loading
        }
        
        Task {
            do {
                guard let request = try? HTTPRequestBuilder(endpoint: "/posts", method: .GET).build() else {
                    throw NSError(domain: "", code: 0, userInfo: nil)
                }
                
                let client = HTTPClient()
                
                let response = try await client.execute(request: request, returnType: [PostResponse].self)
                
                DispatchQueue.main.async {
                    posts = response
                    buttonState = .idle
                }
            } catch let error {
                DispatchQueue.main.async {
                    self.textFromPost = "\(error.localizedDescription) "
                    self.buttonState = .idle
                }
            }
        }
    }
}

enum HTTPMethod : String{
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

#Preview {
    ContentView()
}
