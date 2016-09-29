/*: ## Home Work (Домашняя работа) */
//:

import Foundation

/*
/*: Extensions */
// 1.1. Создайте расширение для `Int` со следующими свойствами `isNegative` и `isPositive` типа `Bool`
extension Int {
    // п.1.1
    var isNegative: Bool {
        return self < 0
    }
    
    var isPositive: Bool {
        return !isNegative
    }
    
    // п.1.2.
    var simbolsCount: Int {
        return abs(self).description.characters.count //String(abs(self)).characters.count
    }
    
    // п.1.3.
    subscript(index: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<index {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

var intTest = -3
intTest.isNegative
intTest.isPositive

intTest = 101
intTest.isNegative
intTest.isPositive


// 1.2. Добавьте новое свойство, которое возвращает количество символов в числе
intTest = -87789
intTest.simbolsCount


// 1.3. Добавьте sabscript, который возвращает символ числа по индексу:
// let a = 8245
// a[1]     // 4
// a[3]     // 8
intTest = 8245
intTest[1]
intTest[3]


// 1.4. Расширьте `String`, чтобы принимал сабскрипт вида `s[0..<3]` и мог также устанавливать значения с его помощью
extension String {
    // п.1.4.
    subscript(range: Range<Int>) -> String {
        get {
            guard range.endIndex <= self.characters.count && range.startIndex >= 0 else {
                return "error"
            }
            
            return self.substringWithRange(self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex))
        }
        
        set(newString) {
            self.replaceRange(self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex), with: newString)
        }
    }
    
    // п.1.5.
    mutating func trancate(startIndex: Int) {
        guard startIndex >= 0 && startIndex <= self.characters.count else {
            print("1.5.3. start index is out of string range.")
            return
        }
        
        self[startIndex..<self.characters.count] = "..."
    }
}

var testString = "agkj fjkah djajshdjahsjdhajhdjkash"
testString[1..<8]

print("1.4.1. current testString = \(testString)")
testString[1..<8] = " AMORE MIO "
print("1.4.2. new testString = \(testString)")


// 1.5. Добавьте `String` метод `truncate`, с помощью которого можно удалять лишние символы и, если такие были, заменял их на троеточие:
// let s = "Hi hi hi"
// s.truncate(4)    // Hi h...
// s.truncate(10)   // Hi hi hi

testString = "Hi hi hi"
testString.trancate(7)
print("1.5.1. method 'trancate()' change 'testString' value to '\(testString)'")

testString.trancate(4)
print("1.5.2. method 'trancate()' change 'testString' value to '\(testString)'")

testString.trancate(10)
print()
*/

/*: Protocols */
// 2.1. Объявите протокол `Food`, который будет иметь свойство `name` (read only) и метод `taste()`, который будет выводить текст с описанием вкусовых ощущений.
protocol Food {
    var name: String { get }
    
    func taste() -> String
}

// п.2.3.
protocol Storable: Food {
    // п.2.3.
    var expired: Bool { get }
    
    // п.2.4.
    var daysToExpire: Int { get }
}


// 2.2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол `Food`. Вам нужно пройтись по всем продуктам из сумки, назвать предмет и откусить кусочек. Можете отсортировать продукты по имени. Используйте для этого отдельную функцию, которая принимает массив продуктов.
class Product: Food {
    var name: String
    
    func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString)."
    }
    
    init(name: String) {
        self.name = name
    }
}

extension Array {
    func sorting(items: [Product]) -> [Product] {
        return items.sort { $0.name < $1.name }
    }
}

let days = 14

class Apple: Product {
    
}

class Lemon: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0 : Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Milk: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0 : Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Bread: Product {
    
}

class Meat: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0 : Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Cheese: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0: Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

let products = [Apple(name: "apple"), Meat(name: "meat", expired: arc4random_uniform(2) == 1), Lemon(name: "lemon", expired: arc4random_uniform(2) == 1), Bread(name: "bread"), Cheese(name: "cheese", expired: arc4random_uniform(2) == 1), Milk(name: "milk Danone", expired: arc4random_uniform(2) == 1), Milk(name: "milk Ferma", expired: arc4random_uniform(2) == 1)]
var productsSorted = products.sorting(products)

for product in productsSorted {
    print("2.2. \(product.name.capitalizedString). \(product.taste())")
}

print()



// 2.3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол `Storable`, который наследуется от протокола `Food` и содержит дополнительное свойство `expired` типа `Bool`. У некоторых продуктов замените `Food` на `Storable`. Теперь пройдитесь по всем продуктам и если продукт подлежит хранению в холодильнике - переместите его туда при условии, что данный продукт еще не испорчен. В противном случае выбросьте его в мусор. Используйте специальную функцию для описания содержимого холодильника.
class Refrigerator {
    var productsList = [Product]()
    
    // п.2.3
    func productsListPrint() {
        var list = String()
        
        for product in productsList {
            list += list.isEmpty ? product.name.capitalizedString : ", " + product.name.capitalizedString
        }
        
        print("A list of products from the refrigerator: \(list)")
    }
    
    // п.2.4.
    func productsListSort() {
        self.productsList = productsList.sort({ (item0, item1) -> Bool in
            let product0 = item0 as? Storable
            let product1 = item1 as? Storable
            
            if product0!.daysToExpire == product1!.daysToExpire {
                return product0!.name < product1!.name
            } else {
                return product0!.daysToExpire < product1!.daysToExpire
            }
        })
    }
}

var refrigerator = Refrigerator()
refrigerator.productsList

for product in productsSorted {
    if let item = product as? Storable {
        if item.expired == false {
            refrigerator.productsList.append(product)
        }
    }
}

print("2.3. ", terminator: "")
refrigerator.productsListPrint()
print()


// 2.4. В протокол `Storable` добавьте новое свойство `daysToExpire`. Отсортируйте массив продуктов в холодильнике. В начале отсортированного списка расположите скоропортящиеся продукты. Если у продуктов сроки годности совпадают - отсортируйте их по имени.
refrigerator.productsListSort()

print("2.4. ", terminator: "")
refrigerator.productsListPrint()
print()


// 2.5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы `Storable` не наследовался от `Food`. Мы по прежнему приносим еду домой, только теперь некоторые продукты реализуют (подписаны на) 2 протокола. Холодильник принимает только те продукты, которые еще и `Storable`. Функция сортировки должна по прежнему работать.
// Решение см. на отдельной закладке

