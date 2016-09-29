/*: ## Optional Chaining (Опциональная последовательность) */
//:
/*: [Optional Chaining](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245) */
/*: [Опциональная последовательность](http://swiftbook.ru/doc/optional-chaninig)  */


import Foundation


//: ### Optional Chaining (Опциональная последовательность)

// Опциональная последовательность (optional chaining) - процесс запросов и вызовов свойств, методов, сабскриптов (индексов) у опционала, который может быть nil. 

// Если опционал содержит какое-либо значение, то вызов свойства, метода или сабскрипта будет успешен.
// Если опционал равен `nil`, то вызов свойства, метода или сабскрипта возвращает `nil`.

// Множественные запросы могут быть соединены вместе, и вся цепочка этих запросов не срабатывает, если хотя бы один запрос равен nil.



//: ### Optional Chaining as an Alternative to Forced Unwrapping (Опциональная последовательность как альтернатива принудительному извлечению)

class Person {
    // Хранимое опциональное свойство
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

// Экземпляр `john` имеет свойство `residence`, значение которого `nil`
john.residence


// Ошибка runtime: `residence` не имеет значения для извлечения
//let roomCount = john.residence!.numberOfRooms

// Пример использования опциональной последовательности (ОП) - установите вместо восклицательного вопросительный знак.
// В константу возвращается значение свойства из опционального экземпляра:
func check() {
    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
}

check()


// Инициализируем опциональное свойство начальным значением:
john.residence = Residence()
check()



//: ### Defining Model Classes for Optional Chaining (Определение классовых моделей для опциональной последовательности)

// Можно использовать ОП для вызова свойств, методов и сабскриптов, которые находятся ниже первого уровня глубины.
class Person1 {
    // Хранимое опциональное свойство
    var residence: Residence1?
}

class Residence1 {
    // Хранимое свойство типа массив экземпляров `Room`
    var rooms = [Room]()
    
    // Вычисляемое свойство
    var numberOfRooms: Int {
        return rooms.count
    }
    
    // Опциональное хранимое свойство
    var address: Address?

    // Сокращенный вариант доступа к массиву `rooms`
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
    
        set {
            rooms[i] = newValue
        }
    }
    
    // Метод экземпляра выводит на экран количество комнат в резиденции.
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

class Room {
    let name: String
    
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}



//: ### Accessing Properties Through Optional Chaining (Доступ к свойствам через опциональную последовательность)

// Можно использовать ОП для доступа к свойству опционального значения и проверить результат доступа к этому свойству на успешность.

func check1() {
    if let roomCount = john1.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
}

let john1 = Person1()
check1()

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"

// Ошибка runtime: `john.residence` все еще равен `nil`
//john.residence?.address = someAddress



//: ### Calling Methods Through Optional Chaining (Вызов методов через опциональную последовательность)

// Вы можете использовать опциональную последовательность для вызова метода опциональной величины, и проверить сам вызов метода на успешность.
// Вы можете сделать это, даже если этот метод не возвращает значения.

if john1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

// Попытка присвоить значение опциональному свойству `address` через ОП:
if (john1.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}



//: ### Accessing Subscripts Through Optional Chaining (Доступ к индексам через опциональную последовательность)

// Вы можете использовать опциональную последовательность для того, чтобы попробовать получить и установить значения из индекса опционального значения, и проверить успешность выполнения вызова сабскрипта.

// Из-за того, что `john.residence` является `nil`, то вызов сабскрипта проваливается:
if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


// `john1.residence` все еще равен `nil`, поэтому значение присвоено не будет:
john1.residence?[0] = Room(name: "Bathroom")



// Пример создания 2-х комнат и обращения к сабскрипту через ОП:
let johnsHouse = Residence1()
johnsHouse.rooms.append(Room(name: "Гостиная"))
johnsHouse.rooms.append(Room(name: "Кухня"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[0].name {
    print("Название первой комнаты \(firstRoomName).")
} else {
    print("Никак не получить название перовой комнаты.")
}



//: ### Accessing Subscripts of Optional Type (Получение доступа к сабскрипту (индексу) опционального типа)

// Если сабскрипт возвращает значение опционального типа, например ключ словаря типа Dictionary, то мы должны поставить вопросительный знак после закрывающей скобки сабскрипта, для присоединения его опционального возвращаемого значения:

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]

testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72



//: ### Linking Multiple Levels of Chaining (Соединение нескольких уровней ОП)

// Можно соединить несколько уровней опциональных последовательностей вместе для того, чтобы пробраться до свойств, методов, сабскриптов, которые находятся глубже в модели.

if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john1.residence!.address = johnsAddress

if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}



//: ### Chaining on Methods with Optional Return Values (Прикрепление методов к ОП с опциональными возвращаемыми значениями)

if let buildingIdentifier = john1.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}


// Пример опциональной привязки метода, поскольку он возвращает опциональное значение:
if let beginsWithThe = john1.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}

