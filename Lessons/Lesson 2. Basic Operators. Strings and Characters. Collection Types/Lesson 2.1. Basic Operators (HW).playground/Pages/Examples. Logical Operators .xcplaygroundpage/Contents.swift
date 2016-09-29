/*: ## Examples. Logical Operators (Примеры. Логические операторы) */
//:

import Foundation

/*: *Пример использования логического оператора И (&&)* */
let x = true

let y = false

let a = x && y
//:
/*: *Примеры использования логического оператора ИЛИ (||)* */
let b = x || y

if (3 > 2 || 2 > 3){
    print("One condition is true here and thus the result is true")
}

if (2 > 3 || 3 > 4){
    print("this should not get executed")
} else {
    print("both the coditions are false")
}
//:
/*: *Пример использования логического оператора ОТРИЦАНИЕ (!)* */
let c = !x
//:
/*: *Пример комбинирования логических операторов* */
let hasAdminAccess = false
let hasSuperUserAccess = false
let hasAccessToStatedScreen = true
let hasApplicationAccess = true

if hasApplicationAccess && hasAccessToStatedScreen || hasAdminAccess || hasSuperUserAccess {
    print("the user can log in to the application and access the stated screen")
} else {
    print("the user should not be allowed access")
}
//:
/*: *Пример комбинирования логических операторов с использованием группирования* */
if (hasApplicationAccess && hasAccessToStatedScreen) || hasAdminAccess || hasSuperUserAccess {
    print("the user can log in to the application and access the stated screen")
} else {
    print("the user should not be allowed access")
}
//:
/*: */
//: [Logical Operators](@previous) | [Home Work](@next)
