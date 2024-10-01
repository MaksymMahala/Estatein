//
//  View+Ext.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import SwiftUICore

extension View {
    func applyToolbar() -> some View {
        self.modifier(ToolbarModifier())
    }
}
