/*: ## Logical Operators (Логические операторы) */
//:
/*:
 **Логические операторы** изменяют или комбинируют логические значения типа `Boolean` (булево) — `true` и `false`. Язык `Swift`, как и другие C-подобные языки, поддерживает три стандартных логических оператора:
 * логическое НЕ (`!a`)
 * логическое И (`a && b`)
 * логическое ИЛИ (`a || b`)
*/
/*:
 
 */
//: ### Logical NOT Operator (Оператор логического НЕ)
//:
//: **Оператор логического НЕ** (`!a`) инвертирует булево значение — `true` меняется на `false`, а `false` становится равным `true`.
//:
//: Оператор логического НЕ является **префиксным** и ставится непосредственно перед значением, без пробела. Как видно из следующего примера, его можно воспринимать как `не a`:
//:
import Foundation

let allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}
//:
//: Конструкция `if !allowedEntry` означает `если не allowedEntry`. Идущая за ней строка будет выполнена, только если `не allowedEntry` является истиной, т.е. если `allowedEntry` равно `false`.
//:
//: Как видно из этого примера, удачный выбор булевой константы и имен переменных делает код кратким и понятным, без двойных отрицаний и громоздких логических выражений.
//:
/*:
 
*/
//: ### Logical AND Operator (Оператор логического И)
//:
//: **Оператор логического И** (`a && bм) дает на выходе `true` тогда и только тогда, когда оба его операнда также равны `true`.
//:
//: Если хотя бы один из них равен `false`, результатом всего выражения тоже будет `false`. На самом деле, если первое значение равно `false`, то второе даже не будет анализироваться, так как оно все равно не изменит общий результат на `true`. Такой подход называется *краткой проверкой условия (short-circuit evaluation)*.
//:
//: В следующем примере проверяются два значения типа `Bool`, и если они оба равны `true`, программа разрешает доступ:
//:
let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//:
/*:
 
*/
//: ### Logical OR Operator (Оператор логического ИЛИ)
//:
//: **Оператор логического ИЛИ** (`a || b`) является **инфиксным** и записывается в виде двух вертикальных палочек без пробела. С его помощью можно создавать логические выражения, которые будут давать `true`, если хотя бы один из операндов равен `true`.
//:
//: Как и описанный выше *оператор логического И*, *оператор логического ИЛИ* использует краткую проверку условия. Если левая часть выражения с логическим ИЛИ равна `true`, то правая не анализируется, так как ее значение не повлияет на общий результат.
//:
//: В приведенном ниже примере первое значение типа `Bool` (`hasDoorKey`) равно `false`, а второе (`knowsOverridePassword`) равно `true`. Поскольку одно из значений равно `true`, результат всего выражения тоже становится `true` и доступ разрешается:
//:
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//:
/*:
 
 */
//: ### Combining Logical Operators (Комбинирование логических операторов)
//:
//: Можно также составлять и более сложные выражения из нескольких логических операторов:
//:
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//:
//: В этом примере с помощью нескольких операторов `&&` и `||` составляется более длинное и сложное выражение. Однако операторы `&&` и `||` по-прежнему применяются только к двум величинам, поэтому все выражение можно разбить на три простых условия. Алгоритм работы будет следующим:
//:
//: если пользователь правильно ввел код дверного замка и прошел сканирование сетчатки или если он использовал действующую ключ-карту или если он ввел код экстренного доступа, то дверь открывается.
//:
//: Исходя из значений `enteredDoorCode`, `passedRetinaScan` и `hasDoorKey` первые два подусловия дают `false`. Однако был введен код экстренного доступа, поэтому все составное выражение по-прежнему равно `true`.
//:
/*:
 * note:
 В Swift логические операторы `&&` и `||` являются левоориентированными, т.е. в сложных выражениях с несколькими логическими операторами в первую очередь оценивается крайнее левое подвыражение.
*/
//:
/*:
 
 */
//: ### Explicit Parentheses (Явное указание круглых скобок)
//:
//: Иногда имеет смысл использовать дополнительные круглые скобки, чтобы сложное логическое выражение стало проще для восприятия. В примере с открытием двери можно заключить в круглые скобки первую часть составного выражения, что сделает его нагляднее:
//:
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//:
//: Круглые скобки показывают, что первые две величины составляют одно из возможных значений всего логического выражения. Хотя результат составного выражения не изменится, такая запись сделает код понятнее. Читаемость кода всегда важнее краткости, поэтому желательно ставить круглые скобки везде, где они облегчают понимание.
//:
/*:
 
*/
//: [Examples. Range Operators](@previous) | [Examples. Logical Operators](@next)
