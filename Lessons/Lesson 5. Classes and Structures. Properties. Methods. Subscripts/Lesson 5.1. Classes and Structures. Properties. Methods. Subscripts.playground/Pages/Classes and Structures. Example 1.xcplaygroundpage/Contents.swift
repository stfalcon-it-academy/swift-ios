/*: ## Classes and Structures. Example 1 (Классы и структуры. Пример 1) */
//:
/*: [Классы и Структуры](https://www.youtube.com/watch?v=ucERofjMZRE&index=23&list=PL6724Ll8v6UhOq6Otjw-rUPFsZVmoCLFm) */
//:


import Foundation


// Пример использования кортежа
let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student2.name

let student3 = (nam:"Sam", ag: 23)

student3.nam



// Класс - это инструкция по создания экземпляра какого-то объекта

// Пример создания класса:
class StudentClass {
    var name: String
    var age: Int
    
    // Инициализатор без параметров
    init() {
        name = "No Name"
        age = 20
    }
    
    // Конструкторы необходимы для инициализации свойств класса начальными значениями, если они не `optional`!
    // Инициализатор с параметрами
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


// Пример создания структуры:
struct StudentStruct {
    var name: String
    var age: Int
}


// Пример поведения функции для класса
func addOneYear(student: StudentClass) {
    student.age += 1
    student
}

func addOneYear(var student: StudentStruct) {
    student.age += 1
    student
}

let stClass1 = StudentClass(name: "Bob", age: 18)

stClass1.name = "Alex"
stClass1.age = 21

// Структура автоматически создает инициализатор с о всеми объявленными свойствами
var stStruct1 = StudentStruct(name: "Sam", age: 24)

//stStruct1.name = "Sam2"
//stStruct1.age = 21

stStruct1

var stStruct2 = stStruct1

stStruct2.age = 25
stStruct2.name = "Samuel"

// Структуры при создании копируются - это поведение типа Значение
stStruct2
stStruct1

// Классы при создании создают ссылку на один и тот же экземпляр - это поведение типа Ссылка
var stClass2 = stClass1

stClass2.age = 20
stClass2.name = "AAA"

stClass2
stClass1

stStruct1
addOneYear(stStruct1)
stStruct1

stClass1
addOneYear(stClass1)
stClass1


// Пример создания массива структур
// При изменении значения в массиве значение исходного типа структуры не изменится
var arrayStructs = [stStruct1]
arrayStructs[0]
arrayStructs[0].age = 50
arrayStructs[0]
stStruct1


// Пример создания массива классов
// При изменении значения в массиве изменится значение ссылочного объекта в памяти
var arrayClasses = [stClass1]
arrayClasses[0]
arrayClasses[0].age = 50
arrayClasses[0]
stClass1
