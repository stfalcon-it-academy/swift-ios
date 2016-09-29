/*:
 ## Control Flow (Управление потоком)
 */
//:
//: Для создания условий используйте операторы `if` и `switch`, а для создания циклов - операторы `for-in`, `for`, `while` и `repeat-while`. Скобки вокруг условий и циклов не обязательны. Фигурные скобки вокруг тела условия или цикла — обязательны.
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

//: В операторе `if` условие должно соответствовать `Boolean` выражению — это означает, что такой код, как `if score {…}` ошибочный, поскольку никакого неявного сравнения с нулем не будет.
//:
//: Вы можете использовать `if` и `let` вместе, чтобы работать со значениями, которые могут отсутствовать. Эти значения представлены как опциональные. Опциональные значения либо содержат значение, либо содержат `nil`, который обозначает отсутствие значения. Для указания опционального типа значения применяется вопросительный знак (`?`).
//:
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}
//:
/*:
 * experiment:
 Поменяйте `optionalName` на `nil`. Какое приветствие вы получите? Добавьте `else` условие, которое установит другое приветствие, если `optionalName` равно `nil`.
 */
//:
//: Если опциональное значение `nil`, то условие считается ложным и код в фигурных скобках опускается. В противном случае, опциональное значение извлекается и назначается константе `let`, что делает его доступным внутри блока кода.
//:
//: Другой способ обработки опциональных значений - это предоставление дефолтного значения, используя оператор `??`. Если опциональное значение отсутствует вместо него будет использовано его дефолтное значение.
//:
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi, \(nickName ?? fullName)"

//: `Switch` поддерживает любые данные и множество операторов сравнения, которые не ограничены целыми числами и сравнениями.
//:
let vegetable = "red pepper"

switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")

    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    
    default:
        print("Everything tastes good in soup.")
}
//:
/*:
 * experiment:
 Попробуйте удалить блок `default`. Какую ошибку вы получите?
 */
//:
//: Обратите внимание как значение `let` используется в качестве параметра для проверки условия?
//:
//: После исполнения блока кода внутри соответствующей ветки `switch case` программа выходит из оператора `switch`. Исполнение не переходит к следующей ветке `сase` - это означает, что не нужно прерывать `switch` после каждого блока `case` при помощи оператора `break`.
//:
//: Вы можете использовать `for-in`, чтобы выполнить итерацию по элементам словаря, указывая пару имен для каждой пары ключ-значение.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)
//:
/*:
 * experiment:
 Добавьте другую переменную, чтобы посмотреть какое число самое большое, а также из какой последовательности будет это число.
 */
//:
//: Используйте `while`, чтобы повторять код, пока условие не изменится. Чтобы выполнить блок кода хотя-бы один раз необходимо поместить выражение условия после закрывающей фигурной скобки тела цикла.
//:
var n = 2

while n < 100 {
    n = n * 2
}

print(n)

var m = 2

repeat {
    m = m * 2
} while m < 100

print(m)
//:
//: Для цикла `for` Вы можете проверять индекс на вхождение в диапазон допустимых значений при помощи оператора `..<`.
//:
var total = 0

for i in 0..<4 {
    total += i
}

print(total)
//:
//: Используйте оператор `..<` при создании диапазона, который будет игнорировать последнее значение и оператор `...` – для создания диапазона, включающего в себя оба значения: и начальное и конечное.
//:
/*:
 
 */
//: [Simple Values](@previous) | [Functions and Closures](@next)
