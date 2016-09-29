import Foundation

/*: ## for-in where clauses */

let numbers = [20, 18, 39, 49, 68, 230, 499, 238, 239, 723, 332]

for number in numbers where number > 100 {
    print(number)
}