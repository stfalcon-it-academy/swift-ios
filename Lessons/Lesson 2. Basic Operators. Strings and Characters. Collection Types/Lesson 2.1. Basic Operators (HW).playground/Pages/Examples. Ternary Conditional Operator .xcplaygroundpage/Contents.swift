/*: ## Examples. Ternary Conditional Operator (Примеры. Тернарный условный оператор) */
//:

import Foundation

/*: *Пример использования тернарного условного оператора* */
let initialMessage = "Hello John! "
let dateOfJoining = 2004
let finalMessage = initialMessage + (dateOfJoining == 2004 ? "Congratulations on Completing 10 Years" : "You have a couple of years to complete a decade with xyz corp")

print ("finalMessage = \(finalMessage)")


/*: *Пример использования тернарного условного оператора* */
let a = 5
print(a == 5 ? "We're good" : "Oops, not quite")
//:
/*: */
//: [Ternary Conditional Operator](@previous) | [Nil Coalescing Operator](@next)
