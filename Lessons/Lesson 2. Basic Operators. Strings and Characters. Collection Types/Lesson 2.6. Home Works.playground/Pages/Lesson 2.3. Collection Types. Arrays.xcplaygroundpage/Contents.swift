import Foundation


// 1.1. Создайте массив "дни в месяцах" - 12 элементов, содержащих количество дней в соответствующем месяце.
let daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

// 1.2. Используя цикл `for` и этот массив:
// 1.2.1. Выведите количество дней в каждом месяце (без имен месяцев)
for (index, daysCount) in daysInMonth.enumerate() {
    print("\(index + 1) month has \(daysCount) days")
}

print("********************\n\n")


// 1.2.3. Используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
let dateFormatter: NSDateFormatter = NSDateFormatter()
let months = dateFormatter.standaloneMonthSymbols

for (index, daysCount) in daysInMonth.enumerate() {
    print("  In \(months[index]) month are \(daysCount) days")
}

print("  ******************************\n\n")


// 1.2.4. Сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
typealias Month = (name: String, daysCount: Int)
var monthsTuples = [Month]()

// Crate array of Tuples
for (monthIndex, daysCount) in daysInMonth.enumerate() {
    monthsTuples.append(Month(name: months[monthIndex], daysCount: daysCount))
    
    print("    In \(monthsTuples[monthIndex].name) month are \(monthsTuples[monthIndex].daysCount) days")
}

print("    ******************************\n\n")


// 1.2.5. Сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
for (monthIndex, daysCount) in daysInMonth.enumerate() {
    print("      In \(monthsTuples[monthsTuples.count - monthIndex - 1].name) month are \(monthsTuples[monthsTuples.count - monthIndex - 1].daysCount) days")
}

print("      ******************************\n\n")


// 1.2.6. Для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
func calculateDays(days: Int, month: Int) -> Int {
    var daysCount = Int()
    
    let currentYear = 2016
    let isCurrentYearLeap = (currentYear % 12 == 0) ? true : false
    let daysInFebruary = isCurrentYearLeap ? 29 : 28

    for monthIndex in 0..<month {
        if monthIndex == month - 1 {
            daysCount += days - 1
        } else {
            daysCount += (monthIndex == 1) ? daysInFebruary : daysInMonth[monthIndex]
        }
    }
    
    return daysCount
}

// 25.02 -> 31 + 25 - 1 = 55
calculateDays(25, month: 2)

// 31.03 -> 31 + 29 + 31 - 1 = 90
calculateDays(31, month: 3)

// 31.12 -> 6 * 31 + 29 + 4 * 30 + 31 - 1 = 365
calculateDays(31, month: 12)


// 2.1. Создайте массив, состоящий из `Int?` типов и посчитайте сумму всех его 5-ти элементов 3-мя способами:
// 2.1.1. Вариант 1 - используя `optional binding`
let arrayInts: [Int?] = [54, nil, 8, -9, 11, nil, nil, 21]
var sumInts = 0

for value in arrayInts {
    if let item = value {
        sumInts += item
    } else {
        sumInts += 0
    }
}

print("        Optional binding: sumInts = \(sumInts)")
print("        ******************************\n\n")


// 2.1.2. Вариант 2 - используя `forced unwrapping`
sumInts = 0

for value in arrayInts {
    if value != nil {
        sumInts += value!
    } else {
        sumInts += 0
    }
}

print("        Forced unwrapping: sumInts = \(sumInts)")
print("        *******************************\n\n")


// 2.1.3. Вариант 3 - используя оператор `??`
// Nil Coalescing Operator (Оператор объединения по nil)
sumInts = 0
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

for value in arrayInts {
    var item = value ?? 0
    sumInts += item
}

print("        Nil Coalescing Operator: sumInts = \(sumInts)")
print("        *************************************\n\n")




// 3.1. Создайте строку-алфавит и пустой массив строк.
let alphabeta = "abcdefghijklmnopqrstuvwxyz"
var stringArray = [String]()


// 3.2. В цикле пройдитесь по всем символам строки в "прямом" порядке (слева-направо), преобразовывая каждый из них в строку и добавляя его в массив, причем так, чтобы на выходе получился массив с "обратным" алфавитом.
for char in alphabeta.characters {
    char
    stringArray.insert(String(char), atIndex: 0)
}

print("        \(stringArray)")
print("        ******************************\n\n")


// 4.1. Создайте структуру `Restaurant` со следующими параметрами: название ресторана, общий счет за ужин, сумма чаевых. Процент чаевых составляет 20% от суммы счета. Значение суммы чаевых является рассчетным значением.
struct Restaurant {
    let name: String
    var bill = Float()
    var tips = Float()
    var rating = String()
    
    init(name: String, bill: Float) {
        self.name = name
        self.bill = bill
        self.tips = bill * 0.2
    }
}

// 4.2. Создайте 4 экземпляра структуры (имя + счет + расчет суммы чаевых) и разместите их в массиве.
let restaurant1 = Restaurant(name: "Metro", bill: 122.35)
let restaurant2 = Restaurant(name: "Woo", bill: 159.87)
let restaurant3 = Restaurant(name: "Postrio Las Vegas", bill: 127.06)
let restaurant4 = Restaurant(name: "Le Chantecler", bill: 91.43)
var restaurants = [restaurant1, restaurant2, restaurant3, restaurant4]

// 4.3. Используя итерацию по массиву рассчитайте для 4-х ресторанов:
// 4.3.1. Общую сумму чаевых
var tipsSum: Float = 0

for restaurant in restaurants {
    tipsSum += restaurant.tips
}

// (122.35 + 159.87 + 127.06 + 91.43) * 0.2 = 100.142
print("all restaurants tips = $\(tipsSum)")

// 4.3.2. Общую сумму по счетам
var billSum: Float = 0

for restaurant in restaurants {
    billSum += restaurant.bill
}

// 122.35 + 159.87 + 127.06 + 91.43 = 500.71
print("all restaurants tips = $\(billSum)")


// Задание из домашки по словарям
// 2.1. Сохраните в словаре проценты для рейтинга, начиная с 10% для первого элемента и увеличивая его на 5% для каждого следующего из 4-х возможных.
var ratings = [String : String]()

for i in 0..<restaurants.count {
    ratings[String(i)] = String(10 + (i * 5)) + "%"
}


// Задание из домашки по словарям
// 2.2. Используя материалы из предыдущего ДЗ по массивам расставьте рейтинги ресторанам по итоговой сумме в счете.
var restaurantsSorted = restaurants.sort { (Restaurant1, Restaurant2) -> Bool in
    return Restaurant1.bill < Restaurant2.bill
}

for (index, restaurant) in restaurantsSorted.enumerate() {
    var restaurantTemp = restaurant
    restaurantTemp.rating = ratings[String(index)]!
    restaurantsSorted[index] = restaurantTemp
}

restaurantsSorted
