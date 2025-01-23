//
//  ContentView.swift
//  NotesApp
//
//  Created by Tommy Mestdagh on 23/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State var Note: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("NOTES").padding().font(.title).fontWeight(.heavy)
                    Spacer()
                }
                
                Spacer()
                NavigationLink("click here", destination: Pag2View())
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
