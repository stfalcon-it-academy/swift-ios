/*: ## Compound Assignment Operators (Cоставные операторы присваивания) */
//:
//: Как и в языке `C`, в `Swift` поддерживаются *составные операторы присваивания*, совмещающие простое присваивание `(=)` с другой операцией. Примером может служить *оператор присваивания со сложением* (`+=`):
//:
import Foundation

var a = 1
a += 2
//:
//: Выражение `a += 2` является краткой формой записи `a = a + 2`. Таким образом, один и тот же оператор выполняет одновременно операции сложения и присваивания.
//:
/*:
 * note:
 Составные операторы присваивания не возвращают значение. Например, нельзя написать так: `let b = a += 2`.
*/
//: Полный список операторов присваивания можно найти в **Выражениях**.
//:
/*:
 
*/
//: [Arithmetic Operators](@previous) | [Examples. Compound Assignment Operators](@next)
