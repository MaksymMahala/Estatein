//
//  Scaled.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import Foundation
import CoreGraphics
import UIKit

let idealSize = CGSize(width: 375, height: 812)
let screenSize: CGSize = UIScreen.main.bounds.size
    
var scale: CGFloat {
    return min(1, screenSize.hypot / idealSize.hypot, 1)
}
    
func scaled(_ constant: CGFloat) -> CGFloat {
    return constant * scale
}

extension CGSize {
    var hypot: CGFloat {
        CoreGraphics.hypot(width, height)
    }
}
