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



// === Function that picks a card
func pickCard () -> Array<Any> {
    let chooseSuit = Int(arc4random_uniform(4))
    let chooseCard = Int(arc4random_uniform(13))
    let suit = cards[chooseSuit]

    let dicKey = Array(suit.keys)
    let suitName = dicKey[0] as String
    let dicValue = Array(suit[suitName]!)
    var cardValue = dicValue[chooseCard]
    
    // === Verify if card is already picked
    let lastPick = player().lastPick
    for i in 1...lastPick {
        print(player().hand[i])
        if player().hand[i][0] as? String == suitName {
            if player().hand[i][1] as? Int == cardValue as? Int {
                pickCard()
            } else if player().hand[i][1] as? String == cardValue as? String {
                pickCard()
            }
        }
    }
    // ---

    print("\(cardValue)" + " of " + "\(suitName)")
    
    // === Convert face cards
    if cardValue is String {
        let toConvert = cardValue as? String
        if toConvert == "Ace" {
            cardValue = 11
        } else {
            cardValue = 10
        }
    }
    // ---
    
    let pick = [suitName, cardValue]
    return pick
}
// ---

struct player {
    let name = "Player"
    var hand: Array<Array<Any>> = [[1]]
    var lastPick: Int
    init() {
        self.lastPick = hand.count - 1
    }
}

struct dealer {
    let name = "Dealer"
    var hand: Array<Array<Any>> = []
    var lastPick: Int
    init() {
        self.lastPick = hand.count - 1
    }
}

let lastPick = player().lastPick
for i in 0...lastPick {
    print(player().hand[i][0])
}
