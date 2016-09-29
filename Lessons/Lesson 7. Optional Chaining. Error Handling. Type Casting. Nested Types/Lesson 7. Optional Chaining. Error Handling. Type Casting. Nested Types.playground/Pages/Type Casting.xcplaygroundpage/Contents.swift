/*: ## Type Casting (Приведение типов) */
//:
/*: [Type Casting](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html#//apple_ref/doc/uid/TP40014097-CH22-ID338) */
/*: [Приведение типов](http://swiftbook.ru/doc/type-casting) */


import Foundation


//: ### Type Casting (Приведение типов)

// Приведение типов - это способ проверить тип экземпляра и/или способ обращения к экземпляру так, как если бы он был экземпляром суперкласса или подкласса откуда-либо из своей собственной классовой иерархии.

// Приведение типов в Swift реализуется с помощью операторов is и as. 
// Эти два оператора предоставляют простой и выразительный способ проверки типа значения или преобразование значения к другому типу.
// Также можно использовать приведение типов для проверки соответствия типа протоколу.



//: ### Defining a Class Hierarchy for Type Casting (Определение классовой иерархии для приведения типов)

// Можно использовать приведение типов с иерархией классов и подклассов, чтобы проверить тип конкретного экземпляра класса и преобразовать тип этого экземпляра в тип другого класса в той же иерархии.

// Пример базового класса
class MediaItem {
    // Хранимое свойство
    var name: String
    
    // Инициализатор
    init(name: String) {
        self.name = name
    }
}

// Создание подклассов
class Movie: MediaItem {
    var director: String
 
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// В заданном массиве Swift выведет тип `MediaItem`
// Хотя элементы массива имеют типы `Movie` и `Song`
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]



//: ### Checking Type (Проверка типа)

// Оператор проверки типа возвращает `true`, если экземпляр имеет тип конкретного подкласса и `false` - если нет.

// Счетчики соответствующих экземпляров классов
var movieCount = 0
var songCount = 0

for item in library {
    // Использование оператора `is` для проверки типа подкласса
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("В Media библиотеке содержится \(movieCount) фильма и \(songCount) песни")


//: ### Downcasting (Понижающее приведение)

// Опциональная форма (as?) оператора понижающего приведения возвращает опциональное значение типа, к которому вы пытаетесь привести. 
// Применяется в случаях, когда нет уверенности в том, что понижающее приведение выполнится успешно. 
// Оператор возвращает либо опциональное значение либо `nil`, если понижающее приведение не выполнимо.

// Принудительная форма (as!) оператора понижающего приведения принудительно разворачивает результат.
// Применяется в случаях, когда есть 100% уверенность в том, что понижающее приведение будет успешно выполнено.

for item in library {
    // Использование оператора опциональной формы `as?` для понижающего приведения текущего элемента к типу подкласса `Movie`
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}


//: ### Type Casting for Any and AnyObject (Приведение типов для Any и AnyObject)

// Swift предлагает два типа псевдонима типа для работы с неопределенными типами:
//     1. `AnyObject` может отобразить экземпляр любого класса.
//     2. `Any` может отобразить экземпляр любого типа, включая функциональные типы.



//: ### AnyObject

// Пример создания массива с типом `[AnyObject]`, который содержит три экземпляра класса `Movie`:
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

// Есть 100% гарантия того, что все элементы массива имебт тип `Movie` - используется принудительная форма `as!`
print()

for object in someObjects {
    let movie = object as! Movie
    
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}


// Вариант 2 - принудительно понизить приведение не отдельных элементов, а самого массива к типу `Movie`:
print()

for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}



//: ### Any

// Пример создания массива для хранения элементов с различными типами:
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


// Несколько `case` конструкции `switch` привязывают элементы массива к константе определенного типа, для того, чтобы потом можно было вывести значение на экран:
for thing in things {
    switch thing {
    // Целое число
    case 0 as Int:
        print("zero as an Int")
   
    // Десятичное число
    case 0 as Double:
        print("zero as a Double")
    
    // Целое цисло
    case let someInt as Int:
        print("an integer value of \(someInt)")
    
    // Десятичное число
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    
    // Десятичное число
    case is Double:
        print("some other double value that I don't want to print")
    
    // Строка
    case let someString as String:
        print("a string value of \"\(someString)\"")
    
    // Кортеж
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    
    // Класс "Кино"
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    
    // Замыкание
    case let stringConverter as String -> String:
        print(stringConverter("Michael"))
    
    default:
        print("something else")
    }
}
