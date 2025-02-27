//
//  ContentView.swift
//  clone-itau
//
//  Created by Borges on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
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
            
            ScrollView(content: {
                
                AccessButton(action: "Access", assetIcon: "lock").frame(height: 180)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Fast transfer", assetIcon: "send")
                    Spacer().frame(width: 20)
                    AccessButton(action: "Pay", assetIcon: "Lock")
                }).frame(height: 180)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Summary", assetIcon: "lock")
                    Spacer().frame(width: 20)
                    AccessButton(action: "Cards", assetIcon: "lock")
                }).frame(height: 180)
                
                Spacer().frame(height: 20)
                
                HStack(content: {
                    AccessButton(action: "Summary", assetIcon: "Lock")
                    
                    Spacer().frame(width: 10)
                    
                    AccessButton(action: "Cards", assetIcon: "Lock")
                    
                    Spacer().frame(width: 10)
                    
                    AccessButton(action: "Cards", assetIcon: "Lock")
                    
                }).frame(height: 120)
                
                Spacer()
                
            }).scrollIndicators(.hidden)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(Color(red: 241/255, green: 242/255, blue: 244/255))
        
    }
}

#Preview {
    ContentView()
}
