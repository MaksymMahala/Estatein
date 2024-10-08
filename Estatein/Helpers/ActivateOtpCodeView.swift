//
//  ActiveOTPCode.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import SwiftUI

struct ActivateOtpCodeView: View {
    @Binding var combinedOtp: String
    @State private var otp: [String] = ["", "", "", ""]
    @FocusState private var focusedField: Int?

    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<4, id: \.self) { index in
                TextField("", text: $otp[index])
                    .keyboardType(.numberPad)
                    .foregroundStyle(Color.white)
                    .frame(width: 70, height: 70)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(Font.soraBold30)
                    .multilineTextAlignment(.center)
                    .focused($focusedField, equals: index)
                    .onChange(of: otp[index]) { newValue in
                        if newValue.count == 1 && index < 3 {
                            focusedField = index + 1
                        } else if newValue.isEmpty && index > 0 {
                            focusedField = index - 1
                        }
                        combinedOtp = otp.joined()
                    }
                    .onTapGesture {
                        focusedField = index
                    }
                    .tint(Color.white)
            }
        }
        .padding()
        .onAppear {
            focusedField = 0
        }
    }
}

struct ActivateOtpCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ActivateOtpCodeView(combinedOtp: .constant(""))
    }
}
