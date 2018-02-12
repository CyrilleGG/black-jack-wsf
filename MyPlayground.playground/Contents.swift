import Foundation

var cards: [[String: [Any]]] = [          //les index (couleurs) sont en optionnels => ne pas oublier à les unwrapper
    ["Heart": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Diamond": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Club": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]],
    ["Spade": [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]]
]


//print(cards)
//let heart = cards["Heart"]!
//print(heart[9])



let chooseColor = Int(arc4random_uniform(4))

let couleur = cards[chooseColor]

print(couleur)

for(key, _) in couleur {
    print("\(key)")
}
