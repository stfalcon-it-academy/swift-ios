/*: ## Comparing Strings (Сравнение строк) */
//:
//: Язык `Swift` предусматривает три способа сравнения текстовых значений: равенство строк и символов, равенство префиксов и равенство суффиксов.
//:
/*: */
//: ### String and Character Equality (Равенство строк и символов)
//:
//: Равенство строк и символов проверяется оператором "равенства" (`==`) и оператором "неравенства" (`!=`), которые мы уже рассмотрели на уроке **Операторы сравнения**:
//:
import Foundation

let quotation = "Мы с тобой похожи"
let sameQuotation = "Мы с тобой похожи"

if quotation == sameQuotation {
    print("Эти строки считаются равными")
}
//:
//: Два `String` значения (или два `Character` значения) считаются равными, если их расширенные кластеры графем канонически эквивалентны. Расширенные кластеры графем канонически эквивалентны, если они имеют один и тот же языковой смысл и внешний вид, даже если они изначально состоят из разных скалярных величин Юникода.
//:
//: Например,  `LATIN SMALL LETTER E WITH ACUTE` или `U+00E9` канонически эквивалентна `LATIN SMALL LETTER E` или `U+0065`, если за ней следует `COMBINING ACUTE ACCENT` или `U+0301`. Оба этих расширенных кластера графем являются допустимыми вариантами представления символа `é` и поэтому они считаются канонически эквивалентными:
//:
// "Voulez-vous un café?" используем LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" используем LATIN SMALL LETTER E и COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("Эти строки считаются равными")
}
//:
//: Наоборот, `LATIN CAPITAL LETTER A` или `U+0041` или `"A"`, используемый в английском языке не является эквивалентом `CYRILLIC CAPITAL LETTER A` или `U+0410` или `"А"`, используемой в русском языке. Символы визуально похожи, но имеют разный языковой смысл:
//:
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("Эти строки считаются не равными")
}
//:
/*:
 * note:
 Сравнение строк и символов в `Swift` не зависит от локализации.
 */
//:
/*:
 
 */
//: ### Prefix and Suffix Equality (Равенство префиксов и суффиксов)
//:
//: Чтобы проверить, имеет ли строка определенный строковый префикс или суффикс, вызовите соответственно методы `hasPrefix(_:)` и `hasSuffix(_:)`, каждый из которых принимает единственный аргумент типа `String` и возвращает логическое значение.
//:
//: В приведенных ниже примерах рассмотрим массив строк, представляющих местоположение сцены в первых двух актах `Ромео и Джульетты Шекспира`:
//:
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
//:
//: Вы можете использовать метод `hasPrefix(_:)` с массивом `romeoAndJuliet` для подсчета количества сцен в первом акте пьесы:
//:
var act1SceneCount = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("В Акте 1 всего \(act1SceneCount) сцен")
//:
//: Точно так же, использование метода `hasSuffix(_:)` для подсчета количества сцен, которые происходят внутри или вокруг особняка Капулетти и клетки монаха Лоренцо:
//:
var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) сцен в особняке; \(cellCount) тюремные сцены")
//:
/*:
 * note:
 Методы `hasPrefix(_:)` и `hasSuffix(_:)` используются для символ-к-символу канонического эквивалентного сравнения между расширенными кластерами графем в каждой строке.
 */
//:
/*: */
//: [Accessing and Modifying a String](@previous) | [Unicode Representations of Strings](@next)
