/*:
 ### Example 2 (Пример 2)
 */
//:

import Foundation

let numberInt = 255
let numberBig = 1_863_215_371_232

// Int: 8 * 1 + 2 = 10
let numberOct = 0o12

// Int: 16 * 15 + 15 = 255
let numberHex = 0xff

// Int: (1 * 1 + 2 * 1) + (4 * 1 + 8 * 1) + (16 * 1 + 32 * 1) + (64 * 1 + 128 * 1) = 255
let numberBinary = 0b11_11_11_11


// Int - целое число
Int8.min
Int8.max
UInt8.min
UInt8.max

// Float - 32 бита, точность 6 знаков после запятой
// Double - 64 бита, точность 15 знаков после запятой
// По умолчанию язык Swift выводит тип Double для чисел с плавающей запятой

// Пример записи дробного числа при помощи степени:
// 13.3123 * (10 * 10 * 10)
13.3123e3

// 13.3123 / (10 * 10)
13.3123e-2


// Пример записи шестнадцатеричного числа при помощи степени (e -> p):
// 5 * (2 * 2 * 2)
0x5p3

// 5 / (2)
0x5p-1


// Пример приведения типов
let testInt = 5
let testDouble = 5.0
let testIntSum: Int
var testDoubleSum = 0.0

testIntSum = testInt + Int(testDouble)
testDoubleSum = Double(testInt) + testDouble

let c = 5 + 5.2

typealias AlexNumber = Int
/*
let a : AlexNumber = 5
let b = 5.2

let c = a + AlexNumber(b)
*/
let d = false

if d {
    print("Hi!")
} else {
    print("Bye!")
}
//:
/*:
 
 */
//: [Example 1](@previous) | [Example 3](@next)
