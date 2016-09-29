//: ## Examples. Sets (Примеры. Множества)
//:
/*:
 **Множества**:
 
 * не содержат повторяющихся значений
 
 
 * не сохраняют заданную при вводе последовательность элементов
 
 
 * исользуют hash-коды для проверки на равенство между элементами
 
 
 * содержат набор быстрых логических тестов
 */
import Foundation

//: *Пример создания множества и добавления в него элементов с типом `String`:*
var animals = Set<String>()

animals.insert("cat")
animals.insert("bird")
animals.insert("dog")
animals.insert("dog")

// Множесто хранит только элементы с уникальными значениями.
print(animals.count)

// Второй элемент со значением `dog` не сохранен.
print(animals)



//: *Пример инициализации начального множества:*
//:
// Инициализация пустого множества с типом `String`
var mySet = Set<String>()

// Инициализация изменяемого множества с типом `String` и начальными значениями
var mySet1 = Set(["one", "two", "three"])

// Инициализация неизменяемого множества с типом `String` и начальными значениями
let mySet2 = Set(["one", "two", "three"])

var someSet = Set<String>()
let abcSet: Set = ["A", "B", "C", "D"]
var foodSet = Set(["Salad", "Chips", "Sandwiches"])



//: *Пример добавления новых элементов в множество:*
mySet1.insert("four")
mySet1.insert("five")
mySet1.insert("six")
print(mySet1)



//: *Пример использования свойства `count`:*
print("Множество \"mySet1\" сожержит \(mySet1.count) элементов")



//: *Пример удаления элементов из множества:*
var knownIds = Set<Int>()

knownIds.insert(100)
knownIds.insert(200)
knownIds.insert(300)
knownIds.remove(200)

mySet.insert("car")

mySet.removeFirst()
mySet.removeAll()

foodSet.remove("Chips")
foodSet.insert("Soup")
foodSet.removeAll()



//: *Пример поиска вхождения заданного элемента в множество:*
var contain = mySet1.contains("Two")
contain = mySet1.contains("six")

if knownIds.contains(100) {
    print(true)
}

if !knownIds.contains(200) {
    print(false)
}

foodSet = Set(["Salad", "Chips", "Sandwiches"])
let entreeSet = Set(["Salad", "Sandwiches"])
let sameFoodSet = Set(["Salad", "Chips", "Sandwiches"])
let otherFoods = Set(["Quiche", "Donuts"])

foodSet.contains("Chips")

// Вернет `true`, если множество `entree` является подмножеством `foodSet`.
entreeSet.isSubsetOf(foodSet)

// Вернет `true`, если множество `entree` является подмножеством `foodSet`, а не его точной копией.
sameFoodSet.isStrictSubsetOf(foodSet)

// Вернет `true`, если множество `foodSet` является надмножеством `entreeSet`, т.е. `foodSet` содержит все элементы `entreeSet`.
foodSet.isSupersetOf(entreeSet)

// Вернет `true`, если множество `sameFoodSet` является надмножеством `foodSet`, но не является точной копией.
foodSet.isStrictSupersetOf(sameFoodSet)
foodSet.isStrictSupersetOf(entreeSet)

// Вернет `true`, если оба множества не имеют общих элементов.
foodSet.isDisjointWith(entreeSet)
foodSet.isDisjointWith(otherFoods)



//: *Пример использования цикла `for-in` для итерации по элементам множества:*
var languages = Set<String>()

languages.insert("Swift")
languages.insert("Python")
languages.insert("Ruby")

for language in languages {
    print(language)
}



//: *Пример поиска множества элементов, входящих в оба заданных множества - пересечение:*
let colors1: Set<String> = ["red", "orange", "pink"]
let colors2: Set<String> = ["blue", "red", "pink"]

let intersection = colors1.intersect(colors2)
print(intersection)



//: *Пример поиска множества уникальных элеметов в двух заданных множествах - исключение:*
let subtraction = colors1.subtract(colors2)
print(subtraction)



//: *Пример использования четырех операторов для работы с двумя множествами:*
var mySet3 = Set(["One", "Two", "Three", "abc"])
var mySet4 = Set(["abc","def","ghi", "One"])

// Результат - множество-объединение уникальных элементов из двух множеств
var newSetUnion = mySet3.union(mySet4)

// Результат - множество элементов первого множества, отсутствующих во втором множестве
var newSetSubtract = mySet3.subtract(mySet4)

// Результат - множество элементов, общих для двух заданных множеств
var newSetIntersect = mySet3.intersect(mySet4)

// Результат - множество элементов, не пересекающихся в заданных множествах
var newSetExclusiveOr = mySet3.exclusiveOr(mySet4)
//:
/*: */
//: [Performing Set Operations](@previous) | [Links](@next)
