/*: ## Home Work (Домашнее задание) */
//:
/*: [Textual Representation for Classes in Swift](https://vperi.com/2014/06/04/textual-representation-for-classes-in-swift/) */
//:


import Foundation
import UIKit


// Classes and Structures
// 1.1. Создайте структуру Студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct Student {
    let firstName: String
    let lastName: String
    let birthdayYear: Int
    let averageScore: Double
}

let student1 = Student(firstName: "Sergey", lastName: "Ivanov", birthdayYear: 1994, averageScore: 10.4)
let student2 = Student(firstName: "Irina", lastName: "Petrova", birthdayYear: 1995, averageScore: 11.9)
let student3 = Student(firstName: "Pavel", lastName: "Gurov", birthdayYear: 1993, averageScore: 8.89)
let student4 = Student(firstName: "Alex", lastName: "Ivanov", birthdayYear: 1997, averageScore: 10.2)
let student5 = Student(firstName: "Dasha", lastName: "Simonova", birthdayYear: 1994, averageScore: 7.77)
let student6 = Student(firstName: "Semen", lastName: "Dorofeev", birthdayYear: 1991, averageScore: 9.39)

let journal = [student1, student2, student3, student4, student5, student6]
print("1.1.", journal)
print("--------------------------------------------------\n")


// 1.2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
func printJournal(journal: [Student]) {
    for (index, value) in journal.enumerate() {
        print("\(index +  1).", "Student -", value.firstName, value.lastName, ", avarage score =", value.averageScore)
    }
}

print("1.2.")
printJournal(journal)
print("--------------------------------------------------\n")


// 1.3. С помощью функции sorted отсортируйте массив по среднему баллу по убыванию и распечатайте “журнал”.
let journalSortedScore = journal.sort { (student1, student2) -> Bool in
    student1.averageScore > student2.averageScore
}

print("1.3. Sorted journal by score = ", journalSortedScore)
print("--------------------------------------------------\n")


// 1.4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые (задайте 2 и более при создании студентов), то сравниваются по имени. Распечатайте “журнал”.
let journalSortedNames = journal.sort { (student1, student2) -> Bool in
    student1.lastName == student2.lastName ? (student1.firstName < student2.firstName) : (student1.lastName < student2.lastName)
}

print("1.4. Sorted journal by names = ", journalSortedNames)
print("--------------------------------------------------\n")


// 1.5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
var journalNew = journal
journalNew[0] = Student(firstName: "Inna", lastName: "Efremova", birthdayYear: 1997, averageScore: 11.11)

print("1.5. Original journal = ", journal[0])
print("1.5. New journal = ", journalNew[0])
print("--------------------------------------------------\n")


// 1.6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5-м задании? Что изменилось и почему?
class StudentClass: CustomStringConvertible {
    var firstName = ""
    var lastName = ""
    var birthdayYear = 1994
    var averageScore = 10.1
    
    var description: String {
        get {
            return firstName + " " + lastName + ", birthday year = " + String(birthdayYear) + ", average score = " + String(averageScore)
        }
    }
    
    init(firstName: String, lastName: String, birthdayYear: Int, averageScore: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdayYear = birthdayYear
        self.averageScore = averageScore
    }
}

let student11 = StudentClass(firstName: "Sergey", lastName: "Ivanov", birthdayYear: 1994, averageScore: 10.4)
let student12 = StudentClass(firstName: "Irina", lastName: "Petrova", birthdayYear: 1995, averageScore: 11.9)
let student13 = StudentClass(firstName: "Pavel", lastName: "Gurov", birthdayYear: 1993, averageScore: 8.89)
let student14 = StudentClass(firstName: "Alex", lastName: "Ivanov", birthdayYear: 1997, averageScore: 10.2)
let student15 = StudentClass(firstName: "Dasha", lastName: "Simonova", birthdayYear: 1994, averageScore: 7.77)
let student16 = StudentClass(firstName: "Semen", lastName: "Dorofeev", birthdayYear: 1991, averageScore: 9.39)

let journalClass = [student11, student12, student13, student14, student15, student16]
print("1.6.1.", journalClass)
print(student15)
print("--------------------------------------------------\n")

// 1.6.5
var journalClassNew = journalClass
journalClassNew[0] = StudentClass(firstName: "Inna", lastName: "Efremova", birthdayYear: 1997, averageScore: 11.11)

print("1.6.5. Original class journal = ", journalClass[0])
print("1.6.5. New class journal = ", journalClassNew[0])
print("--------------------------------------------------\n")

/*
// Properties
// 2.1. Создать структуру “Описание файла” содержащую свойства:
// - путь к файлу
// - имя файла
// - максимальный размер файла на диске
// - путь к папке, содержащей этот файл
// - тип файла (скрытый или нет)
// - содержимое файла (можно просто симулировать контент)
// Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
struct FileDescription {
    let filePath: String
//    let folderPath: String {
////    return filePath.stringByDele
//    }
    
    let name: String
    let hidden: Bool
    let content = "dn jasdajsd jksdfhlashD LUWIE83U849RYFHDajsalkj lkhjhjad jlasjd6176351538 jskah ;dsh"

    var size: Double {
        didSet(newSize) {
            size = newSize > 102400 ? size : newSize
        }
    }
}

// 2.2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
enum Colors: Int {
    static let count = 6
    static let startColor = Colors.Brown
    static let endColor = Colors.Brown
    
    case SaddleBrown = 0x8B4513
    case Sienna = 0xA0522D
    case Brown = 0xA52A2A
    case Maroon = 0x800000
    case Chocolate = 0xD2691E
    
    static func hexToRgb(hex: Int) -> (red: Float, green: Float, blue: Float) {
        return (red: Float((hex >> 16) & 0xFF) / 255, green: Float((hex >> 08) & 0xFF) / 255, blue: Float((hex >> 00) & 0xFF) / 255)
    }
}


// 2.3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
// - минимальный и максимальный возраст каждого объекта
// - минимальную и максимальную длину имени и фамилии
// - минимально возможный рост и вес
// - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
var humansCount = 0

class Human {
    // Stored Properties
    var firstName: String {
        didSet(newValue) {
            if !(self.firstName.characters.count <= self.firstNameMinLength) || !(self.firstName.characters.count >= self.firstNameMaxLength) {
                self.firstName = newValue
            }
        }
    }
    
    let firstNameMinLength = 3
    let firstNameMaxLength = 15
    
    var lastName: String {
        didSet(newValue) {
            if !(self.lastName.characters.count <= self.lastNameMinLength) || !(self.lastName.characters.count >= self.lastNameMaxLength) {
                self.lastName = newValue
            }
        }
    }
    
    let lastNameMinLength = 5
    let lastNameMaxLength = 27

    var age: Int {
        didSet(newValue) {
            switch age {
            case _ where self.age <= self.ageMin:
                self.age = self.ageMin
                
            case _ where self.age >= self.ageMax:
                self.age = self.ageMax
                
            default:
                self.age = newValue
            }
        }
    }
    
    let ageMin = 0
    let ageMax = 120
    
    var height: Double {
        didSet {
            if height < 130 {
                height = oldValue
            }
        }
    }
    
    var weight: Double {
        didSet {
            weight = weight < 31 ? oldValue : weight
        }
    }

    // Constructor
    init(firstName: String, lastName: String, age: Int, height: Double, weight: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        humansCount += 1
    }
}

var human = Human(firstName: "Alex", lastName: "Reva", age: 34, height: 128, weight: 67)
human.height = 109
human.age = 130

var human2 = Human(firstName: "Alex", lastName: "Reva", age: 34, height: 128, weight: 67)
var human3 = human2

print(humansCount)


// Methods
// 3.1. Создайте тип Комната. У комнаты есть размеры `W` на `H`. И создайте тип Персонаж. У него есть координата в комнате `X` и `Y`. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате.


// 3.2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз Этот метод должен передвигать персонажа. Реализуйте правило, что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически.


// 3.3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.


// 3.4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)


// 3.5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)
enum Object: String {
    case Man = "man"
    case Box = "box"
    case Target = "target"
}

struct Point {
    let x: Int
    let y: Int
    
    mutating func moveByX(x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}

enum Direction {
    case Left
    case Right
    case Up
    case Down
}

class Room {
    let width: Int
    let height: Int
    
    let manImage = "\u{1F46B}"
    let wallImage = "\u{2B1B}"
    let boxImage = "\u{1F536}"
    let spaceImage = "\u{2B1C}"
    let targetImage = "\u{1F31F}"
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    // Check point in wall
    func isWall(point: Point) -> Bool {
        var isWall = false
        
        switch point {
        case let p where /*0..<self.height ~= p.y &&*/ (p.x == 0 || p.x == self.width - 1):
            isWall = true
            
        case let p where /*0..<self.width ~= p.x && */(p.y == 0 || p.y == self.height - 1):
            isWall = true

        default:
            break
        }
        
        return isWall
    }
    
    // Print room
    func printRoom() {
        for j in 0..<self.height {
            for i in 0..<self.width {
                let tempPoint = Point(x: i, y: j)
                var tempImage = "?"
                
                if isWall(tempPoint) {
                    tempImage = wallImage
                } else {
                    tempImage = spaceImage
                }
                
                for obj in itemsClass {
                    if obj.position.x == tempPoint.x && obj.position.y == tempPoint.y {
                        switch obj.item {
                        case .Man:
                            tempImage = manImage
                            
                        case .Box:
                            tempImage = boxImage
                            
                        case .Target:
                            tempImage = targetImage
                        }
                    }
                }
                
                print(tempImage, terminator: "")
            }
            
            print()
        }
    }
}

class Item {
    var item: Object
    var max: (x: Int, y: Int)
    
    var position: Point {
        didSet {
            if position.x >= max.x - 1 || position.x <= 0 {
                position = oldValue
            }
            
            if position.y >= max.y - 1 || position.y <= 0 {
                position = oldValue
            }
        }
    }
    
    // Check box in position
    func checkBox(boxInPoint: Point) -> (Bool, Item?) {
        var isBox = false
        var box: Item?
        
        for obj in itemsClass {
            if (obj.position.x == boxInPoint.x) && (obj.position.y == boxInPoint.y) && (obj.item.rawValue == "box") {
                isBox = true
                box = obj
            }
        }
        
        return (isBox, box)
    }
    
    // Push box
    func pushBox(stepBox: Direction, pushItem: Item) -> Bool {
        var isPush = false
        let oldPosition = pushItem.position
        pushItem.go(stepBox)
        
        if pushItem.position.x != oldPosition.x || pushItem.position.y != oldPosition.y {
            isPush = true
        }
        
        return isPush
    }
    
    // Move
    func go(step: Direction) {
        if item == .Man {
            var testPosition = position
            
            switch step {
            case .Up:
                testPosition.moveByX(0, andY: -1)
                let testBox = checkBox(testPosition)
                
                if testBox.0 {
                    if pushBox(step, pushItem: testBox.1!) {
                        position.moveByX(0, andY: -1)
                    }
                } else {
                    position.moveByX(0, andY: -1)
                }
                
            case .Down:
                testPosition.moveByX(0, andY: 1)
                let testBox = checkBox(testPosition)
                
                if testBox.0 {
                    if pushBox(step, pushItem: testBox.1!) {
                        position.moveByX(0, andY: 1)
                    }
                } else {
                    position.moveByX(0, andY: 1)
                }

            case .Left:
                testPosition.moveByX(-1, andY: 0)
                let testBox = checkBox(testPosition)
                
                if testBox.0 {
                    if pushBox(step, pushItem: testBox.1!) {
                        position.moveByX(-1, andY: 0)
                    }
                } else {
                    position.moveByX(-1, andY: 0)
                }
                
            case .Right:
                testPosition.moveByX(1, andY: 0)
                let testBox = checkBox(testPosition)
                
                if testBox.0 {
                    if pushBox(step, pushItem: testBox.1!) {
                        position.moveByX(1, andY: 0)
                    }
                } else {
                    position.moveByX(1, andY: 0)
                }
            }
        } else {
            switch step {
            case .Up:
                position.moveByX(0, andY: -1)
            
            case .Down:
                position.moveByX(0, andY: 1)
                
            case .Left:
                position.moveByX(-1, andY: 0)
                
            case .Right:
                position.moveByX(1, andY: 0)
            }
        }
    }
    
    init(x: Int, y: Int, room: Room, item: Object) {
        position = Point(x: x, y: y)
        max.x = room.width
        max.y = room.height
        self.item = item
        
        itemsClass.append(self)
    }
}

var itemsClass = [Item]()

var room = Room(width: 7, height: 7)
var man = Item(x: 3, y: 2, room: room, item: .Man)
var box = Item(x: 2, y: 3, room: room, item: .Box)
room.printRoom()

man.go(.Down)
room.printRoom()

man.go(.Left)
room.printRoom()

man.go(.Left)
room.printRoom()

man.go(.Right)
room.printRoom()

// Subscripts
// 4.1. Создайте тип шахматная доска.
// 4.2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
// 4.3. Если юзер ошибся координатами - выдавайте нил
struct ChessBoard {
    var hrz: Int = 8
    var ver: Int = 8
    
    subscript(cell: String) -> String? {
        get {
            let v: Int? = Int((cell as NSString).substringFromIndex(1))
            
            var h: Int?
            
            for count in 1...hrz {
                if cell.hasPrefix(String(UnicodeScalar(count + 0x40))) || cell.hasPrefix(String(UnicodeScalar(count + 0x60))) {
                    h = count
                }
            }
            
            if h == nil || v == nil || v > hrz {
                return nil
            }
            
            return h! % 2 == v! % 2 ? "Black" : "White"
        }
    }
}

let board = ChessBoard()
board["h8"]
board["H8"]
board["b1"]
board["h9"]
board["55"]
board["aa"]


// Крестики нолики (Средний уровень)
// 5.1. Создать тип, представляющий собой поле для игры в крестики нолики. На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик. Добавьте возможность красиво распечатывать поле
// 5.2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу, причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
// 5.3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
// 5.4. Если хотите, добавьте алгоритм, который вычислит победителя
enum Figure: String {
    case Cross = "❌"
    case Toe = "⭕️"
    case Empty = "⬜️"
}

struct CrossToe {
    let rows: Int, columns: Int
    var array: [String]
    
    subscript(row: Int, column: Int) -> String? {
        get {
            if isIndexValidForRow(row, andColumn: column) {
                return array[((row - 1) * columns) + column - 1]
            } else {
                return nil
            }
        }
        
        set {
            if isIndexValidForRow(row, andColumn: column) && self[row, column] == "x" {
                array[((row - 1) * columns) + column - 1] = newValue!
                printBoard()
                
                switch check() {
                case Figure.Cross.rawValue:
                    print("Cross Win")
                    
                case Figure.Toe.rawValue:
                    print("Toe Win")
                    
                default:
                    break
                }
            }
        }
    }
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.array = Array(count: rows * columns, repeatedValue: "x")
    }
    
    func isIndexValidForRow(row: Int, andColumn column: Int) -> Bool {
        return 0...rows ~= row && 0...columns ~= column
    }
    
    func printBoard() {
        print("--------------------")
        
        for row in 1...rows {
            for column in 1...columns {
                if self[row, column] != "x" {
                    print(self[row, column]!, terminator: "")
                } else {
                    print(Figure.Empty.rawValue, terminator: "")
                }
            }
            
            print()
        }
    }
    
    func check() -> String {
        for i in 0..<3 {
            if array[i * 3] == array[i * 3 + 1] && array[i * 3 + 1] == array[i * 3 + 2] {
                return array[i]
            } else if array[i] == array[i + 3] && array[i + 3] == array[i + 6] {
                return array[i]
            } else if (array[2] == array[4] && array[4] == array[6]) || (array[0] == array[4] && array[4] == array[8]) {
                return array[i]
            }
        }
        
        return "-"
    }
}

var boardGame = CrossToe(rows: 3, columns: 3)
boardGame[2, 2] = Figure.Cross.rawValue
boardGame[1, 3] = Figure.Toe.rawValue
boardGame[1, 1] = Figure.Cross.rawValue
boardGame[3, 2] = Figure.Toe.rawValue
boardGame[3, 3] = Figure.Cross.rawValue



// 6.1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
// 6.2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
// 6.3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :)
let chars = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]

enum CellType: String {
    case Black = "Black"
    case White = "White"
    case Nil = "Outside Chessboard"
}

struct Chessboard {
    var row = 1
    var column = "a"
    
    subscript(row: Int, column: String) -> CellType.RawValue {
        var result: CellType
        let columnValue = chars[column] ?? 0
        
        if 1...8 ~= row && 1...8 ~= columnValue {
            result = ((columnValue + row) % 2) == 0 ? .Black : .White
        } else {
            result = .Nil
        }
        
        return result.rawValue
    }
}

var cell = Chessboard()
cell[10, "a"]
cell[1, "a"]
cell[5, "f"]

let ddd = UIImage(named: "chess-board.jpg")
*/