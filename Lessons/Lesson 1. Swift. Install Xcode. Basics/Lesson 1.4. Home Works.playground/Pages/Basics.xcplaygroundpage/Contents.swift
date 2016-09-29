import Foundation


// 1.1. Выведите в консоль минимальные и максимальные значения базовых типов.
print(Int8.min)
print(Int8.max)
print(UInt8.min)
print(UInt8.max)

print(Int16.min)
print(Int16.max)
print(UInt16.min)
print(UInt16.max)

print(Int32.min)
print(Int32.max)
print(UInt32.min)
print(UInt32.max)

print(Int64.min)
print(Int64.max)
print(UInt64.min)
print(UInt64.max)

print(Int.min)
print(Int.max)
print(UInt.min)
print(UInt.max)

 
// 1.2. Создайте первые три константы с типами `Int`, `Float` и `Double`. Создайте вторые три константы (`Int`, `Float`, `Double`), где каждая из констант - это сумма первых трех констант с соотвествующими типами.
let testInt = 7
let testFloat: Float = 6.6
let testDouble = 9.4

let sumInt = testInt + Int(Double(testFloat) + testDouble)
let sumFloat = testFloat + Float(testDouble + Double(testInt))
let sumDouble = testDouble + Double(testInt) + Double(testFloat)

 
// 1.3. Сравните две результирующие суммы с типами `Int` и `Double`, отчет о сравнении выведите в консоль.
if Double(sumInt) > sumDouble {
    print("sumInt(\(sumInt)) > sumDouble(\(sumDouble))")
} else {
    print("sumInt(\(sumInt)) < sumDouble(\(sumDouble))")
}



// 2.1. Объявите две пустые целочисленные переменные типов `Int8` и `UInt8`.
let testInt8: Int8
let testUInt8: UInt8

 
// 2.2. В одну из них запишите **максимальное** значение, которое может принять параметр типа `UInt8`, в другую — **минимальное** значение, которое может принять параметр типа `Int8`. Обратите внимание на то, какое значение в какую переменную может быть записано.
testUInt8 = UInt8.max
testInt8 = Int8.min

 
// 2.3. Выведите полученные значения на консоль.
print("UInt8.max = \(testUInt8),", "Int8.min = \(testInt8)")

 
// 2.4. Объявите две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
var testInt1 = 7
var testInt2: Int = 6


// 2.5. Поменяйте значения переменных местами.
// 2.6. Для этого вам придется использовать еще одну переменную, которая будет служить буфером.
var tempInt = testInt1
testInt1 = testInt2
testInt2 = tempInt

 
// 2.7. Выведите получившиеся значения на консоль. При этом в каждом варианте выводимых данных текстом напишите, какую переменную вы выводите.
print("testInt1 = \(testInt1),", "testInt2 = \(testInt2)")



// 3.1. Объявите три параметра. Первый из них должен быть константой типа `Float` с произвольным числовым значением, второй — пустой константой типа `Float`, третий — пустой переменной типа `Double`.
let floatParam1 = Float(7.7)
let floatParam2: Float
var doubleParam: Double

 
// 3.2. Установите новое произвольное значение всем параметрам, для которых эта операция возможна.
doubleParam = 9.99999
floatParam2 = 7.7



// 4.1. Объявите три пустые константы: одну типа `Int`, одну типа `Float` и одну типа `Double`. Сделайте это в одной строке.
let integer: Int; let float: Float; let double: Double

 
// 4.2. Проинициализируйте для них следующие значения: `Int` — `18`, `Float` — `16.4`, `Double` — `5.7`. Сделайте это в одной строке.
integer = 18; float = 16.4; double = 5.7

 
// 4.3. Найдите сумму всех трех констант и запишите ее в переменную типа `Float`.
var floatSumma = float + Float(double + Double(integer))

 
// 4.4. Найдите произведение всех трех констант и запишите его в переменную типа `Int`. Помните, что вам необходимо получить результат с минимальной погрешностью.
var integerMultiplication = Int(Double(integer) * Double(float) * double)

 
// 4.5. Найдите остаток от деления константы типа `Float` на константу типа `Double` и запишите ее в переменную типа `Double`.
var doubleDivision = Double(float) % double

 
// 4.6. Выведите на консоль все три результата с использованием поясняющего текста.
print("floatSum = \(floatSumma)", "\nintegerMultiplication = \(integerMultiplication)", "\ndoubleDivision = \(doubleDivision)")



// 5.1. Объявите переменную типа `String` и запишите в нее произвольный строковый литерал.
var testString = "Ababa-galamaga"

 
// 5.2. Объявите константу типа `Character`, содержащую произвольный символ латинского алфавита.
let testCharacter: Character = "Q"

 
// 5.3. Объявите две переменные типа `Int` и запишите в них произвольные значения.
var int1 = 9, int2 = 7

 
// 5.4. Одним выражением объедините в строковый литерал переменную типа `String`, константу типа `Character` и сумму переменных типа `Int`, а результат запишите в новую константу.
testString += String(testCharacter) + String(int1 + int2)
let newString = testString

 
// 5.5. Выведите данную константу на консоль.
print("newString = \"\(newString)\"")



// 6.1. Объявите две логические переменные. Значение первой должно быть равно `true`, второй — `false`.
var testBool1 = true
var testBool2 = false

 
// 6.2. Запишите в две константы результат использования их в качестве операндов для операторов логического `И` и `ИЛИ`.
let boolAnd = testBool1 && testBool2
let boolOr = testBool1 || testBool2

 
// 6.3. Выведите на консоль значения обеих получившихся констант.
print("boolAnd = \(boolAnd),", "boolOr = \(boolOr)")

 
// 6.4. Вычислите результат следующих логических выражений. При этом постарайтесь не использовать `Xcode`:
//((true && false) || true)                     // true
//true && false && true || (true || false)      // true
//false || (false || true) && (true && false)   // false



// 7.1. Объявите строковую константу и запишите в нее ваше имя.
let myName = "Sergey"

 
// 7.2. Объявите переменную типа `Double` и запишите в нее ваш вес в килограммах.
var myWeight = 87.1

 
// 7.3. Объявите переменную типа `Int` и запишите в нее ваш рост в сантиметрах.
var myHeight = 168

 
// 7.4. Вычислите ваш индекс массы тела и запишите его в перменную. Формула для расчета `ИМТ`:
//      ИМТ = вес[кг] / рост[м]2
var myBodyMassIndex = myWeight / Double(myHeight * myHeight / 100 * 100)



// 8.1. Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо. Все элементы кортежа должны быть именованы.
var myFavorites = (favoriteFilm: "Alien", favoriteNumber: 25, favoriteDish: "Pelmeni")

 
// 8.2. Одним выражением запишите каждый элемент кортежа в три константы.
let (favoriteFilm, favoriteNumber, favoriteDish) = myFavorites
favoriteFilm
favoriteNumber
favoriteDish


// 8.3. Создайте второй кортеж, аналогичный первому по параметрам, но описывающий другого человека (с другими значениями).
var myFriendFavorites = (favoriteFilm: "Taxi", favoriteNumber: 7, favoriteDish: "Pizza")

 
// 8.4. Обменяйте значения в кортежах между собой (с использованием дополнительного промежуточного кортежа).
let tempFavorites = myFavorites
myFavorites = myFriendFavorites
myFriendFavorites = tempFavorites

 
// 8.5. Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей.
let difference = myFavorites.favoriteNumber - myFriendFavorites.favoriteNumber
let newFavorites = (number1: myFavorites.favoriteNumber, number2: myFriendFavorites.favoriteNumber, difference: difference)
