//
//  ListView.swift
//  Moonshot
//
//  Created by Tony Sharples on 16/02/2024.
//

import SwiftUI

struct ListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        VStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 30)

                            HStack {
                                Text(mission.displayName)
                                Text(mission.abbreviatedLaunchDate)
                            }
                            
                        }
                        .padding(5)
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListView(missions: missions, astronauts: astronauts)
}
