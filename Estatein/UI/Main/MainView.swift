//
//  MainView.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.selectedTab {
            case "Home":
                HomeView()
            case "Markets":
                MarketsView()
            case "Trades":
                ContentView()
            case "Activity":
                ContentView()
            case "Wallets":
                ContentView ()
            default:
                HomeView()
            }
            
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $viewModel.selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            MainView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
