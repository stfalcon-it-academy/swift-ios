/*: ## Home Work (Домашнее задание) */
//:

import Foundation

/*: ### Задание 1 */
//: 1. Создайте консанту типа `String` произвольного текста (минимум 200 символов). Используя цикл `for-in` и оператор `switch` посчитайте: количество гласных, согласных, цифр и символов.
//


//: 2. Создайте `switch`, который принимает возраст человека и выводит [описание жизненного этапа](https://otvet.mail.ru/question/57813416)
//


//: 3. У вас есть фамилия, имя и отчество студента (русские буквы). Если его имя начинается на букву `А` или `О` - обращайтесь к нему по имени; в противном случае, если его отчество начинается на букву `В` или `Д` - обращайтесь к нему по имени и отчеству; в противном случае, если его фамилия начинается на букву `Е` или `З` - обращайтесь к нему только по фамилии. Во всех остальных случаях обращайтесь к нему по Ф.И.О.
//


//: 4. Представьте, что вы играете в морской бой и у вас осталось некоторое количество кораблей на поле 10 х 10 (маркировка клеток - буквы и цифры или только цифры). Создайте `switch`, который примет `Tuples` (кортеж) с координатами клетки и выдаст один из вариантов: `мимо`, `ранил`, `убил`.
//


/*: ### Задание 2 */
//: 1. Создайте псевдоним типа `String` с именем `Text`.
//


//: 2. Объявите три константы типа `Text`. Значения двух констант должны состоять только из цифр, третьей — из цифр и букв.
//


//: 3. Из всех трех констант найдите те, которые состоят только из цифр, и выведите их на консоль. Для преобразования строки в число используйте функцию `Int()`.
//


//: 4. Создайте псевдоним для типа `(numberOne: Text?, numberTwo: Text?)?` с именем `TupleType`. Данный тип является опциональным и также содержит в себе опциональные значения.
//


//: 5. Создайте три переменные типа `TupleType`, содержащие следующие значения: `("190", "67")`, `("100", nil)`, `("-65", "70")`.
//


//: 6. Выведите значения элементов тех кортежей, в которых ни один из элементов не инициализирован как `nil`.
//



/*: ### Задание 3 */
//: 1. Определите псевдоним Operation типу кортежа, содержащему три элемента со следующими именами: `operandOne`, `operandTwo`, `operation`. Первые два — это числа с плавающей точкой. Они будут содержать операнды для выполняемой операции. Третий элемент — строковое значение типа `Character`. Оно будет содержать указатель на проводимую операцию. Всего может быть четыре вида операций: `+`, `-`, `*`, `/`.
//


//: 2. Создайте константу типа `Operation` и заполните значения ее элементов произвольным образом, например `(3.1, 33, "+")`.
//


//: 3. Используя конструкцию `switch-case`, вычислите значение операции, указанной в элементе operation созданного кортежа для операндов в его первых двух элементах. Оператор `switch` должен корректно обрабатывать любую из перечисленных операций.
//


//: 4. В созданной константе замените символ операции другим произвольным символом и проверьте правильность работы конструкции `switch-case`.
//



/*: ### Задание 4 */
//: 1. Создайте функцию, которая выведет в консоль фразу `Я не буду пропускать основы!` `n` раз. Используйте 2 подхода - с использованием оператора `for-in` и `while`.
//


//: 2. Создайте функцию, которая выведет в консоль квадрат целого числа, которое меньше или равно заданному значению `n`. Например, при `n = 3` должна распечататься следующая последовательность: `1`, `4`, `9`. Константа `n = 11`.
//


//: 3. Создайте функцию, которая выведет в консоль последовательность четных чисел, полученных в результате умножения на `2`. Рабочий диапазон значений - от `0` до `n` включительно. Например, при `n = 100` должна распечататься следующая последовательность: `2`, `4`, `8`, `16`, `32`, `64`.
//


//: 4. Создайте функцию, которая выведет в консоль последовательность целых чисел из диапазона от `0` до `n` включительно в альтернативном порядке: одна цифра - из первой позиции, вторая - из позиции `(n - 1)`. Используйте две переменные для хранения левого и правого указателей для следующей итерации. Обратите внимание на случай, когда `n` будет иметь нечетное значение.
//


//: 5. Создайте функцию, которая выведет в консоль квадрат, состоящий из `n` звездочек. Например, при `n = 3`, должен распечататься квадрат 3х3 звездочки. Используйте оператор `print("")` для печати пустой строки. Проверьте работу функции на значениях от `1` до `5`.
//


//: 6. Создайте функцию, которая выведет в консоль прямоугольник, состоящий из `n = 3` (строк) и `m = 7` (в строке) звездочек. В задании 5 измените диапазон одного из циклов.
//


//: 7. Создайте функцию, которая выведет в консоль треугольник, состоящий из `n` строк со звездочками. Например, при `n = 3` сначала напечатайте `*`, затем во второй строке - `**`, потом - `***`. Проверьте работу функции на значениях от `1` до `7`.
//


//:
/*: */
//: [Lesson Plan](@previous) | [Links](@next)
