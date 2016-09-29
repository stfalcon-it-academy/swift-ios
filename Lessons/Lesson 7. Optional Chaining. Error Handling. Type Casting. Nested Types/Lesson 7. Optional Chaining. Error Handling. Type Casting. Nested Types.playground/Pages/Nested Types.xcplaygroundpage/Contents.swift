/*: ## Nested Types (Вложенные типы) */
//:
/*: [Nested Types](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/NestedTypes.html#//apple_ref/doc/uid/TP40014097-CH23-ID242) */
/*: [Вложенные типы](http://swiftbook.ru/doc/nested-types) */


import Foundation


//: ### Nested Types (Вложенные типы)

// Вложенные типы содержат внутри себя вспомогательные перечисления, классы и структуры.

// Чтобы вложить тип в другой тип, необходимо во внешних фигурных скобках типа написать определение, которое данный тип будет поддерживать.
// Типы могут быть вложены на столько уровней, на сколько это необходимо.



//: ### Nested Types in Action (Вложенные типы в действии)

struct BlackjackCard {
    // вложенное перечисление `Suit`
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // вложенное перечисление `Rank`
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
        
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // свойства и методы `BlackjackCard`
    let rank: Rank, suit: Suit
    
    var description: String {
        var output = "масть: \(suit.rawValue),"
        output += " значение: \(rank.values.first)"
    
        if let second = rank.values.second {
            output += " или \(second)"
        }
        
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceOfSpades.description)")



//: ### Referring to Nested Types (Ссылка на вложенные типы)

// Для того, чтобы использовать вложенные типы снаружи определяющего их контекста, нужно поставить префикс имени типа, внутри которого он вложен, затем его имя:

let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue



