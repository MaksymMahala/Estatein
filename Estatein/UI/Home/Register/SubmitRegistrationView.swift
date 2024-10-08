//
//  SubmitRegistrationView.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import SwiftUI

struct SubmitRegistrationView: View {
    @StateObject private var viewModel = SubmitRegistrationViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.digitalBlack
                    .ignoresSafeArea()
                
                Image(.backgroundLogin)
                
                VStack {
                    Text("Your account has been successfully created!")
                        .foregroundStyle(Color.white)
                        .font(Font.soraBold30)
                        .padding(.top, 80)
                    
                    button
                }
            }
            
            Image(.submitPersonIcon)
                .padding(.top, 100)
            
        }
        .navigationDestination(isPresented: $viewModel.showMainView) {
            MainView()
        }
    }
    
    private var button: some View {
        Button {
            viewModel.showMainView = true
        } label: {
            Text("Get Started")
        }
        .foregroundStyle(Color.black)
        .font(Font.soraRegular20)
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.greenGrass)
        }
        .padding(30)
    }
}

#Preview {
    SubmitRegistrationView()
}
