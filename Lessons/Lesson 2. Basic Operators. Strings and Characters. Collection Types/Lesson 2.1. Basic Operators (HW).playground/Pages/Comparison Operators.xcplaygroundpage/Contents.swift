/*: ## Comparison Operators (Операторы сравнения) */
//:
/*:
 Язык `Swift` поддерживает все стандартные операторы сравнения из `C`:
 * равно (`a == b`)
 * не равно (`a != b`)
 * больше (`a > b`)
 * меньше (`a < b`)
 * больше или равно (`a >= b`)
 * меньше или равно (`a <= b`)
*/
//:
/*:
 * note:
 В языке `Swift` есть также два оператора проверки на равенство (`===`) и (`!==`), определяющие, ссылаются ли два указателя на один и тот же экземпляр объекта.
*/
//:
//: Каждый оператор сравнения возвращает значение типа `Bool`, указывающее, является ли выражение истинным:
//:
import Foundation

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1
//:
//: Операторы сравнения часто используются в условных выражениях, включая конструкцию `if`:
//:
let name = "World"

if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
//:
//: Вы так же можете сравнивать кортежи, которые имеют одно и то же количество значений, которые, в свою очередь, должны быть сравниваемыми, т.е. кортеж типа `(Int, String)` может быть сравнен с кортежем такого же типа. Если в кортеже содержится значение типа `Bool`, то такой кортеж нельзя сравнить, т.к. логическое значение нельзя сравнивать.
//:
//: Кортежи сравниваются слева направо, по одному значению за раз до тех пор, пока операция сравнения не найдет отличия между значениями. Если все значения кортежей попарно равны, то и кортежи так же считаются равными. Например:
//:
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
//:
/*:
 * note:
 Стандартная библиотека `Swift` включает в себя операторы сравнения кортежей, которые имеют менее семи значений. Если вам нужны операторы, которые могут сравнивать кортежи с более, чем шестью элементами, то вам нужно реализовать их самостоятельно.
*/
//:
/*:
 
*/
//: [Examples. Compound Assignment Operators](@previous) | [Examples. Comparison Operators](@next)
