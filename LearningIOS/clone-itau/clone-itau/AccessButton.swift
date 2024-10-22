//
//  AccessButton.swift
//  clone-itau
//
//  Created by Borges on 19/10/24.
//

import SwiftUI

struct AccessButton: View {
    
    let action: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            HStack(alignment: .top, content: {
                
                Spacer().frame(width: 20)
                VStack(alignment: .leading, content: {
                    
                    Spacer()
                    Text("\(action)").font(.headline)
                }).padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                Spacer()
            })
        }
    }
}

#Preview {
    VStack{
        Spacer()
        AccessButton(action: "Access").frame(height: 200)
        Spacer()
    }.background(Color.black)
}
