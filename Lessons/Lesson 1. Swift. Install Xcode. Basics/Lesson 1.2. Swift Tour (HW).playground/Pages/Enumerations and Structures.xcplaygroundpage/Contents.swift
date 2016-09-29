/*:
 ## Enumerations and Structures (Перечисления и структуры)
 */
//:
//: Используйте оператор `enum` для создания перечислений. Подобно классам и другим именованным типам, перечисления могут иметь связанные с ним методы.
//:
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
    
            case .Jack:
                return "jack"
            
            case .Queen:
                return "queen"
            
            case .King:
                return "king"
            
            default:
                return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
//:
/*:
 * experiment:
 Напишите функцию, сравнивающую два `Rank` значения, с помощью сравнения их исходных `(raw)` значений.
*/
//:
//: По умолчанию, язык `Swift` назначает `raw` значения, которые начинаются с нуля и увеличивает их на единицу для каждого следующего элемента, но вы можете изменить такое поведение компилятора путем явного указания новых значений. В приведенном выше примере для элемента `Ace` значение `raw` равно "1", после чего остальные значения `raw` присваиваются по возрастающему порядку. Для этих целей Вы также можете использовать строки или числа с плавающей запятой. Используйте свойство `rawValue`, чтобы получить доступ к значению `raw` элементов перечисления.
//:
//: Используйте инициализатор `init?(rawValue:)` для того, чтобы создать экземпляр перечисления из исходного значения:
//:
if let convertedRank = Rank(rawValue: 11) {
    let threeDescription = convertedRank.simpleDescription()
}
//:
//: Значения элементов перечисления - это реальные значения, а не просто еще один способ написания исходных значений. Фактически, в тех случаях, когда нет четкого представления об исходном значении, вы можете их не писать.
//:
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
   
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            
            case .Hearts:
                return "hearts"
            
            case .Diamonds:
                return "diamonds"
            
            case .Clubs:
                return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
//:
/*:
 * experiment:
 Добавьте метод `color` для перечисления `Suit`, который должен возвращать `"black"` для `Spades` и `Clubs`; `"red" для `Hearts` и `Diamonds`.
 */
//:
//: Обратите внимание на два способа обращения к элементам перечисления `Hearts` выше. Во время присвоения значения константе `Hearts` обращение к элементу перечисления `Suit.Hearts` происходит через его полное имя, поскольку константа не имеет явно указанного типа. Внутри `switch` обращение к перечислению происходит через сокращённую форму `.Hearts`, потому что значение `self` уже известно, и оно равно `Suit`. Вы можете использовать сокращенную форму каждый раз, когда тип значения известен.
//:
//: Используйте оператор `struct` для создания структур. Структуры поддерживают многие характерные черты классов, в том числе методы и инициализаторы. Одно из наиболее важных различий между классами и структурами состоит в том, что структуры в случае передачи в коде всегда копируются, а классы передаются по ссылке.
//:
struct Card {
    var rank: Rank
    var suit: Suit
   
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//:
/*:
 * experiment:
 Для структуры `Card` добавьте метод, который создаст полную колоду карт, с одной картой из каждой комбинации ранга (`rank`) и масти (`suit`).
*/
//: Экземпляр элемента перечисления может иметь значения, связанные с экземпляром. Экземпляры одинаковых элементов перечисления могут иметь разные значения, связанные с ним. Вы указываете связанные значения, когда создаете экземпляр. Связанные значения и исходные значения - это разные понятия. Исходное значение элемента перечисления одно и то же для всех экземпляров, вы указываете исходное значение, когда объявляете перечисление.
//:
//: Например, рассмотрим случай с запросом времени восхода и заката солнца у сервера. Сервер либо возвращает информацию, либо возвращает ошибку.
//:
enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch success {
    case let .Result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    
    case let .Failure(message):
        print("Failure...  \(message)")
}
//:
/*:
 * experiment:
 Добавьте третий случай `case` в пречисление `ServerResponse` и в оператор `switch`.
 */
//:
//: Обратите внимание, как время восхода (`sunrise`) и заката (`sunset`) извлекаются из перечисления `ServerResponse` и в блоках `case` у оператора `switch`.
//:
/*:
 
 */
//: [Objects and Classes](@previous) | [Protocols and Extensions](@next)
