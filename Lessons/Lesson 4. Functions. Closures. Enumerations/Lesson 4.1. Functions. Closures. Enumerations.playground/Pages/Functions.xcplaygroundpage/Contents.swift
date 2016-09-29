/*: ## Functions (Функции) */
//:
/*: [Functions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158) */
/*: [Функции](http://swiftbook.ru/doc/functions) */
/*: [Swift: Functions](http://severe-programmer.com/swift-dokumentaciya/swift-functions-funkcii/) */
/*: [Func](http://www.dotnetperls.com/func-swift) */
/*: [Swift by example: functions](http://brettbukowski.github.io/SwiftExamples/examples/functions/) */

import Foundation

/*
 Каждая функция в Swift имеет тип, описывающий тип параметров функции и тип возвращаемого значения. 
 Тип функции можно использовать аналогично любым другим типам в Swift, 
 т.е. одна функция может быть параметром другой функции либо ее результирующим значением. 
 Функции также могут вкладываться друг в друга, что позволяет инкапсулировать определенный алгоритм внутри локального контекста.
 */


// Пример объявления и вызова функции
func sayHello(personName: String) -> String {
    return "Hello again, " + personName + "!"
}

print(sayHello("Anna"))
print(sayHello("Brian"))



// Пример использования функции с несколькими входными параметрами
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

print(halfOpenRangeLength(1, end: 10))



// Пример использования функции без параметров
// Обратите внимание, что несмотря на отсутствие параметров, в объявлении функции все равно нужно ставить скобки после имени. 
// При вызове после имени функции также указываются пустые скобки.
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())



// Пример использования функции, которая не возвращает значения
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}

sayGoodbye("Dave")



// Пример использования функции, выходное значение которой может быть игнорировано:
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    
    return stringToPrint.characters.count
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("hello, world")
printWithoutCounting("hello, world")



// Пример использования функции, возвращающей несколько значений
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
 
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("1. min is \(bounds.min) and max is \(bounds.max)")



// Пример использования функции, возвращающей кортеж-опционал в качестве результата
// Кортеж-опционал вида (Int, Int)? это не то же самое, что кортеж, содержащий опционалы: (Int?, Int?). Кортеж-опционал сам является опционалом, но не обязан состоять из опциональных значений.
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

// Чтобы проверить, возвращает ли функция minMax1 фактическое значение кортежа или nil, можно использовать привязку опционала:
if let bounds = minMax1([8, -6, 2, 109, 3, 71]) {
    print("2. min is \(bounds.min) and max is \(bounds.max)")
}



// Пример использования функции с объявлением внешних имен для каждого входного параметра
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: ", ")



// Пример использования функции с параметрами, значения которых заданы по умолчанию
// Параметры со значениями по умолчанию лучше всего указывать в конце списка параметров функции
func join_2(string s1: String, toString s2: String, withJoiner joiner: String = ", ") -> String {
    return s1 + joiner + s2
}

join_2(string: "hello", toString: "world", withJoiner: "-")
join_2(string: "hello", toString: "world")



// Пример использования функции с параметрами, значения которых заданы по умолчанию и не указаны внешние имена
// Для удобства язык Swift автоматически присваивает внешние имена всем параметрам, имеющим значения по умолчанию. 
// Автоматически созданное внешнее имя совпадает с локальным именем.
func join_3(s1: String, _ s2: String, joiner: String = ", ") -> String {
    return s1 + joiner + s2
}

join_3("Hello", "world!")
join_3("Hello", "world!", joiner: " ")


// Пример использования функции c вариативными параметрами
// У функции может быть только один вариативный параметр.
// Если у функции, помимо вариативного параметра, есть еще один или несколько параметров со значениями по умолчанию, 
// то вариативный параметр нужно ставить после них в самом конце списка.
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers {
        total += number
    }
   
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)


// Пример использования функции со сквозными параметрами
// Сквозной параметр передает значение в функцию, которое затем изменяется в ней и возвращается из функции, заменяя исходное значение.
// Сквозные параметры не могут иметь значения по умолчанию, а вариативные параметры не могут быть сквозными, с ключевым словом inout. 
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")



// Пример использования функциональных типов
// Функциональный тип (Int, Int) -> Int
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

// Функциональный тип (Int, Int) -> Int
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

// Функциональный тип (Void) -> Void или () -> ()
func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result add: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result multiply: \(mathFunction(2, 3))")


// Как и для любого другого типа в Swift, тип функции, присвоенной константе или переменной, проверяется автоматически:
let anotherMathFunction = addTwoInts



// Пример использоания функциональных типов как типы параметров
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 7, 5)



// Пример использования функциональных типов как возвращаемые типы
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
var moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

print("Zero!")



// Пример использования вложенных функций
// Вложенные функции по умолчанию недоступны извне, а вызываются и используются только родительской функцией. 
// Родительская функция может также возвращать одну из вложенных, чтобы вложенную функцию можно было использовать за ее пределами.
func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backwards ? stepBackward : stepForward
}

currentValue = -4
moveNearerToZero = chooseStepFunction(currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")
