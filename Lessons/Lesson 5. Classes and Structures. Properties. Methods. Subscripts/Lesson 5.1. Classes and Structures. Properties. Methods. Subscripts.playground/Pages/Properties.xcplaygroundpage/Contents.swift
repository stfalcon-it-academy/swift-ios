/*: ## Properties (Свойства) */
//:
/*: [Properties](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID254) */
/*: [Свойства](http://swiftbook.ru/doc/properties) */


import Foundation


//: ### Свойства хранения

// Свойство хранения - константа или переменная, которая хранится как часть экземпляра определенного класса или структуры
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6




//: ### Свойства хранения неизменяемых экземпляров структуры

// Если вы создаете экземпляр структуры и присваиваете его константе, то вы не можете модифицировать его свойства, даже если они объявлены как переменные

//Когда экземпляр `типа Значение` отмечен как константа, то все его свойства так же считаются константами:
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 // error

// Такое поведение не применимо к классам, так как они являются ссылочным типом. 
// Если вы присваиваете экземпляр `типа Ссылка` константе, то он все еще может менять переменные свойства.



//: ### Свойства ленивого хранения

// Свойство ленивого хранения - свойство, начальное значение которого не рассчитывается до первого использования. 
// Индикатор ленивого свойства - ключевое слово lazy.
class DataImporter {
    /*DataImporter - класс для импорта данных с внешних источников
     Считаем, что классу требуется большое количество времени для инициализации
     */
    var fileName = "data.txt"
    //класс DataImporter функционал данных будет описан тут
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    //класс DataManager обеспечит необходимую функциональность тут
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

// Так как он создан как `lazy` модификатор, экземпляр `DataImporter` для свойства `importer` создается только тогда, когда впервые к нему обращаются, например когда запрашивается свойство `fileName`:
print(manager.importer.fileName)
manager



//: ### Вычисляемые свойства

// Вычисляемые свойства не хранят значения. 
// Вместо этого они предоставляют `get` (геттер) и опциональный `set` (сеттер) для получения и установки других свойств косвенно
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    // Хранимые свойства
    var origin = Point()
    var size = Size()
    
    // Вычисляемое свойство
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

// Вызывается `get` для вычисляемого свойства `center` с целью получить значения из хранимых свойств
let initialSquareCenter = square.center

// Вызывается `set` для вычисляемого свойства `center` с целью установить новые значения для хранимых свойств
square.center = Point(x: 15.0, y: 15.0)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")



//: ### Сокращенный вариант объявления сеттера

// Если сеттер высчитываемого свойства не определяет имени для нового значения, то используется имя по умолчанию `newValue`:
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
        
            return Point(x: centerX, y: centerY)
        }
    
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var alt = AlternativeRect(origin: Point(x: 9, y: 10), size: Size(width: 12, height: 11))
let cc = alt.center
alt.center = Point(x: 3, y: 4)


//: ### Вычисляемые свойства только для чтения

// Вычисляемое свойство имеющее `get` (геттер), но не имеющее `set` (сеттера) известно так же как вычисляемое свойство только для чтения

// Вы можете упростить объявление вычисляемых свойств только для чтения, удаляя ключевое слово get и его скобки:
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0

    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")



//: ### Наблюдатели свойства

// Наблюдатели свойства наблюдают и реагируют на изменения значения свойства. 
// Наблюдатели свойства вызываются каждый раз, как присваивается новое значение свойству, даже если новое значение такое же как и старое

// `willSet` вызывается прямо перед сохранением значения
// `didSet` вызывается сразу после сохранения значения

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// Если вы присваиваете значение свойству внутри наблюдатель didSet, то новое значение заменит то, которое было только что установлено



//: ### Глобальные и локальные переменные

// Глобальные переменные - переменные которые объявляются снаружи любой функции, метода, замыкания или контекста типа. 
// Локальные переменные - переменные, которые объявляются внутри функции, метода или внутри контекста замыкания.



//: ### Тип Свойства

struct SomeStructure {
    static var storedTypeProperty = "Some value."

    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."

    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 27
    }
 
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}



//: ### Запросы и установка свойств типа

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)




