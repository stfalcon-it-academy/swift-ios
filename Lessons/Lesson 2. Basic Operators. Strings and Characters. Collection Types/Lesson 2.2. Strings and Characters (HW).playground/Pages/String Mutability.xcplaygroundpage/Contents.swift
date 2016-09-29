/*: ## String Mutability (Изменчивость строк) */
//:
//: Чтобы указать, может ли конкретный `String` изменяться необходимо присвоить его переменной (в этом случае он может быть модифицирован) или константе (в этом случае он не может быть модифицирован):
//:
import Foundation

var variableString = "Horse"
variableString += " and carriage"
//:

/*
let constantString = "Highlander"
constantString += " and another Highlander"
// это выдаст ошибку компиляции: строковая константа не может быть модифицирована
*/
//:
/*:
 * note:
 Этот подход отличается от изменчивости строк в `Objective-C` и `Cocoa`, где мы выбираем между двумя классами (`NSString` и `NSMutableString`), чтобы указать, может ли строка быть изменена или нет.
 */
//:
/*: */
//: [Initializing an Empty String](@previous) | [Strings Are Value Types](@next)
