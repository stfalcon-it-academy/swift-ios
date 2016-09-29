/*: ## Accessing and Modifying a String (Доступ и изменение строки) */
//:
//: Вы получаете доступ и меняете строку через ее методы, свойства или при помощи синтаксиса сабскрипта.
//:
/*:
 
 */
//: ### String Indices (Индексы строки)
//:
//: Каждое `String` значение имеет связанный тип индекса: `String.Index`, что соответствует позиции каждого `Character` в строке.
//:
//: Как было упомянуто выше, различные символы могут требовать различные объемы памяти для хранения, поэтому для того, чтобы определить, какой `Character` в определенной позиции, необходимо итерировать каждую скалярную величину Юникода от начала и конца этой строки. По этой причине, `Swift` строки не могут быть проиндексированы целочисленными значениями.
//:
//: Используйте свойство `startIndex` для доступа к позиции первого `Character` в `String`. Свойство `endIndex` — это позиция после последнего символа в `String`. В результате, свойство `endIndex` не является допустимым аргументом для индекса строки. Если `String` пустая, то `startIndex` и `endIndex` равны.
//:
//: Значение `String.Index` может получить доступ к его предшествующему индексу, вызвав метод `predecessor()`, а также, его следующий индекс, вызвав метод `successor()`. Любой индекс в `String` может быть доступен из любого другого индекса, если объединить эти методы вместе или с помощью `advancedBy(_:)`. Попытка доступа к индексу за пределами диапазона строки будет инициировать сообщение об ошибке выполнения.
//:
//: Вы можете использовать синтаксис индекса для доступа `Character` в определенном индексе `String`.
//:
import Foundation

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]
//:
/*:
 Попытка доступа к `Character` в индексе за пределами диапазона строки выдаст сообщение об ошибке выполнения.
 
    greeting[greeting.endIndex]
    greeting.endIndex.successor()

 */
//:
//: Используйте свойство `indices` свойства `characters`, чтобы создать `Range` всех индексов, используемых для доступа к отдельным символам строки.
//:
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
//:
/*:
 
 */
//: ### Inserting and Removing (Добавление и удаление)
//:
//: Чтобы вставить символ в строку по указанному индексу, используйте метод `insert(_:atIndex:)`.
//:
var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
//:
//: Чтобы вставить содержимое другой строки по указанному индексу, используйте метод `insertContentsOf(_:at:)`.
//:
welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
//:
//: Чтобы удалить символ из строки по указанному индексу, используйте метод `removeAtIndex(_:)`.
//:
welcome.removeAtIndex(welcome.endIndex.predecessor())
//:
//: Чтобы удалить подстроку в указанном диапазоне, используйте метод `removeRange(_:)`:
//:
let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)
//:
//:
/*: */
//: [Counting Characters](@previous) | [Comparing Strings](@next)
