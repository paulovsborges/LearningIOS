//
//  PostListItem.swift
//  learning-http-swiftui
//
//  Created by Premiersoft on 06/06/25.
//

import SwiftUI

struct PostListItem: View{
    
    let title: String
    let postBody: String
    
    var body: some View {
        VStack{
        
            VStack(alignment: .leading){
                
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                Text(postBody)
            }
            .padding(10)
        }
        .background(Color.blue).clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    PostListItem(
        title: "This is a title",
        postBody: "This is the body of the item so it can have a proper content with the goal to adjust the layout through the preview"
    )
}
