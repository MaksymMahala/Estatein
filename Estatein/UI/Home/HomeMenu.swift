//
//  HomeMenu.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import Foundation
import SwiftUI

struct HomeMenu: View {
    var buttonIcon: String
    var buttonText: String
    
    var body: some View {
        Button {
        
        } label: {
            VStack {
                Image(buttonIcon)
                    .frame(height: 40)
                    .shadow(color: Color.greenGrass, radius: 15)
                Text(buttonText)
                    .font(Font.orbitronRegular8)
                    .foregroundStyle(Color.white)
                    .frame(height: 20)
            }
        }
    }
}
