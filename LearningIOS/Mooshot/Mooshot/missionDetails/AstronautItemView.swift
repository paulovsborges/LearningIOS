//
//  AstronautItemView.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import SwiftUI

struct AstronautItemView: View {
    
    let image: String
    let name: String
    let onTap : () -> Void
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .onTapGesture{
                    onTap()
                }
            
            Text(name)
        }
    }
}

#Preview {
    AstronautItemView(image: "apollo1", name: "white") {}
}
