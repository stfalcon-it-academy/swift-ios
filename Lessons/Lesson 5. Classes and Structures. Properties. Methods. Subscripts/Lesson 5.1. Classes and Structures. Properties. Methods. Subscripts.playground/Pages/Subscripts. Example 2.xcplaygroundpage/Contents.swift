/*: ## Subscripts. Example 2 (Индексы. Пример 2) */
//:
/*: [Сабскрипты](http://metanit.com/swift/tutorial/3.5.php) */


import Foundation


// Классы, структуры и перечисления могут определять сабскрипты (subscripts). 

// Сабскрипты используются для доступа к элементам коллекции или последовательности. 

// Сабскрипты позволяют обращаться с классом или структурой как с отдельной коллекцией.


// Создадим класс библиотеки. Упрощенно библиотека представляет некоторый набор книг. То есть мы можем представить класс библиотеки как коллекцию книг и использовать сабскрипты для получения книг по индексу:
class Book {
    var name: String
    
    init(name: String){
        self.name = name
    }
}

class Library {
    var books = [Book]()
    
    init() {
        books.append(Book(name: "Война и мир"))
        books.append(Book(name: "Отцы и дети"))
        books.append(Book(name: "Чайка"))
    }
    
    subscript(index: Int) -> Book {
        // Получить объект `Book` по индексу из массива `books`
        get {
            return books[index]
        }
        
        // Изменить объект `Book` в массиве `books`
        set(newValue) {
            books[index] = newValue
        }
    }
}

var myLibrary = Library()
var firstBook = myLibrary[0]
print(firstBook.name)

myLibrary[2] = Book(name: "Мартин Иден")
print(myLibrary[2].name)

myLibrary.books[2].name