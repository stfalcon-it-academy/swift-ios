/*: ## Examples. Assignment Operator (Примеры. Оператор присваивания) */
//:
import Foundation

/*: *Пример использования оператора присваивания* */
let b = 2
var a = 1 + b

// Updating Values
a = 39
//:
/*: *Пример использования оператора присваивания* */
let fromAmount = 100
let fxRate = 23.21789635418
let toAmount = (Double)(fromAmount) * fxRate

print("Constant-1 \"toAmount\" is \(toAmount)")
print(String.localizedStringWithFormat("Constant-2 \"toAmount\" is %0.4f", toAmount))
//:
/*: *Пример использования элементов кортежа в операторе присваивания* */
let (position, salary) = ("Project Manager", 121_000)
print("Current position is \"\(position)\"", "\nSalary is \(salary)")
//:
/*: *Пример использования элементов кортежа в операторе присваивания* */
let e = (6.1, 7, 8)
let (_, _, f) = e

print(f, "\n\(e.0)")
//:
/*: */
//: [Assignment Operator](@previous) | [Arithmetic Operators](@next)
