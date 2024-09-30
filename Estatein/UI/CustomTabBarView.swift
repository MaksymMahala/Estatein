//
//  TabBar.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import SwiftUI

struct SectionTab: View {
    @Binding var selectedTab: String
    var sectionText: String
    var selectedImageName: String
    var unSelectedImageName: String

    var body: some View {
        Button(action: {
            selectedTab = sectionText
        }) {
            VStack {
                Image(selectedTab == sectionText ? selectedImageName : unSelectedImageName)
                    .frame(width: Constants.CustomTabBarView.customBarFrameImage, height: Constants.CustomTabBarView.customBarFrameImage)
            }
        }
        .padding(.horizontal)
        .shadow(color: Color.white, radius: selectedTab == sectionText ? 15 : 0)
    }
}

struct CustomTabBarView: View {
    @Binding var selectedTab: String

    var body: some View {
        HStack {
            SectionTab(selectedTab: $selectedTab, sectionText: "Home", selectedImageName: "home", unSelectedImageName: "home-gray")

            SectionTab(selectedTab: $selectedTab, sectionText: "Markets", selectedImageName: "shopping-bag", unSelectedImageName: "shopping-bag-gray")

            SectionTab(selectedTab: $selectedTab, sectionText: "Trades", selectedImageName: "money-send", unSelectedImageName: "money-send-gray")

            SectionTab(selectedTab: $selectedTab, sectionText: "Activity", selectedImageName: "receipt", unSelectedImageName: "receipt-gray")

            SectionTab(selectedTab: $selectedTab, sectionText: "Wallets", selectedImageName: "shopping-bag", unSelectedImageName: "shopping-bag-gray")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: Constants.CustomTabBarView.customBarHeight)
        .background(Color.black)
        .cornerRadius(Constants.CustomTabBarView.customBarRadius)
        .padding(Constants.CustomTabBarView.customBarPadding)
        .shadow(radius: Constants.CustomTabBarView.customBarShadow)
        .padding(.horizontal, Constants.CustomTabBarView.customBarPadding)
        .padding(.bottom, Constants.CustomTabBarView.customBarPadding40)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTabBarView(selectedTab: .constant("Settings"))
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            CustomTabBarView(selectedTab: .constant("Settings"))
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}

fileprivate extension Constants {
    enum CustomTabBarView {
        static let customBarHeight: CGFloat = scaled(80)
        static let customBarRadius: CGFloat = scaled(20)
        static let customBarFrameImage: CGFloat = scaled(20)
        static let customBarPadding: CGFloat = scaled(10)
        static let customBarPadding40: CGFloat = scaled(15)
        static let customBarShadow: CGFloat = scaled(5)

    }
}
