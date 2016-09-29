/*: ## Examples. Nil Coalescing Operator (Примеры. Оператор объединения по nil) */
//:

import Foundation

/*: *Пример использования оператора объединения по nil* */
let defaultTableColumnWidth = 100.0
var userDefinedTableColumnWidth: Double?

print("1. userDefinedTableColumnWidth = \(userDefinedTableColumnWidth)")

let columnWidthToBeUsed = userDefinedTableColumnWidth ?? defaultTableColumnWidth
print("2. column width to be used in the screen is = \(columnWidthToBeUsed)")

userDefinedTableColumnWidth = 200.0
let newColumnWidthToBeUsed = userDefinedTableColumnWidth ?? defaultTableColumnWidth

print("3. column width to be used in the screen is = \(newColumnWidthToBeUsed)")
//:
/*: */
//: [Nil Coalescing Operator](@previous) | [Range Operators](@next)
