/*: ## Extensions. Example 1 (Расширения. Пример 1) */
//:
/*: [SWIFT - 24. Расширения](https://www.youtube.com/watch?v=QTR88g1ODUI) */


import Foundation


// Расширения не могут:
//     1. переопределять существующие методы
//     2. создавать Stored properties (хранимые свойства)


// Пример 1
extension Int {
    // Проверяем исходное целое число на четность
    var isEven: Bool {
        return self % 2 == 0
    }
    
    // Проверяем исходное целое число на нечетность
    var isOdd: Bool {
        return !isEven
    }
    
    // Вложенное перечисление
    enum EvenOrOdd {
        case Even
        case Odd
    }
    
    // Вычисляемое свойство с типом Перечисление
    var evenOrOdd: EvenOrOdd {
        return isEven ? .Even : .Odd
    }
    
    // Метод возведения числа в заданную степень без изменения самого числа
    func pow(value: Int) -> Int {
        var temp = self
        
        for _ in 1..<value {
            temp *= self
        }
        
        return temp
    }
    
    // Метод возведения числа в заданную степень с изменением самого числа
    mutating func powTo(value: Int) {
        self = pow(value)
    }
    
    var binaryString: String {
        var result = ""
        
        for i in 0..<8 {
            result = String(self & (1 << i) > 0) + result
        }
        
        return result
    }
    
}

extension String {
    init(_ value: Bool) {
        self.init(value ? 1 : 0)
    }
    
    subscript(start: Int, length: Int) -> String {
        let start = self.startIndex.advancedBy(start)
        let end = self.startIndex.advancedBy(length)
        let range = Range(start: start, end: end)
        
        return self[range]
    }
}

// Расширение для вложенного перечисления расширения типа `Int`
extension Int.EvenOrOdd {
    var string: String {
        switch self {
        case .Even: return "Even"
            
        case .Odd: return "Odd"
        }
    }
}


var a = 5

// Пример проверки числа на нечетность
if a % 2 != 0 {
    print("a")
}

// То же самое с использованием расширения для типа `Int`:
if a.isOdd {
    print("a = \(a) is Odd.")
}

// Пример использования расширения типа `Int` с вложенным перечислением:
a.evenOrOdd

// Пример использования расширения типа `Int` с расширением для вложенного перечисления:
a.evenOrOdd.string

// Пример использования метода без изменения самого числа из расширения типа `Int`:
a.pow(4)

// Пример использования метода с изменением самого числа из расширения типа `Int`:
a.powTo(4)


a = 5
a.binaryString

let s = "Hello, World!"
//s[0...7] = "aaa"
