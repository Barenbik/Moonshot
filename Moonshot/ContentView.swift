//
//  ContentView.swift
//  Moonshot
//
//  Created by Tony Sharples on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingList = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if showingList {
                    ListView(missions: missions, astronauts: astronauts)
                } else {
                    GridView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button("Toggle View", systemImage: "square.fill.text.grid.1x2") {
                    showingList = !showingList
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
