//: Playground - noun: a place where people can play

import UIKit

let number: Int = 32 //6008514//7514
var someInts = [Int]()

for i in 2...number {
    print(i)
    if number % i == 0 {
        someInts.append(i)
    }
}

someInts


func calc(array: [Int], operation: (int1: Int, int2: Int) -> Bool) -> Int {
    var count = 1
    
    for value in array {
        if operation(int1: count, int2: value) {
            count *= value
        } else {
            break
        }
    }
    
    return count
}

let result = calc(someInts) { (int1, int2) -> Bool in
    print(int1 * int2)
    return int1 * int2 < number
}

calc(someInts) { $0 * $1 < number}

print(someInts)
print(result)
