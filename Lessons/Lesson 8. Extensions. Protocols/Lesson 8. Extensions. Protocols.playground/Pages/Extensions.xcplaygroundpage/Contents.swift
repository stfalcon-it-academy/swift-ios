/*: ## Extensions (Расширения) */
//:
/*: [Extensions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html#//apple_ref/doc/uid/TP40014097-CH24-ID151) */
/*: [Расширения](http://swiftbook.ru/doc/extensions) */


import Foundation


//: ### Extensions (Расширения)

// Расширения добавляют новую функциональность существующему типу класса, структуры или перечисления.

/*:
 Расширения в Swift могут:
 
 * Добавлять вычисляемые свойства и вычисляемые static свойства
 * Определять методы экземпляра и методы типа
 * Предоставлять новые инициализаторы
 * Определять сабскрипты
 * Определять новые вложенные типы
 * Обеспечить соответствие существующего типа протоколу
 */



//: ### Extension Syntax (Синтаксис расширений)

// Расширение объявляется с помощью ключевого слова `extension`.
/*:
 Расширение может расширить существующий тип для того, чтобы он соответствовал одному или более протоколам.

     extension SomeType: SomeProtocol, AnotherProtocol {
        // реализация требования протокола тут
     }
 */



//: ### Computed Properties (Вычисляемые свойства в расширениях)

// Расширения могут добавлять вычисляемые свойства экземпляра и вычисляемые свойства типа к существующим типам.
// Расширения не могут добавить хранимые свойства или наблюдателей к уже существующим свойствам!!!

// Пример добавления пяти вычисляемых свойств экземпляра во встроенный тип `Double` языка `Swift`:
extension Double {
    // Вычисляемые свойства только для чтения (можно без ключевого слова `get`)
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("Один дюйм - это \(oneInch) метра")

let threeFeet = 3.ft
print("Три фута - это \(threeFeet) метра")

let oneMeter = 1.m
print("Один метр - это \(oneMeter) метра")


let aMarathon = 42.km + 195.m
print("Марафон имеет длину \(aMarathon) метров")



//: ### Initializers (Инициализаторы в расширениях)

// Расширения могут добавить новые инициализаторы к существующему типу.

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

// Пример использования инициализатора по умолчанию и почленного инициализатора, созданных автоматически:
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

// Пример создания дополнительного инициализатора, который принимает определенную точку и размер:
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// Каждый экземпляр должен быть полностью инициализирован, когда инициализатор заканчивает свою работу:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))



//: ### Methods (Методы в расширениях)

// Расширения могут добавить новые методы экземпляра или методы типа к уже существующим типам. 

// Пример создания нового метода экземпляра `repetitions` к типу `Int`:

extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

// Использование замыкания
3.repetitions { print("Вкусно!") }



//: ### Mutating Instance Methods (Изменяющиеся методы экземпляра)

// Методы структуры и перечисления, которые изменяют `self` или его свойства, должны быть отмечены как `mutating`.

// Пример создания нового изменяющего (mutating) метода `square` для типа `Int`, который возводит в квадрат исходное значение:
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()



//: ### Subscripts (Сабскрипты в расширениях)

// Расширения могут добавить новые сабскрипты к существующему типу. 

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]
746381295[9]



//: ### Nested Types (Вложенные типы в расширениях)

// Расширения могут добавлять новые вложенные типы к существующим классам, структурам и перечислениям:

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
    
        case let x where x > 0:
            return .Positive
        
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
       
        case .Zero:
            print("0 ", terminator: "")
        
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    
    print("\n")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])



