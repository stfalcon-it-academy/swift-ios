/*: ## Working with Characters (Работа с символами) */
//:
//: В языке `Swift` тип `String` представляет собой упорядоченную коллекцию значений `Character`. В строке вы можете получить доступ к отдельным значениям `Character` при помощи итераций в цикле `for-in`:
//:
import Foundation

for character in "Dog!🐶".characters {
    print(character)
}
//:
//: Более подробно цикл `for-in` мы рассмотрим на уроке `For-In циклы`.
//:
//: Кроме того, можно создать отдельную `Character` константу или переменную из односимвольного строкового литерала с помощью присвоения типа `Character`:
//:
let exclamationMark: Character = "!"
//:
//: Значения типа `String` могут быть созданы путем передачи массива типа `[Character]` в инициализатор:
//:
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)

print(catString)
//:
/*: */
//: [Strings Are Value Types](@previous) | [Concatenating Strings and Characters](@next)
