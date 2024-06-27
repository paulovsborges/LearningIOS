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
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    
                    HStack{
                        Spacer()
                    }
                    
                    Text("Mission highligths")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    VStack{
                        
                        Text("Launched at ")
                        + Text(mission.formattedDate)
                            .bold()
                    }.padding(.bottom)
                    
                    Text(mission.description)
                })
                .padding(.horizontal)
                
                Divider()
                
                HStack{
                    
                    Text("Mission crew")
                        .font(.headline)
                        .padding([.top, .leading])
                    
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(astronauts){ astronaut in
                            AstronautItemView(image: astronaut.id, name: astronaut.name, onTap: {
                                currentAstronautDetails = astronaut
                            })
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
