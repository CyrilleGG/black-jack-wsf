//                  TO-DO LIST
//
//      Imaginer un process de vérif' qui se fait en 2 temps >>> if key == key then if value == value
//
//

import Foundation

// === Defining deck
let cards: [[String: [Any]]] = [
    ["Hearts": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Diamonds": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Clubs": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Spades": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]]
]
// ---



//////////////



class player {
    let name: String
    var hand: Array<Array<Any>> = []
    var lastPick: Int
    init(name: String) {
        self.name = name
        self.lastPick = hand.count
    }
    
    // === Function that picks a card
    func pickCard () {
        var chooseSuit = Int(arc4random_uniform(4))
        var chooseCard = Int(arc4random_uniform(13))
        var suit = cards[chooseSuit]
        
        var dicKey = Array(suit.keys)
        var suitName = dicKey[0] as String
        var dicValue = Array(suit[suitName]!)
        var cardValue = dicValue[chooseCard]
        
        // === Verify if card is already picked
        func verifyCards() {
            for (card) in self.hand.enumerated() {
                if card.element[0] as? String == suitName {
                    if card.element[1] as? Int == cardValue as? Int {
                        chooseSuit = Int(arc4random_uniform(4))
                        chooseCard = Int(arc4random_uniform(13))
                        suit = cards[chooseSuit]
                        dicKey = Array(suit.keys)
                        suitName = dicKey[0] as String
                        dicValue = Array(suit[suitName]!)
                        cardValue = dicValue[chooseCard]
                        verifyCards()
                    } else if card.element[1] as? String == cardValue as? String {
                        chooseSuit = Int(arc4random_uniform(4))
                        chooseCard = Int(arc4random_uniform(13))
                        suit = cards[chooseSuit]
                        dicKey = Array(suit.keys)
                        suitName = dicKey[0] as String
                        dicValue = Array(suit[suitName]!)
                        cardValue = dicValue[chooseCard]
                        verifyCards()
                    }
                }
            }
        }
        // ---
        verifyCards()
        print(self.name + " picked " + "\(cardValue)" + " of " + "\(suitName)")
        
        let pick = [suitName, cardValue]
        self.hand.append(pick)
    }
    // ---
    
    // === Points counter
    func countPoints () -> Int {
        var totalPoints = 0
        
        for (card) in self.hand.enumerated() {
            var cardValue = card.element[1]

            // === Face cards convertor
            if cardValue is String {
                let toConvert = cardValue as? String
                if toConvert == "Ace" {
                    cardValue = 11
                } else {
                    cardValue = 10
                }
            }
            // ---

            let cardVal = cardValue as! Int
            totalPoints = totalPoints + cardVal
        }
        return totalPoints
    }
    // ---
}

let playerOne = player(name: "Player 1")
let dealer = player(name: "Dealer")



for i in 0...1 {
    playerOne.pickCard()
}

for i in 0...1 {
    dealer.pickCard()
}

while playerOne.countPoints() < 21 - 5 {
    print("\(playerOne.name): 'Hit me !'")
    playerOne.pickCard()
    playerOne.countPoints()
}

if playerOne.countPoints() == 21 {
    print("\(playerOne.name): 'Black Jack !'")
} else if playerOne.countPoints() > 21 {
    print("\(playerOne.name) past over 21 points. \(dealer.name) wins the game !")
} else {
    print("\(playerOne.name): 'No more picks'")
    while dealer.countPoints() < 21 - 5 {
        print("\(dealer.name): 'Hit me !'")
        dealer.pickCard()
        dealer.countPoints()
    }
    
    if dealer.countPoints() == 21 {
        print("\(dealer.name): 'Black Jack !'")
    } else if dealer.countPoints() > 21 {
        print("\(dealer.name) past over 21 points. \(playerOne.name) wins the game !")
    } else {
        print("\(dealer.name): 'No more picks'")
        if playerOne.countPoints() > dealer.countPoints() && playerOne.countPoints() < 21 {
            print("\(playerOne.name) wins the game with \(playerOne.countPoints()) points !")
        } else if playerOne.countPoints() < dealer.countPoints() && dealer.countPoints() < 21 {
            print("\(dealer.name) wins the game with \(dealer.countPoints()) points !")
        } else if playerOne.countPoints() == dealer.countPoints() {
            print("\(dealer.name): 'Hit me !'")
            dealer.pickCard()
            dealer.countPoints()
            if dealer.countPoints() == 21 {
                print("\(playerOne.name): 'Black Jack !'")
            } else if dealer.countPoints() > 21 {
                print("\(dealer.name) past over 21 points. \(playerOne.name) wins the game !")
            }else if dealer.countPoints() < 21 {
                print("\(dealer.name) wins the game with \(dealer.countPoints()) points !")
            }
        }
    }
}
