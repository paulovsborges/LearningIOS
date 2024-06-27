//
//  MissionItemView.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import SwiftUI

struct MissionItemView: View {
    
    let mission: Mission
    let astronauts : [Astronaut]
    
    var body: some View {
        NavigationLink{
            MissionDetailsView(mission: mission, astronauts: astronauts)
        } label: {
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack{
                    Text(mission.displayName)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text(mission.formattedDate)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.lightBackgroundColor)
            }
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackgroundColor)
        )
    }
}

#Preview {
    MissionItemView(mission: Mission(
        id: 1,
        launchDate: nil,
        crew: [
            Mission.CrewRole(name: "person 1", role: "role 1"),
            Mission.CrewRole(name: "person 2", role: "role 2")
        ],
        description: "this is a enormous description for the given mission"),
                    astronauts: [
                        Astronaut(id: "white", name: "white", description: "white"),
                        Astronaut(id: "white", name: "white", description: "white"),
                        Astronaut(id: "white", name: "white", description: "white"),
                    ])
}
