//
//  OnBoardingScreen.swift
//  Locktap
//
//  Created by Borges on 24/06/24.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    
    @State private var shouldNavigateToHome = false
    
    var body: some View {
        VStack{
            
//            NavigationLink(
//                destination: HomeScreen(),
//                isActive: $shouldNavigateToHome,
//                label: {
//                    EmptyView()
//                })
            
            Image("locktap_splash_logo")
            
            navigationDestination(isPresented: $shouldNavigateToHome, destination: {
                HomeScreen()
            })
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MyColors.blue101727)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                shouldNavigateToHome = true
            }
        }
    }
}

#Preview {
    SplashScreen()
}
