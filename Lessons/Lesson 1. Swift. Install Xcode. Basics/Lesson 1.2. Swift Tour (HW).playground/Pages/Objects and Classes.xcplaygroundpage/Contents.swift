/*:
 ## Objects and Classes (Объекты и классы)
 */
//:
//: Чтобы создать класс используйте оператор `class` с его именем. Объявление свойства класса производится аналогично, как и объявление константы или переменной, за исключением случая, когда они объявляются в пределах класса. Методы класса объявляются так же, как и функции.
//:
class Shape {
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//:
/*:
 * experiment:
 Используя `let` добавьте неизменяемое свойство класса. Кроме того, создайте новый метод с одним входящим параметром.
 */
//:
//: Экземпляры класса создаются с помощью добавления скобок после имени класса. Получить доступ к свойствам и методам класса можно через точку.
//:
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//:
//: В этой версии класса `Shape` отсутствует что-то важное, а именно `инициализатор`. Он нужен для того, чтобы при создании очередного экземпляра предварительно подготовить класс. Для этой задачи применяется оператор `init`.
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
       self.name = name
    }

    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}
//:
//: Обратите внимание, как используется ключевое слово `self`, чтобы различать свойство класса `name` от одноименного аргумента `name` инициализатора. Аргументы инициализатору передаются как вызов функции при создании экземпляра класса. Каждому свойству должно присваиваться значение: либо через объявление (как в случае со свойством `numberOfSides`), либо через инициализатор (как в случае со свойством `name`).
//:
//: Прежде, чем объект будет освобожден используйте метод `deinit` для создания деинициализатора, который выполнит заданную работу по его очистке.
//:
//: Подклассы отделяются от имени родительского класса двоеточием. Для классов нет необходимости каждый раз писать родительский класс, его можно включить по мере необходимости.
//:
//: Методы подкласса, которые переопределяют родительские методы, выделяются при помощи оператора `override`. При попытке переопределения без использования `override` компилятор выдаст сообщение об ошибке. Компилятор также умеет определять методы с `override`, которые на самом деле таковыми не являются.
//:
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() ->  Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()
//:
/*:
 * experiment:
 Создайте еще один подкласс `NamedShape` под названием `Circle`. Он должен принимать значения `radius` и `name` в качестве входных аргументов для совей инициализации. Для класса `Circle` реализуйте методы `area()` и `simpleDescription()`.
 */
//:
//: В дополнение к простым хранящимся свойствам последние могут также иметь методы `getter` и `setter`.
//:
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
//:
//: Для свойства `perimeter` в методе `setter` используется неявное значение с именем `newValue`. Вы можете явно указать другое имя, указав его в скобках после `set`.
//:
//: Обратите внимание, что инициализатор подкласса `EqualiateralTriangle` выполняет три разных действия:
//:
//: 1. Устанавливает значение для 2-х объявленных подклассом свойств.
//:
//: 2. Вызывает родительский инициализатор.
//:
//: 3. Изменяет значения объявленных родителем свойств. В этом месте могут быть выполненые любые вспомагательные работы по начальной установке с использованием методов, `getter`-ов или `setter`-ов.
//:
//: Если вам не нужно вычислять свойство, но по прежнему нужно предоставить код, который будет запущен до и после установки нового значения - используйте `willSet` и `didSet`. Например, ниже в коде класс проверяет равенство длины стороны треугольника и длины стороны его квадрата:
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//:
//: Когда вы работаете с опциональными значениями, вы можете разместить `?` перед такими операциями как: методы, свойства или сабскрипты. Если значение перед `?` равно `nil`, то все что после `?` игнорируется и значение всего выражения становится `nil`. В противном случае, опциональное значение извлекается и все, что расположено после `?` выполняется. В обоих случаях значение всего выражения является опциональным значением.
//:
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
//:
/*:
 
 */
//: [Functions and Closures](@previous) | [Enumerations and Structures](@next)
