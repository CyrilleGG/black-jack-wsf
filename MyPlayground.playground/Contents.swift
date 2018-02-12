import Foundation

var cards: [[String: [Any]]] = [          //les index (couleurs) sont en optionnels => ne pas oublier à les unwrapper
    ["Hearts": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Diamonds": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Clubs": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Spades": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]]
]


//print(cards)
//let heart = cards["Heart"]!
//print(heart[9])



let chooseColor = Int(arc4random_uniform(4))
let chooseCard = Int(arc4random_uniform(13))

let couleur = cards[chooseColor]

for(key, value) in couleur {
    print("\(value[chooseCard])" + " of " + "\(key)")
}
