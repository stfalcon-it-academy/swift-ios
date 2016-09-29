/*:
 ## Error Handling (Обработка ошибок)
 */
//:
//: Вы отображаете ошибки, используя любой тип, который соответствует протоколу `ErrorType`.
//:
import Foundation

enum PrinterError: ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}
//:
//: Используйте ключевое слово `throw` для генерации ошибки и `throws` - для обозначения функции, которая генерирует ошибку. Если вы генерируете ошибку в функции, то она немедленно возвращается в то место кода, из которого она была вызвана для дальнейшей обработки этой ошибки.
//:
func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    
    return "Job sent"
}
//:
//: Есть несколько способов обработки ошибок. Один из них - использование блока `do-catch`. Внутри блока `do` при помощи ключевого слова `try` вы маркируете код, который может сгенерировать ошибку. Внутри блока `catch` ошибке автоматически присваивается имя `error`, хотя вы можете изменить его, указав любое другое.
//:
do {
    let printerResponse = try sendToPrinter("Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
//:
/*:
 * experiment:
 Поменяйте имя принтера на *"Never Has Toner"* так, чтобы функция `sendToPrinter(_:)` сгенерировала ошибку.
 */
//:
//: Вы можете использовать несколько блоков `catch` для обработки различных ошибок. Аналогично определению условного оператора `switch` укажите определенный шаблон после каждого оператора `catch`:
//:
do {
    let printerResponse = try sendToPrinter("Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
//:
/*:
 * experiment:
 Добавте код внутри блока `do`. Какого типа ошибка должна быть сгенерирована, чтобы она была обработана в первом `catch` блоке? А во втором? А в третьем?
 */
//:
//: Другим способом обработки ошибок является использование ключевого слова `try?`, которое позволяет преобразовать результат в опциональный тип. Если функция генерирует ошибку, специфическая ошибка отбрасывается и результат становится равным `nil`. В противном случае, функция в качестве результат возвращает опциональное значение.
//:
let printerSuccess = try? sendToPrinter("Mergenthaler")
let printerFailure = try? sendToPrinter("Never Has Toner")

//: Используйте ключевое слово `defer` для определения блока кода, который должен быть выполнен в последнюю очередь, непосредственно перед выходом из самой функции. Код в блоке `defer` выполняется независимо от того, генерируется в функции ошибка или нет. Вы можете использовать `defer` для настройки и очистки кода, расположив их рядом друг с другом, несмотря на то, что они могут быть выполнены в различное время.
//:
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(itemName: String) -> Bool {
    fridgeIsOpen = true
   
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(itemName)
    
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)
//:
/*:
 
 */
//: [Protocols and Extensions](@previous) | [Generics](@next)
