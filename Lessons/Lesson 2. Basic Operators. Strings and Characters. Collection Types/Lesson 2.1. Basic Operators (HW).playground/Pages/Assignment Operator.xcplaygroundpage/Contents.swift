/*: ## Assignment Operator (Оператор присваивания) */
//:
//: Оператор присваивания `(a = b)` инициализирует или изменяет значение переменной `a` на значение `b`:
//:
import UIKit

let b = 10
var a = 5
a = b
//:
//: Если правая часть выражения является кортежем, то его элементы можно присвоить сразу нескольким константам или переменным:
//:
let (x, y) = (1, 2)
x
y
//:
/*:
 В отличие от `C` и `Objective-C` оператор присваивания в языке `Swift` не возвращает значение. Например, следующее выражение недопустимо:

    if x = y {
        // это неверно, так как оператор присваивания `x = y` не возвращает никакого значения
    }

 
 Эта особенность не позволяет разработчику спутать оператор присваивания `(=)` с оператором проверки на равенство `(==)`. Благодаря тому, что выражения типа `(if x = y)` некорректны, подобные ошибки при программировании на `Swift` не произойдут.
 */
//:
/*: */
//: [Terminology](@previous) | [Examples. Assignment Operator](@next)
