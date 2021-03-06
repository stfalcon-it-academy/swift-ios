/*: ## String Interpolation (Интерполяция строк) */
//:
//: **Интерполяция строк** - способ создать новое значение типа `String` из разных констант, переменных, литералов и выражений, включая их значения в строковый литерал. Каждый элемент, который вы вставляете в строковый литерал, должен быть помещен в скобки и находиться внутри двойных кавычек литерала, а перед открывающей скобкой должен стоять знак обратного слэша.
//:
import Foundation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//:
//: В приведенном примере значение `multiplier` включено в строку как `\(multiplier)`. В свою очередь `\(multiplier)` заменяется на фактическое значение константы `multiplier`, когда вычисляется интерполяция строки для создания конечного варианта.
//:
//: Значение `multiplier` - это так же часть большего выражения в будущей строке. Это выражение высчитывает значение `Double(multiplier) * 2.5` и вставляет результат `7.5` в строку. В этом случае выражение записанное в виде `\(Double(multiplier) * 2.5)` является строковым литералом.
/*:
 * note:
 Выражение, которое вы пишите внутри скобок в пределах интерполируемой строки, не может содержать обратный слэш (`\`), символ начала новой строки (`\n`) или символ возврат каретки (`\r`). Однако, оно может содержать другие строковые литералы.
 */
//:
/*: */
//: [Concatenating Strings and Characters](@previous) | [Unicode](@next)
