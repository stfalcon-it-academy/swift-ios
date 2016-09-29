/*: ## Methods (Методы) */
//:
/*: [Methods](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Methods.html#//apple_ref/doc/uid/TP40014097-CH15-ID234) */
/*: [Методы](http://swiftbook.ru/doc/methods) */


import Foundation


//: ### Методы

// Методы - это функции, которые связаны с определенным типом. 
// Классы, структуры и перечисления - все они могут определять методы экземпляра, которые включают в себя определенные задачи и функциональность для работы с экземпляром данного типа



//: ### Методы экземпляра

// Методы экземпляра являются функциями, которые принадлежат экземпляром конкретного класса, структуры или перечисления.
// Метод экземпляра имеет неявный доступ ко всем остальным методам экземпляра и свойствам этого типа:
class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()



//: ### Локальные и внешние имена методов

// Имя метода в Swift относится к первому параметру метода с использованием предлогов `with`, `for`, `b`

class Counter1 {
    var count: Int = 0
    
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter1 = Counter1()
counter1.incrementBy(5, numberOfTimes: 3)



//: ### Свойство self

// Используйте свойство `self` для ссылки на текущий экземпляр, внутри методов этого экземпляра.

// Пример использования `self` для разграничения параметра метода `x` и свойства экземпляра, которое тоже `x`:
struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOfX(1.0) {
    print("Эта точка находится справа от линии, где x == 1.0")
}



//: ### Изменение типа Value (Значение) методами экземпляра

// Структуры и перечисления являются типами Значение. По умолчанию, свойства типов Значение не могут быть изменены внутри методов экземпляра.

struct Point1 {
    // Для переменных выведен тип Значение, который не может быть изменен методами данной структуры
    var x = 0.0, y = 0.0
    
    // Ключевое слово mutating добавлено к определению метода для того, чтобы изменить значения свойств
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)

// Данный метод работает исключительно для переменных экземпляров `var`!
somePoint1.moveByX(2.0, y: 3.0)
print("Сейчас эта точка на (\(somePoint1.x), \(somePoint1.y))")



//: ### Присваивание значения для self внутри изменяющегося метода

// Изменяющиеся методы `mutating` могут присваивать полностью новый экземпляр неявному свойству `self`.

// Пример создания абсолютно новой структуры с присвоением свойствам `x`, `y` новых значений конечной точки:
struct Point2 {
    var x = 0.0, y = 0.0
    
    mutating func moveByX( deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

var point2 = Point2(x: 6, y: 5)

print("Значение point2 после создания = ", point2)
point2.moveByX(-1, y: 2)
print("Значение point2 после изменения = ", point2)


// Пример использования неявного `self` внутри изменяющегося метода для создания экземпляра перечисления:
enum TriStateSwitch {
    case Off, Low, High
   
    mutating func next() {
        switch self {
        case Off:
            self = Low
    
        case Low:
            self = High
        
        case High:
            self = Off
        }
    }
}

// Создать экземпляр перечисления с начальным значением
var ovenLight = TriStateSwitch.High

ovenLight.next()
ovenLight.next()



//: Методы типа

// В `Swift` можно определить методы, которые вызываются самим типом. Такие методы зовутся методами типа. 
// Индикатор такого метода - перед `func` указывается ключевое слово `class` для классов или `static` для стуктур и перечислений.

// Такие методы вызываются самим типом, а не его экземпляром:
class SomeClass {
    class func someTypeMethod(){
        // здесь идет реализация метода
        // внутри тела метода типа неявное свойство `self` ссылается на сам тип, а не на экземпляр этого типа
    }
}

SomeClass.someTypeMethod()


// 
struct LevelTracker {
    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
    
            return true
        } else {
            return false
        }
    }
}










