import Foundation

/*: ## Protocol Extensions */

extension String {
    func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }
}
