//
//  SliderSelection.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation
import SwiftUI

struct SliderSelection: View {
    @Binding var selectedIndex: Int
    var title = ["Sign in", "Sign up"]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 50)
                .foregroundStyle(Color.black)
                .padding(.horizontal)

            HStack {
                ForEach(0..<2, id: \.self) { index in
                    ZStack {
                        Button {
                            selectedIndex = index
                        } label: {
                            Text(title[index])
                                .font(Font.soraRegular15)
                                .foregroundStyle(Color.gray)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    if selectedIndex == index {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 180, height: 45)
                                            .foregroundStyle(Color.digitalBlack)
                                            .padding(.horizontal)
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}
