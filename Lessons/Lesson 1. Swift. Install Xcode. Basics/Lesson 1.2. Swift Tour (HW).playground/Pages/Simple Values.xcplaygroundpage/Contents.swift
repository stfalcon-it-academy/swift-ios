/*:
 # A Swift Tour (Знакомство со Swift)
 */
//:
//: По традиции, первая программа на новом языке должна выводить на экран словосочетание `«Hello, world»`. На `Swift` такой код займет всего одну строку:
//:
print("Hello, world!")
//:
//: Если вы писали до этого код на `C` или `Objective-C`, то этот синтаксис должен быть вам знаком – на `Swift` эта строка является законченной программой. Не нужно больше импортировать отдельные библиотеки для таких функций, как ввод/вывод или обработка строк. Код, написанный в глобальной области используется как входная точка для программы, так что функция `main()` больше не нужна. Также вам не нужно писать точки с запятой после каждой строки.
//:
//: Этот тур предоставит вам достаточно информации, чтобы начать писать код на `Swift`. Он расскажет о том, как выполнять самые разнообразные задачи программирования. Не волнуйтесь, если вы чего-то не понимаете — детали будут раскрыты в следующих уроках.
/*:
 
*/
//: ## Simple Values (Простые типы данных)
//:
//: Используйте `let` для создания констант и `var` для объявления переменных. Значение константы не обязательно должно быть известно на момент компиляции, но оно должно присваиваться строго один раз. Это значит, что вы можете использовать константу для обозначения значения, определяемого единожды, но используемого во многих местах.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42
//:
//: Константа или переменная должны иметь те же типы данных, которые вы хотите им присвоить. Хотя вы не должны всегда явно объявлять тип. Когда вы присваиваете значение при создании константы или переменной, компилятор логически предугадывает его тип. В приведенном выше примере компилятор предугадал, что значение переменной `myVariable` имеет тип `integer` (целое число), потому что присвоенное ему значение - `integer`.
//:
//: Если присвоенное значение не дает достаточной информации (или когда значение еще не присвоено) укажите тип, написав его после названия, отделив при помощи двоеточия.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
//:
/*:
 * experiment:
 Создайте константу с явным типом `Float` (число с плавающей точкой) и значением 4.
*/
//: Значения никогда не должны неявно конвертироваться в другой тип. Если вам нужно конвертировать значение в другой тип, тогда явно создайте экземпляр класса нужного типа.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//:
/*:
 * experiment:
 Попробуйте удалить конвертирование в `String` из последней строки. Какую ошибку вы получите?
*/
//: Есть еще один простой способ поместить значение в строку. Запишите значение в скобках, и поставьте перед скобками обратный слэш (`\`), как показано ниже.
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//:
/*:
 * experiment:
 Используйте `\()`, чтобы добавить выражение вычисления числа с плавающей точкой в строку. Также, попробуйте вставить чье-нибудь имя в приветствие.
*/
//:  Массивы и словари создаются с помощью квадратных скобок (`[]`), а получить доступ к их значениям можно указав индекс или ключ в квадратных скобках. Ставить запятую после последнего элемента разрешается.
//:
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]

occupations["Jayne"] = "Public Relations"
//:
//: Чтобы создать пустой массив или словарь, используйте выражение инициализации.
//:
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
//:
//: Если информация о типе переменной или константы должна быть предугадана, то вы можете написать пустой массив через `[]` и пустой словарь через `[:]` — например, когда вы присваиваете новое значение переменной или назначаете аргумент функции.
//:
shoppingList = []
occupations = [:]
//:
/*:
 
*/
//: [Control Flow](@next)
