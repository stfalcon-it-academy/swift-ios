import Foundation
import UIKit


// 1.1. Создайте словарь аналог журнала студентов, где имя и фамилия студента - ключ, а оценка - контрольное значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
var journal = ["Иванов Андрей" : 5, "Сидоров Иван" : 4, "Петров Максим" : 3, "Завьялова Ольга" : 5]
journal["Петров Максим"] = 4
journal["Завьялова Ольга"] = 5
journal.removeValueForKey("Иванов Андрей")


// 1.2. После всех этих перетрубаций посчитайте общий и средний баллы группы.
var totalScore = 0

for student in journal {
    totalScore += student.1
}

print("1. The total score of the students group = \(totalScore)")
print("2. The average score of the students group = \(totalScore / journal.count)")

print("************************************************\n")


// 1.3. Создайте словарь "дни в месяцах", где месяц - это ключ, а количество дней - значение.
let daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let dateFormatter: NSDateFormatter = NSDateFormatter()
let months = dateFormatter.standaloneMonthSymbols
var monthDays = [String : Int]()

for index in 0..<daysInMonth.count {
    monthDays [months[index]] = daysInMonth[index]
}

print("  3. Dictionary days in month = \(monthDays)")
print("  ************************************************\n")


// 1.4. В цикле выведите ключ-значение попарно.
// 1.4.1. Вариант 1 - используйте `Tuples`.
for (index, month) in monthDays.enumerate() {
    print("    \(index + 1). \(month.0) - \(month.1)")
}

print("    *******************\n")


// 1.4.2. Вариант 2 - пройдитесь по массиву ключей и для каждого из них достаньте его значение.
let monthKeys = monthDays.keys

for (index, key) in monthKeys.enumerate() {
    print("      \(index + 1). For key \"\(key)\" value is \(monthDays[key]!) days")
}

print("      ****************************************\n")


// 1.5. Создайте словарь, в котором ключ - это адрес шахматной клетки (пример: `a5`, `b3`, `g8`), а значение - это `Bool`. Белый цвет -  `true`, а если черный - `false`. Выведите словарь в консоль и убедитесь, что все правильно.
// Рекомендация: постарайтесь все сделать, используя вложенный цикл.
let horizontal = ["a", "b", "c", "d", "e", "f", "g", "h"]
let vertical = ["1", "2", "3", "4", "5", "6", "7", "8"]
let chessBoardView = UIImage(named: "chess-board.jpg")

var chessBoard = [String : Bool]()

for (indexHrz, valueHrz) in horizontal.enumerate() {
    for (indexVer, valueVer) in vertical.enumerate() {
        let cellColor: Bool
        
        switch indexHrz {
        case indexHrz where (indexHrz + 1) % 2 != 0:
            cellColor = ((indexVer + 1) % 2 != 0) ? false : true
            
        case indexHrz where (indexHrz + 1) % 2 == 0:
            cellColor = ((indexVer + 1) % 2 != 0) ? true : false
            
        default:
            cellColor = false
        }

        chessBoard[valueHrz + valueVer] = cellColor
    }
}

print("chessBoard = \(chessBoard)")



// 2.1. Сохраните в словаре проценты для рейтинга, начиная с 10% для первого элемента и увеличивая его на 5% для каждого следующего из 4-х возможных.
// См. в домашке по массивам


// 2.2. Используя материалы из предыдущего ДЗ по массивам расставьте рейтинги ресторанам по итоговой сумме в счете.
// См. в домашке по массивам
