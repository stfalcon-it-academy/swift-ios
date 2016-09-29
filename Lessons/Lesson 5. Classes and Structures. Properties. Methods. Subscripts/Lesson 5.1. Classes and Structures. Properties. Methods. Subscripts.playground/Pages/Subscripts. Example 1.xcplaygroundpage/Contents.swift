/*: ## Subscripts. Example 1 (Индексы. Пример 1) */
//:
/*:  */

import Foundation

class Example {
    var value1: String = ""
    var value2: String = ""
    var value3: String = ""
    var value4: String = ""
    
    subscript(row: Int, column: Int) -> String {
        get {
            // Get field based on row and column.
            if row == 0 {
                if column == 0 {
                    return value1
                }
                    
                else {
                    return value2
                }
            }
            else {
                if column == 0 {
                    return value3
                }
                else  {
                    return value4
                }
            }
        }
        
        set {
            // Set field based on row and column.
            if row == 0 {
                if column == 0 {
                    value1 = newValue
                }
                else {
                    value2 = newValue
                }
            } else {
                if column == 0 {
                    value3 = newValue
                } else {
                    value4 = newValue
                }
            }
        }
    }
}


// Create our class and use the subscript.
var ex = Example()
ex[0, 0] = "cat"
ex[0, 1] = "dog"
ex[1, 0] = "bird"
ex[1, 1] = "fish"


// Read values from the fields.
print(ex[0, 0])
print(ex[0, 1])
print(ex[1, 0])
print(ex[1, 1])
