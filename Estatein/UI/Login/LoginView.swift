//
//  LoginView.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    SliderSelection(selectedIndex: $viewModel.selectedIndex)
                    
                    Spacer()
                    
                    signInTitle
                    
                    email
                    
                    password
                    
                    forgotPassword
                    
                    signInButton
                    
                    signInSections
                    
                    Spacer()
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $viewModel.showRegisterView) {
                RegisterView()
            }
            .navigationDestination(isPresented: $viewModel.showMainView) {
                MainView()
            }
        }
    }
    
    @ViewBuilder private var background: some View {
        Color.darkSky
            .ignoresSafeArea()
        
        Image(.backgroundLogin)
    }
    
    private var signInTitle: some View {
        Text(viewModel.selectedIndex == 0 ? "Sign in" : "Sign up")
            .foregroundStyle(Color.white)
            .font(Font.soraBold30)
            .padding(.horizontal)
            .padding(.vertical)
    }
    
    private var email: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Email")
                    .font(Font.orbitronRegular14)
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Button("Sign in with mobile") {
                    
                }
                .font(Font.orbitronRegular14)
                .foregroundStyle(Color.greenGrass)
                .padding(.horizontal)
            }
            
            CustomTextField(textFiled: $viewModel.email, title: "Enter your email")
        }
        .padding(.vertical)
    }
    
    private var password: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .font(Font.orbitronRegular14)
                .padding(.horizontal)
                .foregroundStyle(Color.white)
            
            CustomTextField(textFiled: $viewModel.password, title: "Enter your password")
        }
    }
    
    private var forgotPassword: some View {
        Button("Forgot password?") {
            viewModel.showRegisterView = true
        }
        .font(Font.orbitronRegular14)
        .foregroundStyle(Color.greenGrass)
        .padding(.horizontal)
    }
    
    @ViewBuilder private var signInButton: some View {
        Button {
            if viewModel.selectedIndex == 1 {
                viewModel.sendOtp()
            } else {
                viewModel.loginIn()
            }

        } label: {
            Text(viewModel.selectedIndex == 0 ? "Sign in" : "Sign up")
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
        
        HStack {
            Spacer()
            
            Text("Or login with")
                .font(Font.orbitronRegular14)
                .foregroundStyle(Color.gray)
                .padding(.top)

            Spacer()
        }
    }
    
    private var signInSections: some View {
        HStack {
            Button {
                
            } label: {
                Text("FaceBook")
                    .padding()
                    .foregroundStyle(Color.black)
                    .font(Font.soraBold15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.leading)
            }
            .padding(.horizontal, 5)
            
            Button {
                
            } label: {
                Text("Google")
                    .padding()
                    .foregroundStyle(Color.black)
                    .font(Font.soraBold15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.trailing)
            }
            .padding(.horizontal, 5)
        }
        .padding(.top, 5)
    }
}

#Preview {
    LoginView()
}
