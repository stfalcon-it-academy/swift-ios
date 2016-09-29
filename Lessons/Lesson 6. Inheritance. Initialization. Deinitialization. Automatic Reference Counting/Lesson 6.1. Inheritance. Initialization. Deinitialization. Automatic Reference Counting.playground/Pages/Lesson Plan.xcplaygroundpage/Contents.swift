/*: ## Lesson Plan (План лекции) */
//:
/*: [Inheritance](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html#//apple_ref/doc/uid/TP40014097-CH17-ID193) */
/*: [Наследование](http://swiftbook.ru/doc/inheritance) */
//:
/*:
 1. Inheritance (Наследование)
    1. Defining a Base Class (Определение базового класса)
    2. Subclassing (Наследование подклассом)
    3. Overriding (Переопределение)
        1. Accessing Superclass Methods, Properties, and Subscripts (Доступ к методам, свойствам, индексам суперкласса)
        2. Overriding Methods (Переопределение методов)
        3. Overriding Properties (Переопределение свойств)
            1. Overriding Property Getters and Setters (Переопределения геттеров и сеттеров свойства)
            2. Overriding Property Observers (Переопределение наблюдателей свойства)
    4. Preventing Overrides (Предотвращение переопределений)
 
 
 2. Initialization (Инициализация)
    1. Setting Initial Values for Stored Properties (Установка начальных значений для хранимых свойств)
        1. Initializers (Инициализаторы)
        2. Default Property Values (Значения свойств по умолчанию)
    2. Customizing Initialization (Настройка инициализации)
        1. Initialization Parameters (Параметры инициализации)
        2. Local and External Parameter Names (Локальные и внешние имена параметров)
        3. Initializer Parameters Without External Names (Параметры инициализатора без внешних имен)
        4. Optional Property Types (Опциональные типы свойств)
        5. Assigning Constant Properties During Initialization (Изменение константных свойств во время инициализации)
    3. Default Initializers (Дефолтные инициализаторы)
        1. Memberwise Initializers for Structure Types (Почленные инициализаторы структурных типов)
    4. Initializer Delegation for Value Types (Делегирование инициализатора для типов значений)
    5. Class Inheritance and Initialization (Наследование и инициализация класса)
        1. Designated Initializers and Convenience Initializers (Назначенный и вспомогательный инициализатор)
        2. Syntax for Designated and Convenience Initializers (Синтаксис назначенных и вспомогательных инициализаторов)
        3. Initializer Delegation for Class Types (Делегирование инициализатора для классовых типов)
        4. Two-Phase Initialization (Двухфазная инициализация)
        5. Initializer Inheritance and Overriding (Наследование и переопределение инициализатора)
        6. Automatic Initializer Inheritance (Наследование автоматического инициализатора)
        7. Designated and Convenience Initializers in Action (Назначенные и вспомогательные инициализаторы в действии)
    6. Failable Initializers (Проваливающиеся инициализаторы)
        1. Failable Initializers for Enumerations (Проваливающиеся инициализаторы для перечислений)
        2. Failable Initializers for Enumerations with Raw Values (Проваливающиеся инициализаторы для перечислений с начальными значениями)
        3. Propagation of Initialization Failure (Распространение проваливающегося инициализатора)
        4. Overriding a Failable Initializer (Переопределение проваливающегося инциализатора)
        5. The init! Failable Initializer (Проваливающийся инициализатор init!)
    7. Required Initializers (Инициализаторы по запросу)
    8. Setting a Default Property Value with a Closure or Function (Установка значения по умолчанию для свойства типа кортеж или функция)
 

 3. Deinitialization (Деинициализация)
    1. How Deinitialization Works (Как работает деинициализация)
    2. Deinitializers in Action (Деинициализаторы в действии)
 
 
 4. Automatic Reference Counting (Автоматический подсчет ссылок (ARC))
    1. How ARC Works (Работа ARC)
    2. ARC in Action (ARC в действии)
    3. Strong Reference Cycles Between Class Instances (Циклы сильных ссылок между экземплярами классов)
    4. Resolving Strong Reference Cycles Between Class Instances (Замена циклов сильных ссылок между экземплярами классов)
        1. Weak References (Слабые (weak) ссылки)
        2. Unowned References (Бесхозные ссылки)
        3. Unowned References and Implicitly Unwrapped Optional Properties (Бесхозные ссылки и неявно извлеченные опциональные свойства)
    5. Strong Reference Cycles for Closures (Циклы сильных ссылок для замыканий)
    6. Resolving Strong Reference Cycles for Closures (Замена циклов сильных ссылок для замыканий)
        1. Defining a Capture List (Определение списка захвата)
        2. Weak and Unowned References (Слабые (weak) или бесхозные (unowned) ссылки)
 
 */