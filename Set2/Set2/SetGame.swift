//
//  SetGame.swift
//  Set2
//
//  Created by Kevin Savinovich on 4/22/23.
//

import Foundation


class SetGame: ObservableObject {
    private var numberOfSetCardsInANewGame = 12
    private var deck: SetCardDeck
    @Published var cards = [SetCard]()
    @Published var discardedCards = [SetCard]()
      
    
    func addThreeCards() {
        if numberOfSetCardsInANewGame < 81 {
            numberOfSetCardsInANewGame += 3
        }
        
        for _ in 0..<3 {
            if let setCard = self.deck.dealCard() {
                cards.append(setCard)
            }
        }
        
     
    }
    
    func selectCard(_ card: SetCard) {
        let selectedCards = cards.filter { $0.isSelected }
        if selectedCards.count == 3 {
            // If three cards are already selected, deselect them all
            deselectAllCards()
        } else if let index = cards.firstIndex(where: { $0.id == card.id }), !cards[index].isMatched {
            if cards[index].isSelected {
                // Deselect the card if it was already selected
                cards[index].isSelected = false
                return
            }
            
            cards[index].isSelected = true
            
            if selectedCards.count == 2 {
                // If two cards are already selected, check if they form a set
                let threeCards = selectedCards + [card]
                if isSet(threeCards) {
                    // The selected cards form a set
                    markCardsAsMatched(threeCards)
                } else {
                    // The selected cards do not form a set
                    markCardsAsMisMatched(selectedCards + [card])
                   
                }
            }
        }
    }

    func deselectAllCards() {
        for index in cards.indices {
            cards[index].isSelected = false
            cards[index].isMisMatched = false
        }
    }

    func markCardsAsMatched(_ cards: [SetCard]) {
        // Mark the selected cards as matched
        for card in cards {
            if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                self.cards[index].isSelected = false
                self.cards[index].isMatched = true
            }
        }
        
        // Remove the matched cards from the game board
        self.cards.removeAll(where: { cards.contains($0) })
        
        // Add the matched cards to the discard pile
        self.discardedCards.append(contentsOf: cards)
    }

    func markCardsAsMisMatched(_ cards: [SetCard]) {
        for card in cards {
            if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                self.cards[index].isSelected = false
                self.cards[index].isMisMatched = true
            }
        }
    }
    
    func newGame() {
        numberOfSetCardsInANewGame = 12
        cards.removeAll()
        deck = SetCardDeck()
        discardedCards.removeAll() 
        
        for _ in 0..<numberOfSetCardsInANewGame {
            if let setCard = self.deck.dealCard() {
                cards.append(setCard)
            }
        }
        deselectAllCards()
    }
    
    
    
    func isSet(_ cards: [SetCard]) -> Bool {
        guard cards.count == 3 else {
            return false
        }
        let shapeSet = Set(cards.map { $0.shape })
        let colorSet = Set(cards.map { $0.color })
        let numberSet = Set(cards.map { $0.count })
        let shadingSet = Set(cards.map { $0.shade })
        return (shapeSet.count == 1 || shapeSet.count == 3) &&
               (colorSet.count == 1 || colorSet.count == 3) &&
               (numberSet.count == 1 || numberSet.count == 3) &&
               (shadingSet.count == 1 || shadingSet.count == 3)
    }
    
    
    
    
    init() {
        self.deck = SetCardDeck()
        
        for _ in 0..<numberOfSetCardsInANewGame {
            if let setCard = self.deck.dealCard() {
                cards.append(setCard)
            }
        }
    }
    
}
