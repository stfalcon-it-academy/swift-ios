import Foundation

/*: ## if-case Pattern Matching */

let examResult = 49

// Standard switch
switch examResult {
case 0...49:
    print("1. Fail!")

case 50...100:
    print("1. Pass!")

default: break
}


// if-case range matching pattern
if case 0...49 = examResult {
    print("2. Fail!")
} else if case 50...100 = examResult {
    print("2. Pass!")
}


// Tuples matching pattern
let userInfo = (id: "petersmith", name: "Peter Smith", age: 18, email: "simon")

if case (_, _, 0..<18, _) = userInfo {
    print("3. You're not allowed to register an account because you're below 18.")
} else if case (_, _, _, let email) = userInfo where email == "" {
    print("3. Your email is blank. Please fill in your email address.")
} else {
    print("3. You are good to go!")
}
