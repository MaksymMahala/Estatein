//
//  SendOTPView.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @StateObject private var viewModel = VerificationCodeViewModel()

    var body: some View {
        ZStack {
            background
            
            VStack {
                
                enterCode
                
                ActivateOtpCodeView(combinedOtp: $viewModel.otp)
                
                resendCode
                
                continueButton
            }
        }
        .navigationDestination(isPresented: $viewModel.showSubmitRegistration) {
            SubmitRegistrationView()
        }
    }
    
    @ViewBuilder private var background: some View {
        Color.colorLogin
            .ignoresSafeArea()
        
        Image(.backgroundLogin)
    }
    
    private var enterCode: some View {
        VStack(alignment: .leading) {
            Text("Enter your code")
                .foregroundStyle(Color.white)
                .font(Font.soraBold30)
                .padding(.vertical)
            
            Text("Please type the code we sent")
                .foregroundStyle(Color.gray)
                .font(Font.soraRegular15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 40)
        .padding(.vertical)
    }
    
    private var resendCode: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("Resend code(30)")
                    .foregroundStyle(Color.gray)
                
                Button {
                    
                } label: {
                    Text("Resend Link")
                        .foregroundStyle(Color.greenGrass)
                        .padding(.top, 5)
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
    
    private var continueButton: some View {
        Button {
            viewModel.verifyOtp {
                viewModel.showSubmitRegistration = true
            }
        } label: {
            Text("Continue")
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
    VerificationCodeView()
}
