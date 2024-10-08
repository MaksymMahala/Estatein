//
//  CustomTextField.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    @Binding var textFiled: String
    var title: String

    var body: some View {
        TextField(title, text: $textFiled)
            .foregroundColor(.white)
            .padding()
            .modifier(PlaceholderStyle(showPlaceHolder: textFiled.isEmpty, placeholder: title))
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.black)
            }
            .padding(.horizontal)
    }
}

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .font(Font.soraRegular15)
                    .foregroundColor(.gray)
                    .padding(.leading, 17)

            }
            content
        }
    }
}
