//
//  CategoryValueType.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import Foundation
import SwiftUI

struct CategoryValueType: View {
    @Binding var selectValue: Int
    var categoryValueType = ["Convert", "Spot", "Futures", "Margin"]

    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { index in
                Button {
                    selectValue = index
                } label: {
                    Text(categoryValueType[index])
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(selectValue == index ? Color.darkGreenDigital : Color.black)
                        .cornerRadius(10)
                }
            }
            .foregroundStyle(Color.white)
        }
        .padding(10)
        .background(Color.black)
        .cornerRadius(20)
        .padding(.top)
    }
}
