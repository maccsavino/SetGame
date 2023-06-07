//
//  SetCard.swift
//  Set2
//
//  Created by Kevin Savinovich on 4/22/23.
//

import Foundation


struct SetCard : Identifiable, Equatable {
    
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return (lhs.shape == rhs.shape &&
                    lhs.shade == rhs.shade &&
                    lhs.color == rhs.color &&
                    lhs.count == rhs.count &&
                    lhs.id == rhs.id)
    }
    
    var shape: Shapes
    var shade: Shades
    var color: Colors
    var count: Int
    var id: Int

    var isSelected: Bool
    var isMatched: Bool
    var isMisMatched: Bool
    var isSelectable: Bool
    
    enum Shapes {
        case diamond
        case oval
        case squiggle
        
        static var all = [Shapes.diamond, .oval, .squiggle]
    }
    
    enum Shades {
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined, .striped, .filled]
    }
    
    enum Colors {
        case red
        case green
        case purple
        
        static var all = [Colors.red, .green, .purple]
    }

    init(shape: Shapes, shade: Shades, color: Colors, count: Int, id: Int ) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.count = count
        self.id = id
        self.isSelected = false
        self.isMatched = false
        self.isMisMatched = false
        self.isSelectable = true
    }

    init(shape: Shapes, shade: Shades, color: Colors, count: Int, id: Int,
         isSelected: Bool, isMatched: Bool, isMisMatched: Bool, isSelectable: Bool) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.count = count
        self.id = id
        self.isSelected = isSelected
        self.isMatched = isMatched
        self.isMisMatched = isMisMatched
        self.isSelectable = isSelectable
    }
    
    func discard() -> SetCard {
           var discardedCard = self
           discardedCard.isSelected = false
           discardedCard.isMatched = false
           discardedCard.isMisMatched = false
           discardedCard.isSelectable = false
           return discardedCard
       }
}
