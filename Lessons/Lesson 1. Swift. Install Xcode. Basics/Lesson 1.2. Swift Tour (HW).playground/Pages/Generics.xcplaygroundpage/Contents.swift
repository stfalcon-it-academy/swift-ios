/*:
 ## Generics (Универсальные типы)
 */
//:
//: Напишите имя внутри угловых скобок, чтобы создать универсальную (`generic`) функцию или тип.
//:
import Foundation

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    
    return result
}

repeatItem("knock", numberOfTimes:4)
//:
//: Вы можете создать универсальные формы для функций, методов, классов, перечислений и структур.
//:
// Повторно реализовать опционный тип стандартной библиотеки Swift
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
//:
//: Используйте `where` после названия типа, чтобы указать список требований: потребовать реализации протокола; потребовать идентичности двух типов; потребовать, чтобы класс имел определенный суперкласс.
//:
func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }

    return false
}

anyCommonElements([1, 2, 3], [3])
//:
/*:
 * experiment:
 Модифицируйте функцию `anyCommonElements(_:_:)` так, чтобы она возвращала массив из элементов, общих для обеих последовательностей.
 */
//:
//: Запись `<T: Equatable>` эквивалентна записи `<T where T: Equatable>`.
//:
/*:
 
 */
//: [Error Handling](@previous) | [Home Work](@next)
