/*: ## Concatenating Strings and Characters (Конкатенация строк и символов) */
//:
//: Значения типа `String` могут быть добавлены или конкатенированы с помощью оператора сложения (`+`):
//:
import Foundation

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//:
//: Вы можете добавить значение типа `String` к другому, уже существующему значению `String` при помощи комбинированного оператора сложения и присвоения (`+=`):
//:
var instruction = "look over"
instruction += string2
//:
//: Вы можете добавить значение типа `Character` к переменной типа `String`, используя метод `append()` типа `String`:
//:
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

var url = "http://www.website.com"
let index = url.startIndex.advancedBy(4)
url.insert("s", atIndex: index)
//:
/*:
 * note:
 Вы не можете добавить `String` или `Character` к уже существующей переменной типа `Character`, поскольку значение типа `Character` должно состоять только из одиночного символа.
 */
//:
/*: */
//: [Working with Characters](@previous) | [String Interpolation](@next)
