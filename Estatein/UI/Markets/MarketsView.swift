//
//  MarketsView.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import SwiftUI

struct MarketsView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @StateObject private var viewModel = CryptoViewModel()
    var stringFormatter = StringFormatter.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.digitalBlack
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(viewModel.cryptocurrencies) { crypto in
                                HStack {
                                    AsyncImage(url: URL(string: crypto.icon)) { image in
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .padding(.leading, 5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(crypto.name)
                                            .font(Font.soraMedium15)
                                            .foregroundStyle(Color.white)
                                        Text(webSocketManager.symbol)
                                            .font(Font.orbitronRegular12)
                                            .foregroundStyle(Color.gray)
                                        
                                    }
                                    .padding(.horizontal, 5)
                                    
                                    Spacer()
                                    
                                    Text("$\(stringFormatter.formatPrice(webSocketManager.price))")
                                        .font(Font.soraBold15)
                                        .foregroundStyle(Color.white)
                                }
                                .frame(height: 70)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    Button {
                        
                    } label: {
                        Image(.addFavoriteButton)
                    }
                    .padding(.vertical, 5)
                    
                    Spacer(minLength: 100)
                }
            }
            .applyToolbar()
            .onDisappear {
                webSocketManager.disconnect()
            }
            .onAppear {
                viewModel.fetchCryptocurrencies()
            }
        }
    }
}

struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MarketsView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            MarketsView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
