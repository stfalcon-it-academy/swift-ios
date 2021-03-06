/*: ## Unicode Representations of Strings (Отображение строк Юникода) */
//:
//: Если строка Юникода записывается в текстовый файл или какое-либо другое хранилище, то скалярные величины Юникода в этой строке кодируются в одном из нескольких Юникод-определенных форм кодирования. Каждая форма кодирует строку мелкими кусками, известными как единица кода. Сюда включены: UTF-8 форма кодирования (которая кодирует строку в 8-битные блоков кода), UTF-16 форма кодирования (которая кодирует строку в качестве 16-битных блоков кода), и UTF-32 форма кодирования (которая кодирует строку в 32-битные единицы кода).
//:
//: `Swift` предоставляет несколько разных способов доступа к отображению строк Юникода. Вы можете итерировать строки с циклом `For-In` для получения их индивидуальных `Character` значений как расширенных кластеров графем.
//:
/*:
 Кроме того, доступ к `String` значению в одном из трех других Юникод-совместимых отображений:
 
 
 * набор UTF-8 единиц кода (можно получить доступ через свойство строки - utf8)
 
 
 * набор UTF-16 единиц кода (можно получить доступ через свойство строки - utf16 )
 
 
 * набор 21-битных скалярных значений Юникода, что эквивалентно форме кодирования UTF-32 (доступ через свойство строки - unicodeScalars)
 
 
 Каждый пример, приведенный ниже показывает разное отображение следующей строки, которая состоит из символов `'D'`, `'o'`, `'g'`, `'!!'` (`"DOUBLE EXCLAMATION MARK"`, `"U+203C"`) и 🐶 (`"DOG FACE"`, `"U+1F436"`) или скалярной величины Юникода `U+203C`, и 🐶 символа (`DOG FACE` или скалярной величине Юникода `U+1F436`):
*/
import Foundation

let dogString = "Dog‼🐶"
//:
/*:
 
 */
//: ### UTF-8 Representation (Отображение UTF-8)
//:
//: Вы можете получить доступ к UTF-8 отображению `String` при помощи итерации по свойству utf8. Это свойство типа `String.UTF8View`, которое представляет собой набор из беззнаковых 8-битных (`UInt8`) значений, по одному для каждого байта в строковом отображении UTF-8:
//:
//: ![Table 1](1.png)
//:
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}

print("")
//:
//: В приведенном выше примере, первые три десятичных `codeUnit` значения (`68`, `111`, `103`) отображают символы `D`, `o` и `g`, чье UTF-8 отображение такое же, как и в ASCII отображении. Следующие три десятичных `codeUnit` значения (`226`, `128`, `188`) являются трехбайтным UTF-8 отображением символа `DOUBLE EXCLAMATION MARK`. Последние четыре `codeUnit` значения (`240`, `159`, `144`, `182`) являются четырехбайтным UTF-8 отображением символа `DOG FACE`.
//:
/*:
 
 */
//: ### UTF-16 Representation (Отображение UTF-16)
//:
//: Вы можете получить доступ к UTF-16 отображению `String` при помощи итерации по свойству utf16. Это свойство типа `String.UTF16View`, которое представляет собой набор из безнаковых 16-битных (`UInt16`) значений, по одному для каждой 16-битной единицы кода в строковом отображении UTF-16:
//:
//: ![Table 2](2.png)
//:
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}

print("")
//:
//: И опять первые три десятичных codeUnit значения (`68`, `111`, `103`) отображают символы `D`, `o` и `g`, чье UTF-16 отображение такое же, как и в строковом отображении UTF-8 (потому что эти скалярные величины Юникода отображают ASCII символы).
//:
//: Четвертое `codeUnit` значение (`8252`) является десятичным эквивалентом шестнадцатеричного `203C`, которое отображает скалярную величину Юникода `U+203C` для символа `DOUBLE EXCLAMATION MARK`. Этот символ может быть отображен в виде самостоятельной единицы кода в UTF-16.
//:
//: Пятое и шестое codeUnit значение (`55357` и `56374`) являются суррогатной парой UTF-16 отображения символа `DOG FACE`. Эти значения имеют «высоко суррогатное» значение `U+D83D` (с десятичным значением `55357`) и «низко суррогатное» значение `U+DC36` (с десятичным значением `56374`).
/*:
 
 */
//: ### Unicode Scalar Representation (Отображение скалярных величин Юникода)
//:
//: Вы можете получить доступ к отображению скалярных величин Юникода с помощью итерации по его свойству `unicodeScalars`. Это свойство  `UnicodeScalarView` типа, представляющее собой набор значений `UnicodeScalar` типа.
//:
//: Каждый `UnicodeScalar` имеет `value` свойство, которое возвращает свое 21-битное значение, представленное типом `Uint32`:
//:
//: ![Table 3](3.png)
//:
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}

print("")
//:
//: Свойства `value` первых трех десятичных `codeUnit` значений (`68`, `111`, `103`) снова отображают символы `D`, `o` и `g`.
//:
//: Четвертое `codeUnit` значение (`8252`) снова является десятичным эквивалентом шестнадцатеричного `203C`, которое отображает скалярную величину Юникода `U+203C` для символа `DOUBLE EXCLAMATION MARK`.
//:
//: Свойства `value` пятого и последнего `UnicodeScalar` (`128054`) являются десятичным эквивалентом шестнадцатеричного значения `1F436`, которое отображает скалярную величину Юникода `U+1F436` для символа `DOG FACE`.
//:
//: В качестве альтернативы для запросов свойств `value` каждое `UnicodeScalar` значение также может быть использовано для построения нового `String` значения, например, с помощью интерполяции строк:
//:
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
//:
//:
/*: */
//: [Comparing Strings](@previous) | [Home Work](@next)
