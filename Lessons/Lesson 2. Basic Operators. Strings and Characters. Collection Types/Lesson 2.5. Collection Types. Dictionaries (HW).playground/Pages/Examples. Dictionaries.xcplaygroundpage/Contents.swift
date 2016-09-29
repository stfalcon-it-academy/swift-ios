/*: ##  () */
//:

import Foundation

/*: *Пример объявления словаря* */
//:
// [KeyType : ValueType]
var dictionary1: [String : Int]

var dictionary2: [String : Int] = [
                                        "one"   :   1,
                                        "two"   :   2,
                                        "three" :   3
                                    ]
//:
/*: *Пример объявления пустого словаря* */
//:
var emptyDictionary: [Int : Int] = [:]
//:
/*: *Примеры доступа к элементам словаря* */
//:
var stringsAsInts: [String : Int] = [
                                        "zero"  :   0,
                                        "one"   :   1,
                                        "two"   :   2,
                                        "three" :   3,
                                        "four"  :   4,
                                        "five"  :   5,
                                        "six"   :   6,
                                        "seven" :   7,
                                        "eight" :   8,
                                        "nine"  :   9
                                    ]

stringsAsInts["zero"]
stringsAsInts["three"]
stringsAsInts["ten"]

// Unwaraping the optional using optional binding
if let twoAsInt = stringsAsInts["ten"] {
    print(twoAsInt)
} else {
    print("nil")
}

// Unwaraping the optional using the forced value operator (!)
stringsAsInts["one"]!


var userInfo: [String : String] = [
                                    "first_name"    :   "Andrei",
                                    "last_name"     :   "Puni",
                                    "job_title"     :   "Mad scientist"
                                ]

for (key, value) in userInfo {
    print("\(key): \(value)")
}
//:
/*: *Пример использования свойства count* */
//:
print(userInfo.count)
//:
/*: *Пример внесения изменений в словарь* */
//:
var stringsAsInts1: [String : Int] = [
                                        "zero"  :   0,
                                        "one"   :   1,
                                        "two"   :   2
                                    ]

// Добавить новый элемент
stringsAsInts1["three"] = 3
stringsAsInts1

// Изменить существующий элемент
stringsAsInts1["three"] = 10
stringsAsInts1

// Заменяет значение элемента и возвращает его замененное значение с типом optional
stringsAsInts1.updateValue(3, forKey: "three")
stringsAsInts1.updateValue(10, forKey: "three")

// Удалить существующий элемент
stringsAsInts["three"] = nil
stringsAsInts.removeValueForKey("three")
//:
/*: *Пример использования словаря для кодирования/декодирования строки* */
//:
let code = [
                "a" : "b",
                "b" : "c",
                "c" : "d",
                "d" : "e",
                "e" : "f",
                "f" : "g",
                "g" : "h",
                "h" : "i",
                "i" : "j",
                "j" : "k",
                "k" : "l",
                "l" : "m",
                "m" : "n",
                "n" : "o",
                "o" : "p",
                "p" : "q",
                "q" : "r",
                "r" : "s",
                "s" : "t",
                "t" : "u",
                "u" : "v",
                "v" : "w",
                "w" : "x",
                "x" : "y",
                "y" : "z",
                "z" : "a"
            ]

var message = "hello world"

func encodeMessage(message: String) -> String {
    var encodedMessage = ""
    
    for char in message.characters {
        let character = "\(char)"
        
        if let encodedChar = code[character] {
            // letter
            encodedMessage += encodedChar
        } else {
            // space
            encodedMessage += character
        }
    }

    return encodedMessage
}

func decodeMessage(message: String) -> String {
    var decoder: [String : String] = [:]
    
    // reverse the code
    for (key, value) in code {
        decoder[value] = key
    }
    
    var decodedMessage = ""
    
    for char in message.characters {
        let character = "\(char)"
        
        if let encodedChar = decoder[character] {
            // letter
            decodedMessage += encodedChar
        } else {
            // space
            decodedMessage += character
        }
    }
    
    return decodedMessage
}

print("1. message \"\(message)\" encoded to \"\(encodeMessage(message))\"")

message = "uijt nfttbhf jt ibse up sfbe"

print("2. message \"\(message)\" decoded to \"\(decodeMessage(message))\"")
//:
/*: *Пример совместного использования массивов и словарей* */
//:
var people: [[String:Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 23
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

func compareScores(first: [String:Any], second: [String:Any]) -> Bool {
    if let a = first["score"] as? Int {
        if let b = second["score"] as? Int {
            return a > b
        }
    }
    return false
}

people.sortInPlace(compareScores)

for (index, person) in people.enumerate() {
    if let firstName = person["firstName"] as? String {
        if let lastName = person["lastName"] as? String  {
            if let score = person["score"] as? Int {
                print("\(index + 1). \(firstName) \(lastName) - \(score)")
            }
        }
    }
}

people
//:
/*: */
//: [Dictionaries](@previous) | [Home Work](@next)
