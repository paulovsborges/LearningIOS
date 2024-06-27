
import SwiftUI

struct ContentView: View {
    
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(missions){mission in
                        MissionItemView(
                            mission: mission,
                            astronauts: getMissionAstronauts(mission: mission)
                        )
                    }
                })
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackgroundColor)
            .preferredColorScheme(.dark)
        }
    }
    
    private func getMissionAstronauts(mission: Mission) -> [Astronaut]{
        return mission.crew.compactMap { crew in
            astronauts[crew.name]
        }
    }
}

#Preview {
    ContentView()
}
