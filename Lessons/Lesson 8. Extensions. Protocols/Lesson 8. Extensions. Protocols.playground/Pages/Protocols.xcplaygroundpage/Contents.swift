/*: ## Protocols (Протоколы) */
//:
/*: [Protocols](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267) */
/*: [Протоколы](http://swiftbook.ru/doc/protocols) */


import Foundation


//: ### Protocols (Протоколы)

// Протокол определяет образец методов, свойств или другие требования, которые соответствуют определенному конкретному заданию или какой-то функциональности.
// Протокол может быть принят классом, структурой или перечислением для обеспечения фактической реализации этих требований. 
// Любой тип, который удовлетворяет требованиям протокола, имеет указание соответствовать этому протоколу.



//: ### Protocol Syntax (Синтаксис протокола)

/*:
    protocol SomeProtocol {
        // определение протокола…
    }
 */

// Пользовательские типы утверждают, что они принимают протокол, когда они помещают имя протокола после имени типа и разделяются с этим именем двоеточием, то есть указывают эти протоколы как часть их определения. 
// После двоеточия вы можете указывать множетсво протоколов, перечисляя их имена через запятую:

/*:
    struct SomeStructure: FirstProtocol, AnotherProtocol {
        // определение конструкции…
    }
 */

// Если у класса есть суперкласс, то вписывайте имя суперкласса до списка протоколов, которые он принимает, так же разделите имя суперкласса и имя протокола запятой:
/*:
    class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
        // определение класса…
    }
 */



//: ### Property Requirements (Требуемые свойства)

// Требуемые свойства всегда объявляется как переменные свойства, с префиксом `var`. 
// Свойства, значения которых вы можете получить или изменить маркируются как `{ get set }` после объявления типа свойства.
// Свойства, значения которых можно только получить, но не изменить маркируются как `{get}`.
/*:
    protocol SomeProtocol {
        var mustBeSettable: Int { get set }
        var doesNotNeedToBeSettable: Int { get }
    }
 */

// Пример протокола с единственным требуемым свойством экземпляра:
protocol FullyNamed {
    var fullName: String { get }
}

// Пример структуры, которая принимает и полностью соответствует протоколу `FullyNamed`:
struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")


// Пример сложного класса, который соответствует протоколу `FullyNamed`:
class Starship: FullyNamed {
    // Хранимые свойства
    var prefix: String?
    var name: String
    
    // Инициализатор
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    // Реализация вычисляемого требуемого свойства из протокола `FullyNamed` с маркировкой только для чтения `{ get }`
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName



//: ### Method Requirements (Требуемые методы)

// Пример протокола с единственным требуемым методом экземпляра:
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    // Реализация требуемого метода из протокола `RandomNumberGenerator`
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()

print("Случайное число: \(generator.random())")
print("Другое случайное число: \(generator.random())")



//: ### Mutating Method Requirements (Требуемые изменяющие методы)

// Метод `toggle` имеет слово `mutating` как часть определения протокола `Togglable` для отображения того, что этот метод меняет состояние соответствующего протоколу экземпляра при своем вызове:
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    
    // Реализация требуемого изменяемого метода из протокола `Togglable`
    mutating func toggle() {
        switch self {
        case Off:
            self = On
      
        case On:
            self = Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()



//: ### Initializer Requirements (Требуемые инициализаторы)

// Иногда протоколы могут требовать реализацию конкретного инициализатора типами соответствующими протоколу.
/*:
    protocol SomeProtocol {
        init(someParameter: Int)
    }
 */



//: ### Class Implementations of Protocol Initializer Requirements (Реализация класса, соответствующего протоколу с требованием инициализатора)

// Пример реализации требуемого инициализатора `init` из протокола `SomeProtocol` для базового класса
// Использование ключевого слова `required` гарантирует соблюдение требований данного протокола всеми наследуемыми от суперкласса подклассами
// Поэтому все подклассы тоже будут соответствовать требованиям протокола `SomeProtocol`
/*:
    class SomeClass: SomeProtocol {
        required init(someParameter: Int) {
            // реализация инициализатора…
        }
    }
 */

// Пример одновременного применения модификаторов `required` и `override` для обозначения факта переопределения подклассом назначенного суперклассом инициализатора `init()`
protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // реализация инициализатора…
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" от соответствия протоколу SomeProtocol
    // "override" от суперкласса SomeSuperClass
    required override init() {
        // реализация инициализатора…
    }
}



//: ### Failable Initializer Requirements (Требуемые проваливающиеся инициализаторы)

//



//: ### Protocols as Types (Протоколы как типы)

// Протоколы могут использоваться:
//     1. Как тип параметра или возвращаемый тип в функции, методе, инициализаторе
//     2. Как тип константы, переменной или свойства
//     3. Как тип элементов массива, словаря или другого контейнера

// Пример использования протокола в качестве типа:
class Dice {
    let sides: Int
    
    // Хранимое свойство, тип которого должен соответствовать требованиям протокола `RandomNumberGenerator`,
    // т.е. реализовать метод `random()`, возвращающий тип `Double`
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Бросок игральной кости \(d6.roll())")
}



//: ### Delegation (Делегирование)

// Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность (функциональность) экземпляру другого типа.
// Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.

// Пример определения двух протоколов для использования в играх, основанных на бросках игральных костей.
// Протокол `DiceGame` является протоколом, который может быть принят любой игрой, которая включает игральную кость.
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

// Протокол `DiceGameDelegate` может быть принят любым типом для отслеживания прогресса `DiceGame`:
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}


//: ### Adding Protocol Conformance with an Extension (Добавление соответствия протоколу через расширение)

// Пример протокола, который обязывает реализовать метод вывода текстового описания
protocol TextRepresentable {
    var textualDescription: String { get }
}

// Класс `Dice` может быть расширен для принятия и соответствия протоколу `TextRepresentable`:
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)



//: ### Declaring Protocol Adoption with an Extension (Принятие протокола через расширение)

// Если тип уже соответствует всем требованиям протокола, но еще не заявил об этом - создайте пустое расширение:
struct Hamster {
    var name: String
    
    var textualDescription: String {
        return "Хомяка назвали \(name)"
    }
}

// Чтобы объявить о соответствии требованиям протокола `TextRepresentable` можно создать пустое расширение
extension Hamster: TextRepresentable {}


// Принятие протокола должно быть объявлено в явной форме.
let simonTheHamster = Hamster(name: "Фруша")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)



//: ### Collections of Protocol Types (Коллекции типов протокола)

// Протоколы могут использовать в качестве типов, хранимых в массивах и словарях.

// Пример создания массива из элементов типа, поддерживаемых требования протокола `TextRepresentable`:
let things: [TextRepresentable] = [d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}



//: ### Protocol Inheritance (Наследование протокола)

// Протокол может наследовать один или более других протоколов и может добавлять требования поверх тех требований протоколов, которые он наследует.
/*:
    protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
        // определение протокола…
    }
 */

// Пример протокола, который наследует протокол `TextRepresentable`:
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}



//: ### Class-Only Protocols (Классовые протоколы)

// В Swift  можно ограничить протокол так, чтобы его могли принимать только классы (а не структуры или перечисления), добавив ключевое слово `class` к списку наследования протокола. 
// Слово `class` всегда должно появляться на первом месте списка наследования, до того, как будут вписаны наследуемые протоколы:
/*:
    protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
        // определение протокола типа class-only
    }
 */



//: ### Protocol Composition (Композиция протоколов)

// В Swift можно скомбинировать несколько протоколов в одно единственное требование при помощи композиции протоколов. 
// Композиция протоколов имеет следующую форму: protocol<SomeProtocol, AnotherProtocol>.

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person1: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("С Днем Рождения, \(celebrator.name)! Тебе уже \(celebrator.age)!")
}

let birthdayPerson = Person1(name: "Сашка", age: 21)
wishHappyBirthday(birthdayPerson)



//: ### Checking for Protocol Conformance (Проверка соответствия протоколу)

// Операторы `is` и `as` импользуются для проверки соответствия протоколу и приведению к определенному протоколу. 
// Приведение к протоколу проходит точно так же, как и приведение к типу:
//      1. Оператор `is` возвращает значение `true`, если экземпляр соответствует протоколу и возвращает `false`, если нет.
//      2. Опциональная версия оператора понижающего приведения `as?` возвращает опциональное значение типа протокола и это значение равно `nil`, если оно не соответствует протоколу.
//      3. Принудительная версия оператора понижающего приведения `as` осуществляет принудительное понижающее приведение и если оно не завершается успешно, то выскакивает `runtime` ошибка.

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    
    // Вычисляемое свойство согласно требований протокола `HasArea`
    var area: Double { return pi * radius * radius }
    
    // Инициализатор
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    // Вычисляемое свойство согласно требований протокола `HasArea`
    var area: Double
   
    // Инициализатор
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
   
    // Инициализатор
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

// Пример использования проверки соответствия протоколу `HasArea` элементов массива:
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Площадь равна \(objectWithArea.area)")
    } else {
        print("Что-то такое, что не имеет площади")
    }
}



//: ### Optional Protocol Requirements (Опциональные требования протокола)

// Опциональные требования должны иметь префиксный модификатор `optional` в качестве части определения протокола. 
// При использовании опционального требования свойства или метода их тип автоматически становится опциональным.

@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}



//: ### Protocol Extensions (Расширения протоколов)

// Протоколы могут быть расширены для обеспечения метода и реализации свойства соответствующими типами.

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator1 = LinearCongruentialGenerator()
print("Рандомное число: \(generator1.random())")
print("Рандомное логическое значение: \(generator1.randomBool())")



//: ### Providing Default Implementations (Обеспечение реализации по умолчанию (дефолтной реализации))

// В Swift можно использовать расширение протокола, чтобы обеспечить реализацию по умолчанию для любого метода или требования свойства этого протокола

extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}



//: ### Adding Constraints to Protocol Extensions (Добавление ограничений к расширениям протоколов)

// Все ограничения записываются сразу после имени протокола при помощи оговорки `where`.

extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)

