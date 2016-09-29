/*: ## Home Work (Домашнее задание) */
//:

import Foundation

// 1.1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например `heart()` возвращает сердце и т.п. Вызовите все эти функции внутри `print()` для вывода объединенной строки символов с использованием оператора конкатенации.


// 1.2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку вывести в консоль.


// 1.3. Создайте функцию, которая:
// 1.3.1. принимает массив и возвращает его в обратном порядке.


// 1.3.2. принимает последовательность и возвращает массив в обратном порядке.
// Чтобы не дублировать код используйте вызов функции из п. 1.3.1.


// 1.4. Используя `inout` измените функцию из п. 1.3.1. так, чтобы она не возвращала перевернутый массив, а просто меняла элементы местами в существующем. Что будет, если убрать inout?


// 1.5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные буквы заглавными, согласные - прописными, а цифры меняет на соответствующие строковые значения (например, 9 -> "nine" и т.д.).



// 2.1. Создайте функцию, которая ничего не возвращает и принимает только одно замыкание, которое ничего не принимает и ничего не возвращает. Функция в цикле должна посчитать от 1 до 10, после этого вызвать замыкание. В каждую итерацию цикла и замыкание добавьте `print()` для контроля очередности выполнения команд.


// 2.2. Используя метод массивов `sorted()` отсортируйте массив `[Int]` по возрастанию и убыванию.


// 2.3. Создайте функцию, которая принимает массив `[Int]`, замыкание и возвращает `Int`. Замыкание должно принимать `Int`, `Int?` и возвращать `Bool`. В самой функции создайте `optional` переменную. В цикле пройдитесь по массиву `[Int]`, используя замыкание сравнивая элементы с `optional` переменной. Если замыкание возвращает `true` - записываете значение массива в переменную. В конце функции возвращайте значение этой `optional` переменной.


// 2.3.1. Измените функцию из п.2.3. для поиска максимального и минимального элементов массива.


// 2.4. Создайте произвольную строку. Преобразуйте ее в массив `[Character]`. Используя метод массивов `sorted()` отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы.


// 2.5. Измените функцию из п.2.3. для поиска минимального и максимального символа из массива `[Character]` (поиск ведетеся по соответствующему символу скалярному значению)



// 3.1. Создайте перечисление с названиями шахматных фигур (король, ферзь и т.д.). Каждая фигура должна иметь цвет (белый, черный), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске так, чтобы черному королю был мат. Поместите эти фигуры в массив фигур.


// 3.2. Сделайте так, чтобы значения перечисления имели `rawValue` типа `String`. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль в виде текста (без `Unicode`) название фигуры, цвет и ее расположение. Используя эту функцию распечатайте все фигуры в массиве.


// 3.3. Используя красивые `Unicode` представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает).


// 3.4. Создайте функцию, которая будет принимать шахматную фигуру и кортеж новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах. Вызовите эту функцию для нескольких фигур и распечатайте поле снова.



// 4.1. Вы работаете над созданием игры, в которой главный персонаж двигается по карте. Входные данные: его начальное положение на карте `var location = (x: 0, y: 0)` и перемещение в шагах - перечисление `var steps: [Direction] = [.Up, .Up, .Left, .Down, .Left]`. Движение `.Up` позволит увеличить координату `x` на `1`, .Down - уменьшит координату `x` на `1`. Шаг `.Right` увеличит координату `y` на `1`, а `.Left` уменьшит `y` на 1. Задание - вывести в консоль координаты нового местоположения персонажа после заданного перемещения. Используйте оператор `switch-case`.
