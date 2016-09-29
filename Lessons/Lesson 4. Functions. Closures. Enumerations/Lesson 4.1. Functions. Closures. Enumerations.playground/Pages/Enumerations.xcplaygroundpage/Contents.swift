/*: ## Enumerations (Перечисления) */
//:
/*: [Enumerations](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID145) */
/*: [Перечисления](http://swiftbook.ru/doc/enumerations) */
/*: [Swift: Enumerations](http://severe-programmer.com/swift-dokumentaciya/swift-enumerations-perechisleniya/) */
/*: [Enum](http://www.dotnetperls.com/enum-swift) */
/*: [Swift by example: enums](http://brettbukowski.github.io/SwiftExamples/examples/enums/) */

import Foundation


// Пример объявления перечисления
// Используйте ключевое слово `case` для включения нового члена перечисления
enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead1: CompassPoint = .West
var directionToHead2 = CompassPoint.East
directionToHead1 = .South


enum Size {
    case Small
    case Medium
    case Large
}

// Create a value of Size enum type.
let value = Size.Medium

// Test the value.
if value == .Medium {
    print(true)
}



// Множественные значения члена перечисления могут записываться в одну строку, разделяясь между собой запятой:
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

Planet.Earth



// Пример использования перечисления с оператором `switch`
// Оператор `switch` должен быть исчерпывающим, когда рассматриваются члены перечисления
switch directionToHead2 {
case .North:
    print("Lots of planets have a north")

case .South:
    print("Watch out for penguins")

case .East:
    print("Where the sun rises")

case .West:
    print("Where the skies are blue")
}


// Пример использования перечисления со связанными значениями
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

// Извлечение связанных значений как константы (`let`) или переменные (`var`) для использования внутри тела оператора `switch`
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")

case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

// Извлечение всех связанных значений как константы (`let`)
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")

case let .QRCode(productCode):
    print("QR code: \(productCode).")
}


enum Person {
    case Passport(number: Int)
    case DriverLicense(String, String)
}

var man1 = Person.Passport(number: 27369276349)
man1 = .DriverLicense("ufk123", "ttt98")

// Извлечение связанных значений в качестве переменной и 2-х констант:
switch man1 {
case .Passport(var id):
    id = 10000000 + id
    print(id)

case let .DriverLicense(part1, part2):
    print("1: \(part1) 2: \(part2)")
}



// Члены перечисления могут иметь начальные "исходные" значения, которые всегда типа `String` или `Int`
// Пример перечисления, члены которого хранят исходные значения ASCII
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet1: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// 4 + 5
let result = Planet1.Mars.rawValue + Planet1.Jupiter.rawValue



// Для доступа к исходному значению члена перечисления существует свойство `rawValue`:
let earthsOrder = Planet1.Earth.rawValue



// Пример инициализации перечисления через исходное значение
let possiblePlanet = Planet1(rawValue: 7)



// Пример использования привязки опционалов для инициализации через исходное значение
let positionToFind = 99

if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
   
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}



// Рекурсивное перечисление - перечисление, которое имеет другой экземпляр перечисления в качестве ассоциативного значения для одного или более членов перечисления.
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}


func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
        
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
        
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

// вычислим (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

print(evaluate(product))



// Пример использования перечисления в качестве входного параметра для функции
enum Importance {
    case Low, Medium, High
}

func process(i: Importance) {
    // Handle the enum argument in a func.
    if i == .Low || i == .Medium {
        print("Delay")
    }
    else {
        print("Immediate")
    }
}

// Call func with enum arguments.
process(Importance.Low)
process(Importance.Medium)
process(Importance.High)



// Пример использования перечисления
func getPerson() -> Person {
    return Person.Passport(number: 2342342)
}

if case .Passport(let id) = getPerson() {
    print(id)
}
