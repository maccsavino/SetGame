//
//  diamond.swift
//  Set2
//
//  Created by Kevin Savinovich on 4/22/23.
//

import SwiftUI

struct Diamond: Shape {
    
    private struct DiamondRatios {
        static let widthPercentage: CGFloat = 0.4
        static let heightPercentage: CGFloat = 0.4
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.height * DiamondRatios.heightPercentage
        let height = rect.width * DiamondRatios.widthPercentage
        
        var diamond = Path()
        diamond.move(to: CGPoint(x: center.x - width/2, y: center.y))
        diamond.addLine(to: CGPoint(x: center.x, y: center.y - height/2))
        diamond.addLine(to: CGPoint(x: center.x + width/2, y: center.y))
        diamond.addLine(to: CGPoint(x: center.x, y: center.y + height/2))
        diamond.addLine(to: CGPoint(x: center.x - width/2, y: center.y))
        
        return diamond
    }
}
