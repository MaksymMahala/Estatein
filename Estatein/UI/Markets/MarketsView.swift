//
//  MarketsView.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import SwiftUI

struct MarketsView: View {
    var stringFormatter = StringFormatter.shared
    @State var selectValue = 0
    var body: some View {
        NavigationStack {
            ZStack {
                Color.digitalBlack
                    .ignoresSafeArea()
                
                VStack {
                    CategoryValueType(selectValue: $selectValue)
                    
                    switch selectValue {
                    case 0:
                        ProgressView()
                    case 1:
                        SpotCurrenciesView()
                    case 2:
                        FuturesCurrenciesView()
                    case 3:
                        ProgressView()
                    default:
                        ProgressView()
                    }
                    
                    Button {
                        
                    } label: {
                        Image(.addFavoriteButton)
                    }
                    .padding(.vertical, 5)
                    
                    Spacer(minLength: 100)
                }
            }
            .applyToolbar()
        }
    }
}

struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MarketsView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            MarketsView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
