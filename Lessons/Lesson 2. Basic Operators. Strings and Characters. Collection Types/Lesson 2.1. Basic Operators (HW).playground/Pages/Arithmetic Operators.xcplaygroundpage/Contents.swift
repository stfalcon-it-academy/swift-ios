/*: ## Arithmetic Operators (Арифметические операторы) */
//:
/*:
 Язык `Swift` поддерживает четыре стандартных арифметических оператора для всех числовых типов:

 - Сложение `(+)`
 - Вычитание `(-)`
 - Умножение `(*)`
 - Деление `(/)`
 
 */
//:
import Foundation

1 + 2
5 - 3
2 * 3
10.0 / 2.5
//:
//: В отличие от `C` и `Objective-C` арифметические операторы `Swift` по умолчанию не допускают переполнения типа. Контроль переполнения типа включается в `Swift` специальными операторами: `(a &+ b)`. Подробнее см. урок **Операторы переполнения**.
//:
//: Оператор сложения служит также для конкатенации или "склейки" строковых значений с типом `String`:
//:
"hello, " + "world"
//:
/*:
 
 */
//: ### Remainder Operator (Оператор целочисленного деления)
//:
//: Оператор целочисленного деления `(a % b)` показывает, сколько целых раз значение `b` содержится в `a`, возвращая при этом разницу - `остаток от деления`.
//:
/*:
 - note:
    Оператор целочисленного деления `(%)` в некоторых языках называется оператором деления по модулю. Однако, учитывая его действие над отрицательными числами в `Swift` этот оператор, строго говоря, выполняет деление с остатком, а не по модулю.
*/
//:
//: Оператор целочисленного деления работает следующим образом. Для вычисления выражения `(9 % 4)` сначала определяется, сколько четверок содержится в девятке:
//:
//: ![Пример целочисленного деления](1.png)
//:
//: В одной `девятке` содержатся две `четверки`, а остатком будет `1` (выделено оранжевым цветом).
//:
//: На языке `Swift` это записывается так:
//:
9 % 4
//:
/*: 
 Чтобы получить результат деления `(a % b)`, оператор `(%)` вычисляет следующее выражение и возвращает `остаток`:
 
 `a` = (`b` × `множитель`) + `остаток` ,
 
 где `множитель` показывает, сколько целых раз `b` содержится в `a`.

 Подставляя в это выражение `9` и `4`, получим:

 `9` = (`4` x `2`) + `1`
*/
//:
//: Точно так же рассчитывается `остаток`, когда `a` отрицательно:
-9 % 4
//:
/*:
 Подставляя в наше выражение `-9` и `4`, получим:
 
 `-9` = (`4` x `-2`) + `-1` ,

 причем остаток будет равен `-1`.

 Если `b` отрицательно, его знак отбрасывается. Это означает, что выражения `(a % b)` и `(a % -b)` всегда будут давать одинаковый результат.
*/
/*:
 
*/
//: ### Floating-Point Remainder Calculations (Вычисления целочисленного деления над числами с плавающей запятой)
//:
//: В отличие от `C` и `Objective-C` оператор целочисленного деления в `Swift` поддерживает числа с плавающей запятой:
//:
8 % 2.5
//:
//: В этом примере деление `8` на `2.5` дает `3` с остатком `0.5`, поэтому оператор целочисленного деления возвратит значение `0.5` типа `Double`.
//:
//: ![Пример деления на число с плавающей запятой](2.png)
/*:
 
*/
//: ### Unary Minus Operator (Оператор унарного минуса)
//:
//: Для изменения знака числового значения служит префиксный минус `(-)`, который называется *оператором унарного минуса*:
//:
let three = 3
let minusThree = -three
let plusThree = -minusThree
//:
//: *Оператор унарного минуса* `(-)` ставится непосредственно перед значением, без пробела.
//:
/*:
 
*/
//: ### Unary Plus Operator (Оператор унарного плюса)
//:
//: *Оператор унарного плюса* `(+)` просто возвращает исходное значение без каких-либо изменений:
//:
let minusSix = -6
let alsoMinusSix = +minusSix
//:
//: Хотя *оператор унарного плюса* не выполняет никаких действий, он придает коду единообразие, позволяя зрительно отличать положительные значения от отрицательных.
/*: */
//: [Examples. Assignment Operator](@previous) | [Examples. Arithmetic Operators](@next)
