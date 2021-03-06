/*: ## Performing Set Operations (Выполнение операций `Set`) */
//:
//: Вы можете очень эффективно использовать базовые операции множества, например, комбинировать значения из двух множеств, определять общие значения из двух множеств, определять содержат ли множества несколько, все или ни одного одинаковых значения.
/*: */
//: ### Fundamental Set Operations (Базовые операции `Set`)
//:
//: Приведенные ниже иллюстрации изображают различные результаты использования разных методов к двум множествам `a` и `b`.
//:
//: ![Диаграмма 1](1.png)
//:
/*:
 * метод `intersect(_:)` используется для создания нового множества из общих значений двух входных множеств.
 
 
 * метод `exclusiveOr(_:)` используется для создания нового множества из значений, которые не повторяются во входных множествах.
 
 
 * метод `union(_:)` используется для создания нового множества, состоящего из всех значений обоих множеств.
 
 
 * метод `subtract(_:)` используется для создания множества со значениями, исключительно принадлежащих только одному из множеств.
 */
//:
import Foundation

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
//:
/*: */
//: ### Set Membership and Equality (Взаимосвязь и равенство множеств)
//:
//: Приведенная ниже иллюстрация отображает три множества `a`, `b` и `c`. Множество `a` является надмножеством множества `b`, так как содержит все его элементы, соответственно множество `b` является подмножеством множества `a`, опять таки потому, что все его элементы входят в `a`. Множества `b` и `c` называются **разделенными**, так как у них нет общих элементов.
//:
//: ![Диаграмма 2](2.png)
//:
/*:
 * оператор равенства (`==`) применяется для определения все ли значения двух множеств одинаковы.
 
 
 * метод `isSubsetOf(_:)` применяется для определения является ли множество подмножеством другого множества.
 
 
 * метод `isSupersetOf(_:)` применяется для определения является множество надмножеством другого множества.
 
 
 * методы `isStrictSubsetOf(_:)` и `isStrictSupersetOf(_:)` применяются для определения является ли множество подмножеством или надмножеством, но не равным указанному множеству.
 
 
 * метод `isDisjointWith(_:)` применяется для определения наличия общих значений в двух множествах.
 */
//:
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)
//:
/*: */
//: [Sets](@previous) | [Examples. Sets](@next)
