/*: ## Examples. Range Operators (Примеры. Операторы диапазона) */
//:

import Foundation

/*: *Пример использования оператора закрытого диапазона* */
for i in 1...10 {
    print("i = \(i)")
}

//:
/*: *Пример использования оператора полуоткрытого диапазона* */
for i in 0 ..< 10 {
    print("i = \(i)")
}
//:
/*: *Пример использования оператора полуоткрытого диапазона* */
let x = Int.max - 99

switch x {
    case 1 ..< Int.max: // EXC_BAD_INSTRUCTION
        print("positive")

    case Int.min ..< 0:
        print("negative")
    
    case 0:
        print("zero")

    default:
        fatalError("Should be unreachable")
}
//:
/*: *Пример использования оператора полуоткрытого диапазона* */
let companies = ["Amy", "Clara", "Donna", "Martha", "Rose"]
let count = companies.count

for i in 0 ..< count {
    print("Person \(i + 1) is called \(companies[i])")
}
//:
/*: */
//: [Range Operators](@previous) | [Logical Operators](@next)
