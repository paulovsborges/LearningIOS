//
//  ContentView.swift
//  clone-itau
//
//  Created by Borges on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView(content: {
            
            VStack(){
                HStack(alignment: .top, content: {
                    
                    ZStack(alignment: .center, content: {
                        
                        Circle().frame(width: 50).foregroundColor(.black)
                        
                        Text("JD").colorInvert()
                    })
                    
                    Spacer().frame(width: 20)
                    
                    VStack(alignment: .leading, content: {
                        Text("Hello, John")
                        Text("***.513.027-\("**")")
                    })
                    
                    Spacer()
                })
                
                AccessButton(action: "Access").frame(height: 200)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Fast transfer")
                    Spacer().frame(width: 20)
                    AccessButton(action: "Pay")
                }).frame(height: 200)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Summary")
                    Spacer().frame(width: 20)
                    AccessButton(action: "Cards")
                }).frame(height: 200)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Summary")
                    
                    Spacer().frame(width: 10)
                    
                    AccessButton(action: "Cards")
                    
                    Spacer().frame(width: 10)
                    
                    AccessButton(action: "Cards")
                    
                }).frame(height: 120)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .background(Color(red: 241/255, green: 242/255, blue: 244/255))
            
        })
    }
}

#Preview {
    ContentView()
}
