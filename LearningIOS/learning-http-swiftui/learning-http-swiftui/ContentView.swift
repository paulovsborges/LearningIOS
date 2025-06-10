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
    
//    private var safeAreaInsets : EdgeInsets
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 0){
                Color.clear.frame(height: 80)
                
                List(posts){post in
                    PostListItem(
                        title: post.title,
                        postBody: post.body
                    )
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    .listRowSeparator(.hidden)
                }
                .scrollIndicators(.never)
                .listStyle(.plain)
                
            }
            VStack{
                topBar
                Spacer()
            }
            
        }
        .onAppear(perform: fetchData)
        .safeAreaPadding(.vertical)
//
//        NavigationView{
//            VStack(spacing: 0){
//                topBar
//                
//                List(posts){post in
//                    PostListItem(
//                        title: post.title,
//                        postBody: post.body
//                    )
//                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
//                    .listRowBackground(Color.clear)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
//                    .listRowSeparator(.hidden)
//                }
//                .scrollIndicators(.never)
//                .listStyle(.plain)
//                
//            }
//            .onAppear(perform: fetchData)
//            .toolbar{
//                HStack{
//                    
//                    Text("This is a toolbar").foregroundColor(.green)
//                    Spacer()
//                    Text("This is a toolbar").foregroundColor(.green)
//                    
//                }.background(Color.red)
//            }
//            .toolbarBackground(Color.black, for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
//        }
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
    
    var topBar: some View {
        VStack {
            Rectangle().frame(height: 40)
                .foregroundColor(Color.black)
                .offset(y: 30)
            
            Rectangle().frame(height: 40)
                .foregroundColor(Color.black)
                .cornerRadius(16)
        }
    }
}

#Preview {
    ContentView()
}
