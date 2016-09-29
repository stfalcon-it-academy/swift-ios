/*: ## Examples. Comparison Operators (Примеры. Операторы сравнения) */
//:

import Foundation

/*: *Пример использования составных операторов сравнения* */
let distance1 = 10.43
let distance2 = 12.32

print("1. distance1 == distance2 - \(distance1 == distance2)")
print("2. distance1 != distance2 - \(distance1 != distance2)")
print("3. distance1 > distance2 - \(distance1 > distance2)")
print("4. distance1 < distance2 - \(distance1 < distance2)")
print("5. distance1 >= distance2 - \(distance1 >= distance2)")
print("6. distance1 <= distance2 - \(distance1 <= distance2)")

let message1 = "Hello World"
let message2 = "Hello World"

print("7. message1 == message2 - \(message1 == message2)")
print("8. message1 != message2 - \(message1 != message2)")
//:
/*: *Пример использования составных операторов сравнения для объектов* */
let testString1 = NSString(string: message1 + "!")
let testString2 = NSString(string: message2)

print("9. testString1 === testString2 - \(testString1 === testString2)")
print("10. testString1 !== testString2 - \(testString1 !== testString2)")
//:
/*: */
//: [Comparison Operators](@previous) | [Ternary Conditional Operator](@next)
