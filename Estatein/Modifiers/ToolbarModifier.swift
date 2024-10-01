//
//  ToolbarModifier.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation

import SwiftUI

struct ToolbarModifier: ViewModifier {
    let imageToolBar = ["search-Icon", "notification-Icon", "scanner-Icon"]
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                Group {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(.toolbarIcon)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            ForEach(imageToolBar.indices, id: \.self) { image in
                                Button {
                                    // Action for each toolbar item
                                } label: {
                                    Image(imageToolBar[image])
                                        .padding(.horizontal, Constants.ToolbarModifierConstants.toolBarButtonPadding)
                                }
                            }
                        }
                    }
                }
            }
    }
}

fileprivate extension Constants {
    enum ToolbarModifierConstants {
        static let toolBarButtonPadding: CGFloat = scaled(5)
    }
}
