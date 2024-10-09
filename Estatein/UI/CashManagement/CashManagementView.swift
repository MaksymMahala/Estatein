//
//  CashManagementView.swift
//  Minus1
//
//  Created by Max on 09.10.2024.
//

import SwiftUI

struct CashManagementView: View {
    @StateObject private var viewModel = CashManagementViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.darkSky
            }
            
            VStack {
                ZStack {
                    background
                    
                    VStack(alignment: .leading) {
                        currentBalanceTitle
                        
                        balance
                        
                        caregoryManagementType
                    }
                    .padding(.horizontal)
                }
                
                SpotCurrenciesView() //!will be change in user history shopping
            }
        }
        .ignoresSafeArea()
    }
    
    private var background: some View {
        Image(.backStar)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .opacity(0.5)
            .shadow(color: Color.blue, radius: 50)
    }
    
    @ViewBuilder private var balance: some View {
        Text("10,345.53")
            .font(Font.soraBold30)
            .foregroundStyle(Color.white)
        
        Text("$345")
            .font(Font.soraRegular15)
            .foregroundStyle(Color.grayLight)
            .opacity(0.8)
    }
    
    private var currentBalanceTitle: some View {
        HStack {
            Text("Current balance")
                .font(Font.orbitronRegular14)
                .foregroundStyle(Color.gray)
                .padding(.top, 40)

            Spacer()
            
            Button{
                
            } label: {
                Image(.eyeSlash)
                    .padding(.top, 40)
            }
        }
    }
    
    private var caregoryManagementType: some View {
        HStack {
            ForEach(0..<3, id: \.self) { index in
                Button {
                    viewModel.selectedIndex = index
                } label: {
                    Text(viewModel.caregoryManagement[index])
                        .font(Font.orbitronRegular12)
                        .foregroundStyle(viewModel.selectedIndex == index ? Color.black : Color.gray)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 120, height: 45)             .foregroundStyle(viewModel.selectedIndex == index ? Color.greenGrass : Color.darkSky)
                        }
                        .padding(.horizontal, 14)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
    }
}

#Preview {
    CashManagementView()
}
