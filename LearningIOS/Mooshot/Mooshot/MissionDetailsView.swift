//
//  MissionDetailsView.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import SwiftUI

struct MissionDetailsView: View {
    
    let mission: Mission
    let astronauts: [Astronaut]
    
    @State private var currentAstronautDetails : Astronaut? = nil
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axix in
                        width * 0.6
                    }
                
                VStack(alignment: .leading, content: {
                    Text("Mission highligths")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }).padding(.horizontal)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(astronauts){ astronaut in
                            VStack{
                                Image(astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .onTapGesture {
                                        self.currentAstronautDetails = astronaut
                                    }
                                
                                Text(astronaut.name)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackgroundColor)
        .sheet(item: $currentAstronautDetails) { astronaut in
                AstronautDetailsSheetView(astronaut: astronaut)
        }
    }
}

#Preview {
    MissionDetailsView(mission: Mission(
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
                       ]
    )
    .preferredColorScheme(.dark)
}
