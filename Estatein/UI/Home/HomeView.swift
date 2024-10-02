//
//  HomeView.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack(alignment: .bottom) {
                        Color.digitalBlack
                            .frame(height: Constants.HomeView.topBannerHeight)
                        
                        LazyVGrid(columns: viewModel.columns, spacing: Constants.HomeView.gridSpacing) {
                            ForEach(viewModel.menuButtonImage.indices, id: \.self) { index in
                                HomeMenu(buttonIcon: viewModel.menuButtonImage[index], buttonText: viewModel.menuButtonText[index])
                            }
                        }
                        .padding(.bottom, Constants.HomeView.gridPaddingBottom)
                    }
                    
                    VStack(alignment: .leading) {
                        withdrawalP2P
                        
                        withdrawalByCard
                    }
                    .padding(.vertical, Constants.HomeView.sectionVerticalPadding)
                    
                    GroupedCoinsSection()
                }
                .applyToolbar()
            }
            .ignoresSafeArea(edges: .top)
        }
    }

    private var withdrawalByCard: some View {
        HStack {
            HStack {
                ZStack {
                    Image(.backSpace)
                    Image(.creditCard)
                }
                .frame(width: Constants.HomeView.imageFrameWidth)
                .padding(.vertical)
                .padding(.horizontal, Constants.HomeView.imageHorizontalPadding)
                
                VStack(alignment: .leading) {
                    Text("Credit/Debit Card")
                        .font(Font.orbitronRegular14)
                    Text("Visa, MasterCard")
                        .font(Font.orbitronRegular8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            }
        
            Button {
                // Action
            } label: {
                Image(.arrowButtonIcon)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: Constants.HomeView.buttonCornerRadius)
                            .frame(width: Constants.HomeView.buttonSize, height: Constants.HomeView.buttonSize)
                            .foregroundStyle(Color.buttonGray)
                    }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Constants.HomeView.withdrawalHeight)
        .background {
            RoundedRectangle(cornerRadius: Constants.HomeView.cardCornerRadius)
                .foregroundStyle(Color.lightGrayColor)
        }
        .padding(.horizontal)
    }

    private var withdrawalP2P: some View {
        HStack {
            HStack {
                ZStack {
                    Image(.backSpace)
                    Image(.rocket)
                }
                .frame(width: Constants.HomeView.imageFrameWidth)
                .padding(.vertical)
                .padding(.horizontal, Constants.HomeView.imageHorizontalPadding)
                
                VStack(alignment: .leading) {
                    Text("P2P Trading")
                        .font(Font.orbitronRegular14)
                    Text("Bank Transfer, PayPal Revolution")
                        .font(Font.orbitronRegular8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            }
            
            Button {
                // Action
            } label: {
                Image(.arrowButtonIcon)
                    .background {
                        RoundedRectangle(cornerRadius: Constants.HomeView.buttonCornerRadius)
                            .frame(width: Constants.HomeView.buttonSize, height: Constants.HomeView.buttonSize)
                            .foregroundStyle(Color.buttonGray)
                    }
            }
            .padding(.horizontal)
            .padding(.trailing, Constants.HomeView.trailingPadding)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Constants.HomeView.withdrawalHeight)
        .background {
            RoundedRectangle(cornerRadius: Constants.HomeView.cardCornerRadius)
                .foregroundStyle(Color.lightGrayColor)
        }
        .padding(.horizontal)
    }
}

fileprivate extension Constants {
    enum HomeView {
        static let topBannerHeight: CGFloat = scaled(300)
        static let gridSpacing: CGFloat = scaled(20)
        static let gridPaddingBottom: CGFloat = scaled(20)
        static let sectionVerticalPadding: CGFloat = scaled(20)
        static let toolBarButtonPadding: CGFloat = scaled(5)
        static let imageFrameWidth: CGFloat = scaled(60)
        static let imageHorizontalPadding: CGFloat = scaled(10)
        static let buttonSize: CGFloat = scaled(40)
        static let buttonCornerRadius: CGFloat = scaled(15)
        static let withdrawalHeight: CGFloat = scaled(78)
        static let cardCornerRadius: CGFloat = scaled(20)
        static let trailingPadding: CGFloat = scaled(15)
        static let coinCornerRadius: CGFloat = scaled(25)
        static let coinCardWidth: CGFloat = scaled(250)
        static let coinCardHeight: CGFloat = scaled(150)
        static let coinPadding: CGFloat = scaled(10)
        static let shadowRadius: CGFloat = scaled(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            HomeView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
