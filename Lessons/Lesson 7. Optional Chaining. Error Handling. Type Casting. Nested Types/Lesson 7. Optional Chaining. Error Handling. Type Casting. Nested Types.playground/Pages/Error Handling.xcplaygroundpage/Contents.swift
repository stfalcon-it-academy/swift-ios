/*: ## Error Handling (Обработка ошибок или Error-Handling) */
//:
/*: [Error Handling](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html#//apple_ref/doc/uid/TP40014097-CH42-ID508) */
/*: [Обработка ошибок или Error-Handling](http://swiftbook.ru/doc/error-handling) */


import Foundation


//: ### Error Handling (Обработка ошибок или Error-Handling)

// Обработка ошибок - это процесс реагирования на возникновение ошибок и восстановление после появления ошибок в программе.

// Опционалы используются для обозначения отсутствия значения, но когда случается сбой, важно понять, что вызвало сбой, для того, чтобы соответствующим образом изменить код.



//: ### Representing and Throwing Errors (Отображение и генерация ошибок)

// В Swift ошибки отображаются значениями типов, которые соответствуют протоколу ErrorType.

// Перечисления в Swift особенно хорошо подходят для группировки схожих между собой условий возникновения ошибок и соответствующих им значений, что позволяет получить дополнительную информацию о природе самой ошибке.

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

// Для генерации ошибок используется оператор `throw`. 
// Пример генерации ошибки с указанием того, что торговому автомату дополнительно нужны пять монет:
throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)



//: ### Handling Errors (Обработка ошибок)

// В Swift существует четыре способа обработки ошибок:
//    1. передача (propagate) ошибки из функции в код, который вызывает саму эту функцию
//    2. обработка ошибки, используя оператор do-catch
//    3. обработка ошибки как значение опционала
//    4. установка утверждения, что ошибка в данном случае исключена.




//: ### Propagating Errors Using Throwing Functions (Передача ошибки с помощью функции throw)

// Чтобы указать, что функция, метод или инициализатор могут генерировать ошибку, нужно написать ключевое слово `throws` после параметров.

// Позиция для покупки - цена + остаток
struct Item {
    var price: Int
    var count: Int
}

// Торговый аппарат
class VendingMachine {
    // Список закусок
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    // Хранимое свойство - сумма наличных
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    // Метод с генерацией ошибок - покупка закусок
    func vend(itemNamed name: String) throws {
        // Если запрашиваемая закуска не найдена в списке - генерируется ошибка
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        // Если запрашиваемой закуски нет в наличии - генерируется ошибка
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        // Если стоимость запрашиваемой закуски превышает наличные средства - генерируется ошибка
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        
        dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


//: ### Handling Errors Using Do-Catch (Обработка ошибок с использование do-catch)

/*:
 Используйте оператор do-catch для обработки ошибок, запуская блок кода. 
 Если выдается ошибка в коде условия do, оно соотносится с условием catch для определения того, кто именно сможет обработать ошибку.
 
 Вот общий вид условия do-catch:
 
    do {
        try expression
        statements
    } catch pattern 1 {
        statements 1
    } catch pattern 2 where condition {
        statements 2
    }
 */

// Пример
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Не достаточно средств. Пожалуйста внесите еще \(coinsNeeded) монет(ы).")
}



//: ### Converting Errors to Optional Values (Преобразование ошибок в опциональные значения)

// Вы можете использовать try? для обработки ошибки, преобразовав ее в опциональное значение. 
// Если ошибка генерируется при условии try?, то значение выражения вычисляется как nil.



//: ### Disabling Error Propagation (Запрет на передачу ошибок)

// let photo = try! loadImage("./Resources/John Appleseed.jpg")


//: ### Specifying Cleanup Actions (Установка действий по очистке (Cleanup))

// Оператор defer откладывает выполнение, пока не происходит выход из текущей области. 
// Оператор defer применяется для выполнения набора инструкций перед тем выходом из текущего блока кода.

/*:
    func processFile(filename: String) throws {
        if exists(filename) {
            let file = open(filename)
            
            defer {
                close(file)
            }
            
            while let line = try file.readline() {
                // работаем с файлом.
            }
            
            // close(file) вызывается здесь, в конце зоны видимости.
        }
    }
 */

