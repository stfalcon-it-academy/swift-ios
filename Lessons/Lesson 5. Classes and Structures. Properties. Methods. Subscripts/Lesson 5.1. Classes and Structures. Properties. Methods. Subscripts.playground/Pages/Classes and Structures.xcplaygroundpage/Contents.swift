/*: ## Classes and Structures (Классы и структуры) */
//:
/*: [Classes and Structures](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82) */
/*: [Классы и структуры](http://swiftbook.ru/doc/classes-and-structures) */


import Foundation

// В Swift, вы объявляете структуру или класс в одном файле, и внешний интерфейс автоматически становится доступным для использования в другом коде

// Термин `экземпляр` одновременно относится к экземплярам и класса, и структуры



//: ### Синтаксис объявления

class SomeClass {
    // объявление класса будет здесь
}

struct SomeStructure {
    // объявление структуры будет здесь
}


// Пример определения структуры и класса:
struct Resolution {
    // Хранимые свойства
    var width = 0
    var height = 0
}

class VideoMode {
    // Хранимые свойства
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}



//: ### Экземпляры класса и структуры

// Пример синтаксиса для создания экземпляра структуры и класса:
let someResolution = Resolution()
let someVideoMode = VideoMode()



//: ### Доступ к свойствам

// Для доступа к свойствам `экземпляра` используя точечный синтаксис:
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")


// Пример использования точечного синтаксиса для присваивания нового значения свойству:
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")



//: ### Поэлементные инициализаторы структурных типов

// Структуры имеют автоматически генерированный `поэлементный инициализатор`:
let vga = Resolution(width: 640, height: 480)



//: ### Структуры и перечисления - типы значения

// Тип значения - это тип, значение которого копируется, когда оно присваивается константе или переменной, или когда передается функции

let hd = Resolution(width: 1920, height: 1080)

// При инициализации переменной `cinema` она копирует начальные значения из структуры `hd`
// Изменение значений в экземпляре `cinema` никак не отражается на экземпляре `hd`
var cinema = hd
cinema.width = 2048



//: ### Классы - ссылочный тип

// В отличии от типа значений, ссылочный тип не копируется, когда его присваивают переменной или константе, или когда его передают функции. 
// Вместо копирования используется ссылка на существующий экземпляр.

// Пример использования класса `VideoMode` для создания константы `tenEighty`:
let tenEighty = VideoMode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// Создадим константу-ссылку на класс `VideoMode` и изменим свойство `frameRate`:
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")



//: ### Операторы тождественности

// Иногда бывает полезно выяснить ссылаются ли две константы или переменные на один и тот же экземпляр класса. Для проверки этого в Swift есть два оператора тождественности:

// Идентичен (===)
// Не идентичен ( !== )

// Пример использования операторов сравнения для проверки ссылаются ли две константы или оператора на один и тот же экземпляр класса:
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
