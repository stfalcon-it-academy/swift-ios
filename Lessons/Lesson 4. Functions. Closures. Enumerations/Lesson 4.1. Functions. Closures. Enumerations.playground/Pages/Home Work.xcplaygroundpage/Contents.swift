/*: ## Home Work (Домашнее задание) */
//:
/*: [Remove Spaces](http://www.miniwebtool.com/remove-spaces/) */


import Foundation
import UIKit


// 1.1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например `heart()` возвращает сердце и т.п. Вызовите все эти функции внутри `print()` для вывода объединенной строки символов с использованием оператора конкатенации.
func redHeart() -> String {
    return "\u{2764}\u{FE0F}"
}

func tomato() -> String {
    return "\u{1F345}"
}

func strawberry() -> String {
    return "\u{1F353}"
}

func redApple() -> String {
    return "\u{1F34E}"
}

func soccerBall() -> String {
    return "\u{26BD}\u{FE0F}"
}

print("1.1. ", redHeart() + tomato() + strawberry() + redApple() + soccerBall())
print("-----------------\n")


// 1.2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая" или “черная". Строку вывести в консоль.
let chars = ["a", "b", "c", "d", "e", "f", "g", "h"]

enum Color: String {
    case White = "White"
    case Black = "Black"
    case None = "None"
}

typealias Cell = (char: String, number: Int)
let chessBoardView1 = UIImage(named: "chess-board.jpg")

func cellColor(cell: Cell) -> String {
    let charIndex = chars.indexOf(cell.char)
    
    if charIndex != nil && (cell.number >= 1 && cell.number <= 8) {
        return charIndex! % 2 != cell.number % 2 ? Color.Black.rawValue : Color.White.rawValue
    } else {
        return Color.None.rawValue
    }
}

print("1.2. Cell color = \(cellColor((char: "h", number: 7)))")
print("-----------------------\n")


// 1.3. Создайте функцию, которая:
// 1.3.1. принимает массив и возвращает его в обратном порядке. 
func reverseArray(array: [String]) -> [String] {
    var arrayTemp = [String]()
    
    for value in array {
        arrayTemp.insert(value, atIndex: 0)
    }
    
    return arrayTemp
}

print("1.3.1.", reverseArray(chars))
print("-----------------------------------------------\n")


// 1.3.2. принимает последовательность и возвращает массив в обратном порядке. 
// Чтобы не дублировать код используйте вызов функции из п.1.3.1.
func reverseSequence(sequence: String...) -> [String] {
    return reverseArray(sequence)
}

print("1.3.2.", reverseArray(["1", "ddd", "sdr" , "qwert", "-4"]))
print("-----------------------------------------------\n")


// 1.4. Используя `inout` измените функцию из п.1.3.1. так, чтобы она не возвращала перевернутый массив, а просто меняла элементы местами в существующем. Что будет, если убрать inout?
var chars1 = ["a", "b", "c", "d", "e", "f", "g", "h"]

func changeArray(inout array: [String]) {
    array
    var arrayTemp = [String]()
    
    for value in array {
        arrayTemp.insert(value, atIndex: 0)
    }
    
    array = arrayTemp
}

changeArray(&chars1)
print("1.4. \(chars1)")
print("-----------------------------------------------\n")


// 1.5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные буквы заглавными, согласные - прописными, а цифры меняет на соответствующие строковые значения (например, 9 -> "nine" и т.д.).
let stringTest = "jdhfjhf98fssd8sdfdsf sadfsdf skdf  ^$#@ /aslkl;akdl;0 -321 112§334@#!$#@$24 ,sdmf,mf,sdm :;|||||±!@#$%^&*()_+=- dfsdsrdfvbnvbvc ADSKLDASKJDKLASJDKJSADKL 9723478625462%%%% -12=3FKVKDMV,AS   asd;l;elo8eyh /////3$$$$er432454t dw"
let numbers = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]
let lettersSpaces = NSCharacterSet.letterCharacterSet()
let simbols = NSCharacterSet.punctuationCharacterSet()
let vowels: [Character: Character] = ["a": "a", "e": "e", "i": "i", "o": "o", "u": "u", "y": "y"]




func modifyString(string: String) -> String {
    var stringTemp = String()
    
    // Remove punctuations simbols
    for char in string.lowercaseString.characters {
        switch char {
        case _ where Int(String(char)) != nil:
            stringTemp.appendContentsOf(numbers[Int(String(char))!]!)
            
        case _ where lettersSpaces.characterIsMember(String(char).utf16.first!):
            if char == vowels[char] {
                stringTemp.appendContentsOf(String(char).uppercaseString)
            } else {
                stringTemp.appendContentsOf(String(char))
            }
            
        case _ where simbols.characterIsMember(String(char).utf16.first!):
            continue
            
        default:
            stringTemp.appendContentsOf(String(char))
        }
    }
    
    return stringTemp
}

print(stringTest)
print("1.5. ", modifyString(stringTest))
print("-----------------------------------------------\n")


// 2.1. Создайте функцию, которая ничего не возвращает и принимает только одно замыкание, которое ничего не принимает и ничего не возвращает. Функция в цикле должна посчитать от 1 до 10, после этого вызвать замыкание. В каждую итерацию цикла и замыкание добавьте `print()` для контроля очередности выполнения команд.
func calculateToTen(f: () -> ()) {
    for i in 1...10 {
        print(i)
    }
    
    f()
}

print(calculateToTen({ 
    print("2.1.\n", terminator: "----------\n")
}))


// 2.2. Используя метод массивов `sorted()` отсортируйте массив `[Int]` по возрастанию и убыванию.
let testArray = [-1, 8, 9, -6, 0, 11]
let sortedArrayAscending = testArray.sort()
let sortedArrayDescending = sortedArrayAscending.sort { $0 > $1 }
sortedArrayDescending


// 2.3. Создайте функцию, которая принимает массив `[Int]`, замыкание и возвращает `Int`. Замыкание должно принимать `Int`, `Int?` и возвращать `Bool`. В самой функции создайте `optional` переменную. В цикле пройдитесь по массиву `[Int]`, используя замыкание сравнивая элементы с `optional` переменной. Если замыкание возвращает `true` - записываете значение массива в переменную. В конце функции возвращайте значение этой `optional` переменной.
func filter(array: [Int], callBack:(Int?, Int) -> Bool) -> Int {
    var number: Int?
    
    for value in array {
        if callBack(number, value) {
            number = value
        }
    }
    
    return number ?? 0
}

let nums = [1, 2, 6, 4, 5, -3, 8 , 0]

let any = filter(nums) { $0 == nil || $0 == $1 }

any



// 2.3.1. Измените функцию из п.2.3. для поиска максимального и минимального элементов массива.
let minValue = filter(nums) { $0 == nil || $0 > $1 }
let maxValue = filter(nums) { $0 == nil || $0 < $1 }
minValue
maxValue


// 2.4. Создайте произвольную строку. Преобразуйте ее в массив `[Character]`. Используя метод массивов `sorted()` отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы.
func priority(string: String) -> Int {
    switch(string.lowercaseString) {
    case "a", "e", "i", "o", "u", "y": return 0
    
    case "a"..."z": return 1
    
    case "0"..."9": return 2
    
    default: return 3
    }
}

var arrayStr = [String]()

for value in stringTest.characters {
    arrayStr.append(String(value))
}

let sorted = arrayStr.sort{
    switch (priority($0), priority($1)) {
    case let(x, y) where x < y:
        return true
        
    case let(x, y) where x > y:
        return false
        
    default:
        return $0.lowercaseString <= $1.lowercaseString
    }
}

print("2.4. sorted = \(sorted)")


/*
// 2.5. Измените функцию из п.2.3. для поиска минимального и максимального символа из массива `[Character]` (поиск ведется по соответствующему символу скалярному значению)
*/


// 3.1. Создайте перечисление с названиями шахматных фигур (король, ферзь и т.д.). Каждая фигура должна иметь цвет (белый, черный), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске так, чтобы черному королю был мат. Поместите эти фигуры в массив фигур.
let chessBoardView = UIImage(named: "mat")

enum ChessPiece: String {
    // Король, королева, ладья, слон, конь, пешка
    case King = "King"
    case Queen = "Queen"
    case Rook = "Rook"
    case Bishop = "Bishop"
    case Knight = "Knight"
    case Pawn = "Pawn"
}

typealias Location = (char: Character, number: Int)
typealias Piece = (name: ChessPiece, color: Color, location: Location, image: Character)

let blackKing: Piece = (name: .King, color: .Black, location: (char: "d", number: 5), image: "\u{265A}")
let blackBishop1: Piece = (name: .Bishop, color: .Black, location: (char: "a", number: 7), image: "\u{265D}")
let blackKnight1: Piece = (name: .Knight, color: .Black, location: (char: "h", number: 7), image: "\u{265E}")
let whitePawn1: Piece = (name: .Pawn, color: .White, location: (char: "a", number: 2), image: "\u{2659}")
let whiteRook1: Piece = (name: .Rook, color: .White, location: (char: "c", number: 1), image: "\u{2656}")
let whiteQueen: Piece = (name: .Queen, color: .White, location: (char: "d", number: 2), image: "\u{2655}")
let whiteKing: Piece = (name: .King, color: .White, location: (char: "d", number: 1), image: "\u{2654}")
let whiteRook2: Piece = (name: .Rook, color: .White, location: (char: "e", number: 1), image: "\u{2656}")
let whiteKnight1: Piece = (name: .Knight, color: .White, location: (char: "h", number: 2), image: "\u{2658}")

let pieces = [blackKing, blackBishop1, blackKnight1, whitePawn1, whiteRook1, whiteQueen, whiteKing, whiteRook2, whiteKnight1]


// 3.2. Сделайте так, чтобы значения перечисления имели `rawValue` типа `String`. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль в виде текста (без `Unicode`) название фигуры, цвет и ее расположение. Используя эту функцию распечатайте все фигуры в массиве.
func printChessPieces(pieces: [Piece]) {
    for (index, piece) in pieces.enumerate() {
        print("\(index + 1). Piece = \"\(piece.color.rawValue)", "\(piece.name.rawValue)\"", "in \"\(String(piece.location.char) + String(piece.location.number))\" position", separator: " ")
    }
}

printChessPieces(pieces)
print("------------------------------------------\n")

/*
// 3.3. Используя красивые `Unicode` представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает).
let whiteCell = "\u{2B1C}"
let blackCell = "\u{FE0F}"

//typealias Cell = 
//func chessBoard(pieces: [Piece]) -> [] {
//    <#function body#>
//}


func printChessBoard(pieces: [Piece]) {
    let chars: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h"]
    
    // Chars
    for x in 0...9 {
        // Numbers
        for y in 0...9 {
            switch y {
            case 1...8 where x == 0 || x == 9:
                print(chars[y - 1], terminator:"")
                
                
            default:
                print(whiteCell)
            }
        }
    }
}

printChessBoard(pieces)


// 3.4. Создайте функцию, которая будет принимать шахматную фигуру и кортеж новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах. Вызовите эту функцию для нескольких фигур и распечатайте поле снова.



// 4.1. Вы работаете над созданием игры, в которой главный персонаж двигается по карте. Входные данные: его начальное положение на карте `var location = (x: 0, y: 0)` и перемещение в шагах - перечисление `var steps: [Direction] = [.Up, .Up, .Left, .Down, .Left]`. Движение `.Up` позволит увеличить координату `x` на `1`, .Down - уменьшит координату `x` на `1`. Шаг `.Right` увеличит координату `y` на `1`, а `.Left` уменьшит `y` на 1. Задание - вывести в консоль координаты нового местоположения персонажа после заданного перемещения. Используйте оператор `switch-case`.
*/


// Enumerations
// 5.1. Добавьте метод `perimeter()` для перечисления `ShapeDimensions`. Этот метод должен вычислить периметр фигуры (периметр равен сумме длин всех сторон заданной фигуры). Убедитесь, что метод обрабатывает все возможные варианты фигур!
enum ShapeDimensions {
    // Point has no associated value - it is dimensionless 
    case Point
    
    // Square's associated value is the length of one side 
    case Square(Double)
    
    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)
    
    // Right Triangle
    case RightTriangle(cathetus1: Double, cathetus2: Double, hypotenuse: Double)
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
            
        case let .Square(side):
            return side * 4
            
        case let .Rectangle(width: w, height: h):
            return (w + h) * 2
            
        case let .RightTriangle(cathetus1: cat1, cathetus2: cat2, hypotenuse: hyp):
            return cat1 + cat2 + hyp
        }
    }
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
            
        case let .Square(side):
            return side * side
            
        case let .Rectangle(width: w, height: h):
            return w * h
            
        case let .RightTriangle(cathetus1: cat1, cathetus2: cat2, hypotenuse: _):
            return 1 / 2 * cat1 * cat2
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width:5.0,height:10.0)
var pointShape = ShapeDimensions.Point

print("5.1. square's area = \(squareShape.area())")
print("5.1. rectangle's area = \(rectShape.area())")
print("5.1. point's area = \(pointShape.area())")

print("5.1.HW. square's perimeter = \(squareShape.perimeter())")
print("5.1.HW. rectangle's perimeter = \(rectShape.perimeter())")
print("5.1.HW. point's perimeter = \(pointShape.perimeter())")

print("----------------------------\n")


// 5.2. В перечисление `ShapeDimensions` добавьте новый `case` для прямоугольного треугольника. Можете игнорировать его ориентацию. Просто следите за длиной всех его трех сторон. Добавление нового `case` заставит `playground` сообщить об ошибке в методе `area()`. Решите эту проблему.
// HW - см. п.5.1.
let rightTriangle = ShapeDimensions.RightTriangle(cathetus1: 31, cathetus2: 22, hypotenuse: 19.7)
print("5.2.HW. right triangle's area = \(rightTriangle.area())")
print("5.2.HW. right triangle's perimeter = \(rightTriangle.perimeter())")

print("----------------------------\n")


// Functions
// 6.1. Оператор `guard` поддерживает использование условия `where`. Измените функцию `greetByMiddleName(_:)` для использования `where` вместе с `guard`. Замените условие `if`, при котором длина отчества менее 4-х символов. Если условие `true` - обратитесь к человеку по отчеству, если `false` - используйте общее приветствие.
func greetByMiddleName(name:(first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("6.1. Hey, there!")
        
        return
    }
    
    print("6.1. Hey, \(middleName)!")
}

greetByMiddleName((first: "Sergey", middle: "Mihaylovich", last: "Monastyrskiy"))
greetByMiddleName((first: "Sergey", middle: nil, last: "Monastyrskiy"))
print("----------------------------\n")


// 6.2. Создайте функцию `beanSifter(_:)`, которая принимает список покупок (в виде массива `[String]`) и "отсеивает" бобы (`beans`) от других продуктов. Функция принимает один аргумент `groceryList` и возвращает кортеж вида `(beans: [String], otherGroceries: [String])`. Вот пример того, как должна вызываться функция и какой результат она должна возвращать:
/*:
    let result = beanSifter(groceryList:["greenbeans",
                                         "milk",
                                         "blackbeans",
                                         "pintobeans",
                                         "apples"])

result.beans == ["greenbeans", "blackbeans", "pintobeans"]\
result.otherGroceries == ["milk", "apples"]
 */
func beanSifter(groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    
    for value in groceryList {
        value.hasSuffix("beans") ? beans.append(value) : otherGroceries.append(value)
    }
    
    return (beans, otherGroceries)
}

let groceryList = ["greenbeans",
                   "milk",
                   "blackbeans",
                   "pintobeans",
                   "apples"
]

let list = beanSifter(groceryList)

print("6.2.", list)
print("----------------------------------------------------------------------\n")


/*
// 7.1. Closures
// Используйте то, что вы узнали в этой главе, чтобы очистить реализации
уменьшить(_:объединить:) представлен выше. Реализация может быть довольно сокращен
существенно: ваше решение должно быть выражено в одну линию. Когда вы закончите, возьмите
посмотрите на пример кода для других высших порядков функции и практики с ними.

Use what you have learned in this chapter to clean up the implementation of
reduce(_:combine:) presented above. The implementation can be shortened quite
significantly: your solution should be expressed in one line. When you are done, take a
look at the sample code for the other higher-order functions and practice with them.
*/
