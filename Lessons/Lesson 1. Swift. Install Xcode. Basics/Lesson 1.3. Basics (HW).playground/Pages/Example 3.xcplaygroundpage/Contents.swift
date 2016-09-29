/*:
 ### Example 3 (Пример 3)
 */
//:

import Foundation

// Константа
let x: Double = 5

// Переменная
var y: Int = 6

Int(x) + y
print(x)

// Объявление 2-х переменных через запятую в одну строку
var a = 2, b = 3
a + b
b - a
b / a
a % b

print("значение a = \(a)")



// Опциональные типы
var str = "123"

// Optionals
var intString =  Int(str)

// Нужно достать значение
if intString != nil {
    print("значение внутри \(intString!)")
}


// Простые типы данных
var f: Float = 2.0
var bo: Bool = true //false
var s: String = "hello"


// Списки = массивы
let immutableArray = [1, 2, 3]
var anotherArray = [String]()
var array: [String] = []


// Добавить элемент
array.append("first")
array.append("second")

// Удалить элемент
array.removeLast()
array = ["1", "2", "3"]

// Итерации по значениям массива
for string in array {
    print(string)
}

for (i, string) in array.enumerate() {
    print("\(i) — \(string)")
}

array[2] = "5"
print(array[2])



// Функции
func sayHello(name: String) -> String {
    return "привет, \(name)!"
}

sayHello("Сергей")



// Условные операторы
if x > 2 {
    print("больше 2")
} else {
    print("меньше либо равно 2")
}



// Switch case
switch y {
case 1..<5: // [1, 5)
    print("от одного до пяти")
    
case 5...10: // [5, 10]
    print("пять и выше")
    
case 7:
    print("семь")
    
default:
    print("другое число")
}

var language = "c++"

switch language {
// Зайти в case с новой константой lang при выполнении условия where
case let lang where lang.hasSuffix("++"):
    print(lang)
    
default:
    break
}
//:
/*:
 
 */
//: [Example 2](@previous) | [Home Work](@next)
