/*: ## Initializing an Empty String (Инициализация пустых строк) */
//:
//: Чтобы создать пустое `String` значение в качестве отправной точки для создания более длинных строк, либо присвойте литерал пустой строки к переменной либо инициализируйте объект `String` c помощью синтаксиса инициализации:
//:
import Foundation

// empty string literal
var emptyString = ""

// initializer syntax
var anotherEmptyString = String()
//:
//: Через `Boolean` свойство `isEmpty` можно узнать имеет ли переменная с типом `String` пустое значение:
//:
if emptyString.isEmpty {
    print("Nothing to see here", terminator:"")
    print("Hello")
}
//:
/*: */
//: [Examples. String Literals](@previous) | [String Mutability](@next)
