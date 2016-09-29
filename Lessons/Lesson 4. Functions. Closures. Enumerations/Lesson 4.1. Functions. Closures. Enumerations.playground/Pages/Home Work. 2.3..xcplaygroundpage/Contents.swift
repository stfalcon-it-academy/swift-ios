//: [Previous](@previous)

import Foundation


// 2.3. Создайте функцию, которая принимает массив `[Int]`, замыкание и возвращает `Int`. Замыкание должно принимать `Int`, `Int?` и возвращать `Bool`. В самой функции создайте `optional` переменную. В цикле пройдитесь по массиву `[Int]`, используя замыкание сравнивая элементы с `optional` переменной. Если замыкание возвращает `true` - записываете значение массива в переменную. В конце функции возвращайте значение этой `optional` переменной.

func filter(array: [Int], callBack:(Int, Int?) -> Bool) -> Int {
    var number: Int?
    
    for value in array {
        if number == nil || number == value {
        //if callBack(value, number) {
            number = value
        }
    }
    
    return number ?? 0
}

let nums = [1, 2, 6, 4, 5, -3, 8 , 0]

let any = filter(nums) { _,_ in return true }//{ $1 == nil || $0 == $1 }

any
