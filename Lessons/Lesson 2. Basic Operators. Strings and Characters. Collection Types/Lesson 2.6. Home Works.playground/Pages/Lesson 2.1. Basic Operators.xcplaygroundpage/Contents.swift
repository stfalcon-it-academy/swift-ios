import Foundation
import UIKit

// 1.1. Посчитайте количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)
let currentYear = 2016
let isCurrentYearLeap = (currentYear % 4 == 0) ? true : false

typealias Birthday = (day: Int, month: Int)
let daysInFebruary = isCurrentYearLeap ? 29 : 28

func calculateSeconds(birthday: Birthday) -> Int {
    var hoursCount = 0
    
    for month in 1...birthday.month {
        hoursCount += (month == 3 && birthday.day >= 27) ? 1 : 0
        hoursCount -= (month == 10 && birthday.day >= 30) ? 1 : 0
        
        switch month {
        case month where month == birthday.month:
            hoursCount += (birthday.day - 1) * 24
            
        case 2:
            hoursCount += daysInFebruary * 24
            
        case month where (month % 2 == 0 && month < 8) || month == 9:
            hoursCount += 30 * 24
            
        default:
            hoursCount += 31 * 24
        }
    }
    
    return hoursCount * 60 * 60
}

// 25.02 -> (31 + 25 - 1) * 24 * 60 * 60 = 4_752_000
print("От начала года до моего дня рождения пройдет \(calculateSeconds((day: 25, month: 2))) секунд")

// 26.03 -> (31 + 29 + 26 - 1) * 24 * 3600 = 7_344_000
print("От начала года до дня рождения моей дочери пройдет \(calculateSeconds((day: 26, month: 3))) секунд")

// 14.11 -> (6 * 31 + 29 + 3 * 30 + 14 - 1) * 24 * 3600 = 27_475_200
print("От начала года до дня рождения моего сына прошло \(calculateSeconds((day: 14, month: 11))) секунд")

// 19.10 -> (5 * 31 + 29 + 3 * 30 + 19 - 1) * 24 * 3600 = 25_228_800
print("От начала года до дня рождения моей жены прошло \(calculateSeconds((day: 19, month: 10))) секунд")

// 21.08 -> (4 * 31 + 29 + 2 * 30 + 21 - 1) * 24 * 3600 = 20_131_200
print("От начала года до дня рождения моего отца прошло \(calculateSeconds((day: 21, month: 8))) секунд")

// 6.01 -> (6 - 1) * 24 * 3600 = 432_000
print("От начала года до дня рождения моей матери прошло \(calculateSeconds((day: 6, month: 1))) секунд")


// 1.2. Посчитайте, в каком квартале вы родились.
let birthdayMonth = 7
let quarter = (birthdayMonth + 2) / 3


// 1.3. Создайте пять переменных типа `Int` и добавьте их в выражения со сложением, вычитанием, умножением и делением. В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. Переменные могут повторяться. Убедитесь, что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций.
var int1 = 11
var int2 = 5
var int3 = 33
var int4 = 9
var int5 = -67

int1 -= int5 + int2
 
 
// 1.4. Шахматная доска 8 х 8. Каждое значение в диапазоне `1…8`. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы `a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`.
let horizontal = ["a", "b", "c", "d", "e", "f", "g", "h"]
let vertical = ["1", "2", "3", "4", "5", "6", "7", "8"]
let chessBoardView = UIImage(named: "chess-board.jpg")

func checkCellColor(hrz: String, ver: String) -> String {
    let rowIndex = horizontal.indexOf(hrz)
    let columnIndex = vertical.indexOf(ver)

    if  rowIndex != nil && columnIndex != nil {
        let indexRow = rowIndex! + 1
        let indexColumn = columnIndex! + 1
        
        switch indexRow {
        case indexRow where indexRow % 2 != 0:
            return (indexColumn % 2 != 0) ? "black" : "white"
            
        case indexRow where indexRow % 2 == 0:
            return (indexColumn % 2 != 0) ? "white" : "black"
            
        default:
            return "none"
        }
    } else {
        return "none"
    }
}

checkCellColor("a", ver: "2")
