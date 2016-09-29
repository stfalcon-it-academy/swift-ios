import Foundation

//: [NSCharacter​Set](http://nshipster.com/nscharacterset/)


// 1.1. Создайте константу типа `String` произвольного текста (минимум 200 символов). Используя цикл `for-in` и оператор `switch` посчитайте: количество гласных, согласных, цифр и символов.
let stringTest = "jdhfjhf98fssd8sdfdsf sadfsdf skdf  ^$#@ /aslkl;akdl;0 -321 112§334@#!$#@$24 ,sdmf,mf,sdm :;|||||±!@#$%^&*()_+=- dfsdsrdfvbnvbvc ADSKLDASKJDKLASJDKJSADKL 9723478625462%%%% -12=3FKVKDMV,AS   asd;l;elo8eyh /////3$$$$er432454t dw"

let stringCharCount = stringTest.characters.count
let numbers = NSCharacterSet.decimalDigitCharacterSet()
let simbols = NSMutableCharacterSet.symbolCharacterSet(); simbols.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())

let whiteSpaces = NSCharacterSet.whitespaceCharacterSet()
let lettersSpaces = NSCharacterSet.letterCharacterSet()

var numbersCount = 0
var simbolsCount = 0
var whiteSpacesCount = 0
var lettersSpacesCount = 0

for char in stringTest.characters {
    switch char {
    // Count numbers
    case char where numbers.characterIsMember(String(char).utf16.first!):
        numbersCount += 1
    
    // Count simbols
    case char where simbols.characterIsMember(String(char).utf16.first!):
        simbolsCount += 1

    // Count whitespaces
    case char where whiteSpaces.characterIsMember(String(char).utf16.first!):
        whiteSpacesCount += 1
        
    // Count lettersSpacesCount
    case char where lettersSpaces.characterIsMember(String(char).utf16.first!):
        lettersSpacesCount += 1
        
    default:
        print("Default: undefined symbol: \(char)")
    }
}

// Контроль
stringCharCount
39 + 59 + 18 + 109

print("1.1. numbersCount = \(numbersCount)", "simbolsCount = \(simbolsCount)", "whiteSpacesCount = \(whiteSpacesCount)", "lettersSpacesCount = \(lettersSpacesCount)", separator: ", ", terminator: ".\n-------------------------------------------------------------------------------------------\n\n")


// 1.2. Создайте `switch`, который принимает возраст человека и выводит [описание жизненного этапа](https://otvet.mail.ru/question/57813416)
let manAge = 44

switch manAge {
case 0..<3:
    print("1.2. Младенчество -- от рождения до года")
 
case 3..<6:
    print("1.2. Раннее детство -- от 3 до 6 лет")
    
case 6..<10:
    print("1.2. Младший школьный -- от 6 до 10 лет")
    
case 10..<12:
    print("1.2. Младший подростковый -- от 10 до 12 лет")
    
case 12..<15:
    print("1.2. Старший подростковый -- от 12 до 14 лет")
    
case 15..<18:
    print("1.2. Младший юношеский -- от 15 до 17 лет")
        
case 18..<23:
    print("1.2. Старший юношеский -- от 18 до 23 лет")
    
case 23..<30:
    print("1.2. Молодость -- от 23 до 30 лет")
    
case 30..<40:
    print("1.2. Ранняя зрелость -- от 30 до 40 лет")
    
case 40..<56:
    print("1.2. Поздняя зрелость -- от 40 до 55 лет")
    
case 56..<65:
    print("1.2. Пожилой -- от 56 до 65 лет")
    
case 65..<75:
    print("1.2. Старость -- от 65 до 75 лет")
    
default:
    print("1.2. Долгожительство -- старше 75 лет")
}

print("-----------------------------------------------\n")


// 1.3. У вас есть фамилия, имя и отчество студента (русские буквы). Если его имя начинается на букву `А` или `О` - обращайтесь к нему по имени; в противном случае, если его отчество начинается на букву `В` или `Д` - обращайтесь к нему по имени и отчеству; в противном случае, если его фамилия начинается на букву `Е` или `З` - обращайтесь к нему только по фамилии. Во всех остальных случаях обращайтесь к нему по Ф.И.О.
let studentInitials = (lastName: "Монастырский", firstName: "Сергей", middleName: "Михайлович")

switch studentInitials {
case let (_, firstName, _) where firstName.hasPrefix("А") || firstName.hasPrefix("О"):
    print("1.3. Уважаемый, \(firstName)")
    
case let (_, _, middleName) where middleName.hasPrefix("В") || middleName.hasPrefix("Д"):
    print("1.3. Уважаемый, \(studentInitials.firstName + " " + studentInitials.middleName)\n", terminator: "-----------------------------------------------\n")
    
case let (lastName, _, _) where lastName.hasPrefix("Е") || lastName.hasPrefix("З"):
    print("1.3. Уважаемый, \(studentInitials.lastName)\n", terminator: "-----------------------------------------------\n")

default:
    print("1.3. Уважаемый, \(studentInitials.lastName + " " + studentInitials.firstName + " " + studentInitials.middleName)\n", terminator: "-----------------------------------------------\n\n")
}


// 1.4. Представьте, что вы играете в морской бой и у вас осталось некоторое количество кораблей на поле 10 х 10 (маркировка клеток - буквы и цифры или только цифры). Создайте `switch`, который примет `Tuples` (кортеж) с координатами клетки и выдаст один из вариантов: `мимо`, `ранил`, `убил`.
// Корабли
let ship1 = (x: 5, y: 6...8)
let ship2 = (x: 7...10, y: 1)
let ship3 = (x: 3, y: 3)
let ship4 = (x: 1...5, y: 3...9)

// Выстрел
let shot = (x: arc4random_uniform(11), y: arc4random_uniform(9))

switch shot {
case (5, 6...8): print("1.4.1. Ранил")
    
case (7...10, 1): print("1.4.2. Ранил")
    
case (3, 3): print("1.4.3. Убил")

case (1...5, 3...9): print("1.4.4. Ранил")

default: print("1.4.5. Мимо")
}

print("-------------\n")


// 2.1. Создайте псевдоним типа `String` с именем `Text`.
typealias Text = String


// 2.2. Объявите три константы типа `Text`. Значения двух констант должны состоять только из цифр, третьей — из цифр и букв.
let text1, text2, text3: Text
text1 = "12"
text2 = "-978"
text3 = "Apollo13"


// 2.3. Из всех трех констант найдите те, которые состоят только из цифр, и выведите их на консоль. Для преобразования строки в число используйте функцию `Int()`.
let arrayText = [text2, text3, text1]

for temp in arrayText {
    let number: Int?
    number = Int(temp) ?? 0
    
    if number! != 0 {
        print("2.3. number = \(number!)")
    }
}

print("-------------------\n")
 

// 2.4. Создайте псевдоним для типа `(numberOne: Text?, numberTwo: Text?)?` с именем `TupleType`. Данный тип является опциональным и также содержит в себе опциональные значения.
typealias TupleType = (numberOne: Text?, numberTwo: Text?)?


// 2.5. Создайте три переменные типа `TupleType`, содержащие следующие значения: `("190", "67")`, `("100", nil)`, `("-65", "70")`.
var tuple1, tuple2, tuple3: TupleType
tuple1 = ("190", "67")
tuple2 = ("100", nil)
tuple3 = ("-65", "70")


// 2.6. Выведите значения элементов тех кортежей, в которых ни один из элементов не инициализирован как `nil`.
func checkTuple(tuple: TupleType) {
    // Проверяю опционал на значение
    if tuple != nil {
        // Принудительно достаю значение опционала и передаю его в switch
        switch tuple! {
        case let (value1, value2) where value1 != nil && value2 != nil:
            print("2.6. \(value1!, value2!)\n", terminator:"-------------------\n\n")
 
        default:
            print("2.6. Current tuple has nil value!\n", terminator:"---------------------------------\n\n")
        }
    } else {
        print("2.6. Current tuple is nil!\n", terminator:"--------------------------\n\n")
    }
}

checkTuple(tuple2)



// 3.1. Определите псевдоним Operation типу кортежа, содержащему три элемента со следующими именами: `operandOne`, `operandTwo`, `operation`. Первые два — это числа с плавающей точкой. Они будут содержать операнды для выполняемой операции. Третий элемент — строковое значение типа `Character`. Оно будет содержать указатель на проводимую операцию. Всего может быть четыре вида операций: `+`, `-`, `*`, `/`.
typealias Operation = (operandOne: Float, operandTwo: Double, operation: Character)


// 3.2. Создайте константу типа `Operation` и заполните значения ее элементов произвольным образом, например `(3.1, 33, "+")`.
let operationTest: Operation = (3.1, 33, "+")


// 3.3. Используя конструкцию `switch-case`, вычислите значение операции, указанной в элементе operation созданного кортежа для операндов в его первых двух элементах. Оператор `switch` должен корректно обрабатывать любую из перечисленных операций.
switch operationTest {
case let (first, second, operation) where operation == "+":
    print("3.3. \(first) \(operation) \(second) = \(Double(first) + second)\n", terminator:"----------------------------------\n\n")
 
case let (first, second, operation) where operation == "-":
    print("3.3. \(first) \(operation) \(second) = \(Double(first) - second)\n", terminator:"----------------------------------\n\n")
 
case let (first, second, operation) where operation == "*":
    print("3.3. \(first) \(operation) \(second) = \(Double(first) * second)\n", terminator:"----------------------------------\n\n")

case let (first, second, operation) where operation == "/":
    print("3.3. \(first) \(operation) \(second) = \(Double(first) / second)\n", terminator:"----------------------------------\n\n")

default:
    break
}


// 3.4. В созданной константе замените символ операции другим произвольным символом и проверьте правильность работы конструкции `switch-case`.
// Изменять в константе п.3.2



// 4.1. Создайте функцию, которая выведет в консоль фразу `Я не буду пропускать основы!` `n` раз. Используйте 2 подхода:
// 4.1.1. C использованием оператора `for-in`.
var n = 10

for _ in 1...n {
    print("4.1.1. Я не буду пропускать основы!")
}

print("***********************************\n")

// 4.1.2. C использованием оператора `while`.
var times = 0

while times < n {
    print("4.1.2. Я не буду пропускать основы!")
    times += 1
}

print("***********************************\n")


// 4.2. Создайте функцию, которая выведет в консоль квадрат целого числа, которое меньше или равно заданному значению `n`. Например, при `n = 3` должна распечататься следующая последовательность: `1`, `4`, `9`. Константа `n = 11`.
var n2 = 11
var cnt = 1

while cnt <= n {
    print("4.2. \(cnt * cnt)")
    cnt += 1
}

print("********\n")


//: 4.3. Создайте функцию, которая выведет в консоль последовательность четных чисел, полученных в результате умножения на `2`. Рабочий диапазон значений - от `0` до `n` включительно. Например, при `n = 100` должна распечататься следующая последовательность: `2`, `4`, `8`, `16`, `32`, `64`.
var n3 = 210
var power = 2

while power <= n3 {
    print("4.3. \(power)")
    power *= 2
}

print("********\n")


// 4.4. Создайте функцию, которая выведет в консоль последовательность целых чисел из диапазона от `0` до `n` включительно в альтернативном порядке: одна цифра - из первой позиции, вторая - из позиции `(n - 1)`. Используйте две переменные для хранения левого и правого указателей для следующей итерации. Обратите внимание на случай, когда `n` будет иметь нечетное значение.
var n4 = 5
var left = 1
var right = n4

while left < right {
    print(left)
    print(right)
    left += 1
    right -= 1
}

if left == right {
    print(left)
}

print("\n----------\n")


// 4.5. Создайте функцию, которая выведет в консоль квадрат, состоящий из `n` звездочек. Например, при `n = 3`, должен распечататься квадрат 3х3 звездочки. Используйте оператор `print("")` для печати пустой строки. Проверьте работу функции на значениях от `1` до `5`.
var n5 = 5

for i in 1...n5 {
    for j in 1...n5 {
        print("*", terminator: "")
    }
    
    print("")
}

print("\n----------\n")


// 4.6. Создайте функцию, которая выведет в консоль прямоугольник, состоящий из `n = 3` (строк) и `m = 7` (в строке) звездочек. В задании 5 измените диапазон одного из циклов.
var nn = 3
var mm = 7

for i in 1...nn {
    for j in 1...mm {
        print("*", terminator: "")
    }
    
    print("")
}

print("\n----------\n")


// 4.7. Создайте функцию, которая выведет в консоль треугольник, состоящий из `n` строк со звездочками. Например, при `n = 3` сначала напечатайте `*`, затем во второй строке - `**`, потом - `***`. Проверьте работу функции на значениях от `1` до `7`.
var n7 = 3

for i in 1...n7 {
    for j in 1...i {
        print("*", terminator: "")
    }
    
    print("")
}

print("\n----------\n")

