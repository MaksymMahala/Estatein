//
//  EmailHandlerView.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            background
            
            VStack(alignment: .leading) {
                Spacer()
                
                signInTitle
                
                sureEmail
                
                button
                
                Spacer()
            }
        }
        .navigationDestination(isPresented: $viewModel.showVerificationCodeView) {
            VerificationCodeView()
        }
    }
    
    @ViewBuilder private var background: some View {
        Color.colorLogin
            .ignoresSafeArea()
        
        Image(.backgroundLogin)
    }
    
    private var signInTitle: some View {
        Text("Register with email")
            .foregroundStyle(Color.white)
            .font(Font.soraBold30)
            .padding(.horizontal)
            .padding(.vertical)
    }
    
    @ViewBuilder private var sureEmail: some View {
        Text("Make sure your email address is correct before proceeding. We'll send important updates and notifications to this address. If it's incorrect, you might miss out on important information.")
            .foregroundStyle(Color.gray)
            .padding(.horizontal)
        
        Spacer()

        Text(viewModel.email)
            .foregroundStyle(Color.white)
            .font(Font.soraBold15)
            .padding(.horizontal)
        
        Spacer()
    }
    
    private var button: some View {
        Button {
            viewModel.showVerificationCodeView = true
        } label: {
            Text("Send OTP")
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
    RegisterView()
}
