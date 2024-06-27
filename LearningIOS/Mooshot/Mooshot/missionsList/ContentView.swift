
import SwiftUI

struct ContentView: View {
    
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var isGridLayout = true
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                let content = ForEach(missions){mission in
                    MissionItemView(
                        mission: mission,
                        astronauts: getMissionAstronauts(mission: mission)
                    )
                }
                
                if isGridLayout {
                    LazyVGrid(columns: columns, content: {
                        content
                    })
                
                    .padding([.horizontal, .bottom])
                } else {
                    LazyVStack{
                        content
                    }
                    .padding([.horizontal, .bottom])
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackgroundColor)
            .preferredColorScheme(.dark)
            .toolbar{
                Image(systemName: isGridLayout ? "grid" : "table")
                    .onTapGesture {
                    isGridLayout.toggle()
                }
            }
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
