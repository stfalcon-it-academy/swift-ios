/*:
 ## Protocols and Extensions (Протоколы и расширения)
 */
//:
//: Используйте оператор `protocol` для объявления протокола.
//:
import Foundation

protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}
//:
//: Классы, перечисления и структуры могут соответствовать протоколам.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105

    func adjust() {
          simpleDescription += " Now 100% adjusted."
     }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"

    mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//:
/*:
 * experiment:
 Напишите перечисление, которое будет соответствовать этому протоколу.
 */
//:
//: Обратите внимание на использование ключевого слова `mutating` в объявлении `SimpleStructure`, оно обозначает метод который модифицирует структуру. Объявление `SimpleClass` не нуждается в `mutating` методах, так как методы класса всегда могут изменить класс.
//:
//: Используйте оператор `extension` (расширение) для того чтобы добавить новый функционал для существующего типа, такой как объявление новых методов и вычисляемых свойств. Вы можете использовать расширение для добавления совместимости с протоколом типу, который объявлен в другом месте, или даже типу, который вы импортировали из библиотеки или фреймворка:
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)
//:
/*:
 * experiment:
 Напишите расширение для типа *'Double'*, которое добавляет свойство *'absoluteValue'*.
 */
//:
//: Вы можете использовать имя протокола точно так же, как и другие именованные типы - например, чтобы создать коллекцию объектов, которые имеют разные типы, но все соответствуют одному протоколу. Когда вы работаете со значениями, чей тип - протокол, методы за пределами объявления протокола недоступны.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

// Раcкомментируйте строку, чтобы увидет ошибку
// print(protocolValue.anotherProperty)
//:
//: Несмотря на то, что переменная `protocolValue` имеет исполняемый тип `SimpleClass`, компилятор обрабатывает ее тип как присвоенный ему `ExampleProtocol`. Это означает, что вы не сможете случайно получить доступ к методам или свойствам, которые класс реализует в дополнение для соответствия протоколу.
//:
/*:
 
 */
//: [Enumerations and Structures](@previous) | [Error Handling](@next)
