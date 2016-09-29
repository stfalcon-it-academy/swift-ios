/*: ## Examples. Arrays (Примеры. Массивы) */
//:

import Foundation

/*: *Пример инициализации массива* */
var intArray = [Int]()
print("array - empty init: \(intArray)")

intArray.append(10)
print("array - add 1 new value: \(intArray)")

intArray.append(20)
print("array - add 1 new value: \(intArray)")

intArray = []
print("array - clean: \(intArray)")
//:
/*: *Пример инициализации массива с повторяющимися элементами* */
let floatArray = [Float](count: 3, repeatedValue: 12.32)
print("array - init with 3 repeated values: \(floatArray)")
//:
/*: *Пример создания нового массива на основе двух существующих* */
let array1 = [10, 20.3]
let array2 = [30, 40.5]
let array3 = array1 + array2

print("array - create from other: \(array3)")
//:
/*: *Пример использования литерала массива* */
let nameArray:[String] = ["John  Doe","Jane Doe","Mary Jane"]
let ageArray:[Int] = [22, 23, 21]

print("array - init array with String type: \(nameArray)")
print("array - init array with Int type: \(ageArray)")

// Инициализация массива с выводом его типа: String
let stringArray = ["John  Doe", "Jane Doe", "Mary Jane"]
print("array - init without array type: \(stringArray)")
//:
/*: *Пример использования доступа и изменения массива* */
var monthArray = ["Jan","Feb"]
print("monthArray Count is \(monthArray.count)")

if (monthArray.isEmpty){
    print("Month Array is empty")
} else {
    print("Month Array is not empty")
}

monthArray.append("Mar")
print("monthArray - add 1 new value: \(monthArray)")

monthArray += ["Apr", "May"]
print("array - add 2 new values: \(monthArray)")

let firstMonth = monthArray[0]
print("array - first month is \(firstMonth)")

monthArray[0] = "January"
print("array - change selected value: \(monthArray)")
print("array - first month is \(monthArray[0])")

// Заменить значения элементов, перечисленных в закрытом диапазоне и дополнить массив новыми элементами
monthArray[1...3] = ["February", "March", "April", "May", "June", "July"]
print("array - add & replace values: \(monthArray)")

monthArray.removeAtIndex(0)
print("array - remove value by index: \(monthArray)")

monthArray.insert("January", atIndex: 0)
print("array - insert value by index: \(monthArray)")

// Итерация по массиву
for month in monthArray{
    print(month)
}

for (index, value) in monthArray.enumerate() {
    print("index is \(index) and month is \(value)")
}

// Удаление элементов массива
monthArray.removeLast()
print("array - remove last value: \(monthArray)")
monthArray.removeAll()
print("array - remove all values: \(monthArray)")
//:
/*: */
//: [Arrays](@previous) | [Home Work](@next)
