import Foundation


// 1. Создайте константу с явным типом `Float` (число с плавающей точкой) и значением `4`.
let floatTest: Float = 4



// 2. Попробуйте удалить конвертирование в `String` из последней строки. Какую ошибку вы получите?
let label = "The width is "
let width = 94
let widthLabel = label + String(width)



// 3. Используйте `\()`, чтобы добавить выражение вычисления числа с плавающей запятой в строку. Также, попробуйте вставить чье-нибудь имя в приветствие.
let apples = 3
let oranges = 5
var appleSummary = "I have \(apples) apples."
var fruitSummary = "I have \(apples + oranges) pieces of fruit."

let myName = "Sergey"

appleSummary = "I have \(apples) apples."
fruitSummary = "\(myName) have \(Float(apples + oranges)) pieces of fruit."



// 4. Поменяйте `optionalName` на `nil`. Какое приветствие вы получите? Добавьте `else` условие, которое установит другое приветствие, если `optionalName` равно `nil`.
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}

optionalString = "Hello"
print(optionalString == nil)

optionalName = nil

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting += " My name is " + myName
}

greeting = optionalName ?? greeting



// 5. Попробуйте удалить блок `default`. Какую ошибку вы получите?
var vegetable = "red pepper"

switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
    
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
    
default:
    print("Everything tastes good in soup.")
}



// 6. Добавьте другую переменную, чтобы посмотреть, какое число самое большое, а также из какой последовательности будет это число.
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

var (largestNumber, keyName) = (0, String())

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
            keyName = kind
        }
    }
}

print("Collection \"\(keyName)\" contained largest number = \(largestNumber)")



// 7. Удалите аргумент `day`. Добавьте новый аргумент, чтобы вставить в привествие название специального блюда.
func greetDay(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greetDay("Bob", day: "Tuesday")

func greetDish(name: String, dish: String) -> String {
    return "Hello \(name), today our chef will cook for you \(dish)!!!"
}

print(greetDish("Bob", dish: "cauldron"))



// 8. Напишите функцию, которая бы считала среднее значение своих аргументов.
func calcAve(params: (Int, Double, Float)) -> Float {
    return (Float(Double(params.0) + params.1 + Double(params.2)) / 3)
}

print(calcAve((5, 6.6, 7.91)))



// 9. Перепишите замыкание так, чтобы оно вернуло ноль для всех нечетных чисел.
//var numbers = [20, 19, 7, 12]
//
//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    
//    return result
//})



// 10. Используя `let` добавьте неизменяемое свойство класса. Кроме того, создайте новый метод с одним входящим параметром.
class Shape {
    var numberOfSides = 0
    let angle = 90
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func anglesSum(angleCount: Int) -> Int {
        return self.angle * angleCount
    }
}

let shapeTest = Shape()
print(shapeTest.anglesSum(5))



// 11. Создайте еще один подкласс `NamedShape` под названием `Circle`. Он должен принимать значения `radius` и `name` в качестве входных аргументов для своей инициализации. Для класса `Circle` реализуйте методы `area()` и `simpleDescription()`.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    var radius: Float = 0
    
    init(name: String, radius: Float) {
        super.init(name: name)
        self.radius = radius
    }
    
    func area() -> Float {
        return 3.14 * self.radius * self.radius
    }
    
    override func simpleDescription() -> String {
        return "A circle don't have sides."
    }
}

var circleObject = Circle(name: "test circle", radius: 5.2)
print("circle area is \(circleObject.area())")



// 12. Напишите функцию, сравнивающую два `Rank` значения с помощью сравнения их исходных `(raw)` значений.
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
            
        case .Jack:
            return "jack"
            
        case .Queen:
            return "queen"
            
        case .King:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
    
    func compareWithCard(card: Rank) -> String {
        return self.rawValue > card.rawValue ? self.simpleDescription() : card.simpleDescription()
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

let card1 = Rank.Queen
let card2 = Rank.King

print("Which card over, \(card1) or \(card2)? - \(card1.compareWithCard(card2))")



// 13. Добавьте метод `color` для перечисления `Suit`, который должен возвращать `black` для `Spades` и `Clubs`; `red` для `Hearts` и `Diamonds`.
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
            
        case .Hearts:
            return "hearts"
            
        case .Diamonds:
            return "diamonds"
            
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
            
        case .Diamonds, .Hearts:
            return "red"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

print(Suit.Spades.color())
print(Suit.Hearts.color())
print(Suit.Clubs.color())
print(Suit.Diamonds.color())



// 14. Для структуры `Card` добавьте метод, который создаст полную колоду карт, с одной картой из каждой комбинации ранга (`rank`) и масти (`suit`).
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



// 15. Добавьте третий случай `case` в пречисление `ServerResponse` и в оператор `switch`.
enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    
case let .Failure(message):
    print("Failure...  \(message)")
}



// 16. Напишите перечисление, которое будет соответствовать этому протоколу.
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}



// 17. Напишите расширение для типа `Double`, которое добавляет свойство `absoluteValue`.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)



// 18. Поменяйте имя принтера на `Never Has Toner` так, чтобы функция `sendToPrinter(_:)` сгенерировала ошибку.
enum PrinterError: ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}

func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    
    return "Job sent"
}

do {
    let printerResponse = try sendToPrinter("Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}



// 19. Добавте код внутри блока `do`. Какого типа ошибка должна быть сгенерирована, чтобы она была обработана в первом `catch` блоке? А во втором? А в третьем?
do {
    let printerResponse = try sendToPrinter("Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}



// 20. Модифицируйте функцию `anyCommonElements(_:_:)` так, чтобы она возвращала массив из элементов, общих для обеих последовательностей.
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}

anyCommonElements([1, 2, 3], [3])
