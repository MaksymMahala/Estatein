//
//  TabBar.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Menu", systemImage: "house")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Properties", systemImage: "mappin.circle")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Favorite", systemImage: "star.fill")
                    }
                
                ContentView()
                    .tabItem {
                        Label("About us", systemImage: "info")
                    }
                
                
                ContentView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            TabBarView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}

