//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by paulo borges on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingAlert = false
    
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
        
        Text("Bla")
    }
    
    private func doSomething(){
        print("Doing something")
    }
}

#Preview {
    ContentView()
}
