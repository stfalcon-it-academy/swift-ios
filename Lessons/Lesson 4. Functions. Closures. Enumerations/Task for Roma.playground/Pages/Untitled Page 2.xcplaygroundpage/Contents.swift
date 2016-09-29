//: [Previous](@previous)

import Foundation



func calc(array: [Int], operation: (int1: Int, int2: Int) -> Bool) -> Int {
    var count = 1
    
    for (index, _) in array.enumerate() {
        if operation(int1: count, int2: array[index]) {
            count *= array[index]
        } else {
            break
        }
    }
    
    return count
}

let result = calc(someInts) { (int1, int2) -> Bool in
    return int1 * int2 < number
}

print(someInts)
print(result)
