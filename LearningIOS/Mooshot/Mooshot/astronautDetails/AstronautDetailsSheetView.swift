//
//  AstronautDetailsSheetView.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import SwiftUI

struct AstronautDetailsSheetView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                
                VStack{
                    Text(astronaut.name).font(.title.bold())
                        .padding(.bottom)
                    Text(astronaut.description)
                }
                .padding()
            }
            .preferredColorScheme(.dark)
        }
        .background(
            Color.black.ignoresSafeArea(.all))
    }
}

#Preview {
    AstronautDetailsSheetView(astronaut: Astronaut(id: "white", name: "white", description: "white"))
}
