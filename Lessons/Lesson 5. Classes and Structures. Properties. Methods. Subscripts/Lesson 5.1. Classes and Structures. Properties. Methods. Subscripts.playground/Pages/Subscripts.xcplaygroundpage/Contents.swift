/*: ## Subscripts (Индексы) */
//:
/*: [Subscripts](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Subscripts.html#//apple_ref/doc/uid/TP40014097-CH16-ID305) */
/*: [Индексы](http://swiftbook.ru/doc/subscripts) */


import Foundation
import UIKit


//:* ### Индексы

// Индексы позволяют запрашивать экземпляры определенного типа, написав одно или несколько значений в квадратных скобках после имени экземпляра.

// Классы, структуры и перечисления могут определять индексы, которые являются сокращенным вариантом доступа к члену коллекции, списка или последовательности.

// Вы можете использовать индекс для получения или установки нового значения элемента без разделения этих двух методов (получения значения и установки нового).



//: ### Индексный синтаксис

// Индексы могут быть read-write или read-only.

/*:
    subscript(index: Int) -> Int {
        get {
            // возвращает надлежащее значение скрипта
        }
 
        set(newValue) {
            // проводит надлежащие установки
        }
    }
 */

// Для нередактируемых (read-only) индексов слово `get` опускается:

/*:
    subscript(index: Int) -> Int {
        //возвращает надлежащее значение скрипта
    }
 */

// Пример вызова нередактируемого индекса структуры `TimeTable` для выполнения таблицы умножения `multiplier` * `index`:
struct  TimesTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("шесть умножить на три будет \(threeTimesTable[6])")



//: ### Использование индекса

// Обычно индексы используются в качестве сокращенного способа обращения к элементу коллекции, списка или последовательности.

// Например, в языке Swift словарь использует индекс для присваивания или получения значения, которое хранится в экземпляре Dictionary.
var numberOfLegs = ["паук": 8, "муравей": 6, "кошка": 4]
numberOfLegs["птичка"] = 2

// Пример сортировки словаря с использованием замыкания `sort`
print(numberOfLegs.sort{ $0 > $1 })



//: ### Опции индекса

// Индексы могут принимать любое количество входных параметров, и эти параметры могут быть любого типа. 
// Индексы так же могут возвращать любой тип.

// Определение множественных индексов так же известно как индексная перегрузка.

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    // Инициализатор принимает два параметра `rows` и `columns`
    init(rows: Int, columns: Int) {
        // Свойство `self` позволяет различать название свойства `rows` структуры от имени `rows` входного параметра
        self.rows = rows
        self.columns = columns
        
        // Создается массив типа `Double`, который имеет размер `rows` * `columns`
        // Каждой позиции в матрице задается начальное значение `0.0`
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) ->Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            // Утверждение используется для проверки валидности значений `row` и `column`
            assert(indexIsValidForRow(row, column: column), "Index is out of range")
    
            return grid[(row * columns) + column]
        }
        
        set {
            // Утверждение используется для проверки валидности значений `row` и `column`
            assert(indexIsValidForRow(row, column: column), "Index is out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
var matrixImageView1 = UIImage(named: "1")
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
matrixImageView1 = UIImage(named: "2")

// Пример работы утверждения для неправильных входных значений индекса:
// let someValue = matrix[2, 2]
















