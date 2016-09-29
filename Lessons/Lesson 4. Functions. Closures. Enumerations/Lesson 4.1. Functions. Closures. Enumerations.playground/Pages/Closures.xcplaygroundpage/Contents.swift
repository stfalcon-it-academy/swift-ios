/*: ## Closures (Замыкания) */
//:
/*:  */

import Foundation


// Пример использования замыкания
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// Отдельная функция, сравнивающая 2 строки и возвращающая `true` / `false`
// `s1 > s2`: символ `s1` находится перед символом `s2` в алфавите
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

// Метод `sort()` имеет функциональный тип `(String, String) -> Bool`, аналогичный функции `backwards`
// Поэтому функция `backwards` выступает в качестве входного параметра для метода `sort()`
var reversed = names.sort(backwards)


//: ### Синтаксис замыкающего выражения
/*:
    { (параметры) -> тип результата in
        выражения (тело замыкания)
    }
 */
// Пример использования замыкающего выражения вместо функции `backwards`
reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})


//: ### Вывод типа из контекста
reversed = names.sort({ s1, s2 in return s1 > s2 })



//: ### Сокращенные имена параметров
reversed = names.sort({ $0 > $1 })



//: ### Операторные функции
reversed = names.sort( > )



//: ## Последующее замыкание
// Последующее замыкание - замыкание, которое записано в виде замыкающего выражения вне (и после) круглых скобок вызова функции, которое она содержит
reversed = names.sort{ $0 > $1 }


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    
    return output
}




//: ## Захват значений
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount // runningTotal is a reference, amount is a copy
        
        return runningTotal
    }
    
    return incrementor
}

var incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

var incrementByEleven = makeIncrementer(forIncrement: 11)
incrementByEleven()
incrementByEleven()
incrementByTen()

var alsoIncrementByTen = incrementByTen
alsoIncrementByTen()




//: ## Не сбегающие замыкания







// Пример использования замыкания без параметров
var sayHello = {
    print("1. Hello world")
}

sayHello()


// Пример использования замыкания с параметрами
var sayHelloName = { (name: String) -> String in
    return "2. Hello, \(name)"
}

print(sayHelloName("Sergey"))

var sayHelloOnly: () -> Void

sayHelloOnly = {
    "Hello"
}

var sayHello2 = { (name: String) -> String in
    return "Hello \(name)"
}

func calculate(a: Int, _ b: Int, _ calculateOperator: (firstNum: Int, secondNum: Int) -> (Int)) -> Int {
    return calculateOperator(firstNum: a, secondNum: b)
}

var addition = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

calculate(2, 3, addition)


func someFunction(closure: () -> Void) {
    //некоторые выражения функции
}

// обычный способ
someFunction() {
    //много строк выражения замыкания
}

// последующее замыкание
someFunction() {
    //много строк выражения замыкания
}

func repeatTask(times: Int, closure: () -> Void) {
    for _ in 1...times {
        closure()
    }
}

repeatTask(3) {
    print("Внимание!")
}



/*: [Замыкания](http://metanit.com/swift/tutorial/2.18.php) */
// Пример использования замыкания
// Функция в качестве 3-го параметра принимает другую функцию, которая возвращает идентичное значение с типом `Int`
func getBinaryResult(a: Int, _ b: Int, _ binaryFunc: (Int, Int) -> Int) -> Int {
    return binaryFunc(a, b)
}

var x: Int = 10
var y: Int = 12

var result1 = getBinaryResult(x, y, {(a: Int, b: Int) -> Int in
    return a + b
})

print(result1)

var result2 = getBinaryResult(x, y, {(a: Int, b: Int) -> Int in return a - b})

print(result2)

let result3 = getBinaryResult(x, y) { $0 == $1 ? 100 : 11 }
print(result3)



// Замыкания как константы и переменные
typealias ClosureTest = (Int, Int) -> Int

let myClosure: ClosureTest = {(a, b) in (a + b) * (a - b)}
var num = myClosure(-13, 5)



// Захват значений
// Замыкающие выражения обладают способностью сохранять начальные значения переданных в них переменных
var a1: Int = 14
var b1: Int = 2

// Передав переменные в квадратные скобки: [a, b], мы тем самым фиксируем их начальные значения
let myClosure1: () -> Int = {[a1, b1] in return a1 + b1}
var num1 = myClosure1()

a1 = 5
b1 = 6
var num2 = myClosure1()







