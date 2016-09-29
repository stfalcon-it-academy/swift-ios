/*: ## Closures. Example 1 (Замыкания. Пример 1) */
//:
/*: [Используем замыкания в Swift по полной](https://habrahabr.ru/post/241303/) */

import Foundation


/*: ### 1.1. Объекты первого класса */

// Функцию можно хранить в переменной, передавать как параметр, возвращать в качестве результата работы другой функции

// Вводится понятие «типа функции». Этот тип описывает не только тип возвращаемого значения, но и типы входных аргументов
func add(op1: Double, op2: Double) -> Double {
    return op1 + op2
}

func subtract(op1: Double, op2: Double) -> Double {
    return op1 - op2
}

// (Double, Double) -> Double
// Прочесть это можно так: "Перед нами тип Функция с двумя входными параметрами типа Double и возвращаемым значением типа Double"

// Описываем переменную
var operation: (x: Double, y: Double) -> Double

// Смело присваиваем этой переменной значение нужной нам функции, в зависимости от каких-либо условий:
for i in 0..<2 {
    if i == 0 {
        operation = add
    } else {
        operation = subtract
    }
    
    // "Вызываем" переменную
    let result = operation(x: 1.1, y: 2.3)// operation(1.0, 2.0)
    
    print("\(i). result =", result)
}



/*: ### 1.2. Замыкания */
// Создадим функцию, которая 3-им параметром `operation` принимает одну из объявленных ранее фунций
// 1
func performOperation(op1: Double, op2: Double, operation: (Double, Double) -> Double) -> Double { // 2
    return operation(op1, op2) //3
}

let result1 = performOperation(1.1, op2: 2.3) { (op1: Double, op2: Double) -> Double in
    return op1 * op2 // 5
} // 4

print(result1)


// Еще раз о том, что сейчас произошло, по пунктам:
// 1. Объявлена функция performOperation
// 2. Эта функция принимает три параметра. Два первых — операнды. Последний — функция, которая будет выполнена над этими операндами.
// 3. performOperation возвращает результат выполнения операции.
// 4. В качестве последнего параметра в performOperation была передана функция, описанная замыканием.
// 5. В теле замыкания указывается, какая операция будет выполняться над операндами.



/*: ### 2.1. Избавляемся от типов при вызове */

// Благодаря выводу типов в замыкании можно не указывать типы входных параметров
var result2 = performOperation(1.0, op2: 2.0, operation: {(op1, op2) -> Double in
    return op1 + op2
})



/*: ### 2.2. Используем синтаксис `хвостового замыкания` */

// Если замыкание передается в качестве последнего параметра в функцию, то синтаксис позволяет сократить запись, и код замыкания просто прикрепляется к хвосту вызова
result2 = performOperation(1.0, op2: 2.0) {(op1, op2) -> Double in
    return op1 + op2
}



/*: ### 2.3. Не используем ключевое слово `return` */

// Если код замыкания умещается в одну строку, то результат выполнения этой строки автоматичеси будет возвращен. Таким образом ключевое слово `return` можно не писать:
result2 = performOperation(1.0, op2: 2.0) {(op1, op2) -> Double in
    op1 + op2
}



/*: ### 2.4. Используем стенографические имена для параметров */

// Swift позволяет использовать так называемые стенографические (англ. `shorthand`) имена для входных параметров в замыкании. 
// Т.е. каждому параметру по умолчанию присваивается псевдоним в формате $n, где n — порядковый номер параметра, начиная с нуля
result2 = performOperation(1.0, op2: 2.0) { $0 + $1 }



/*: ### 2.5. Операторные функции */

// Если замыкание работает только с двумя входными аргументами, в качестве замыкания разрешается передать операторную функцию, которая будет выполняться над этими аргументами (операндами)
result2 = performOperation(1.0, op2: 2.0, operation: +)


// Swift также позволяет использовать операции сравнения в качестве операторной фуниции. Выглядеть это будет примерно так:
func performComparisonOperation(op1: Double, op2: Double, operation: (Double, Double) -> Bool) -> Bool {
    return operation(op1, op2)
}

print(performComparisonOperation(1.0, op2: 1.0, operation: >=))
print(performComparisonOperation(1.0, op2: 1.0, operation: <))


// Или битовые операции:
func performBitwiseOperation(op1: Bool, op2: Bool, operation: (Bool, Bool) -> Bool) -> Bool {
    return operation(op1, op2)
}

true || true

//print(performBitwiseOperation(true, op2: true, operation: ))
//print(performBitwiseOperation(true, op2: false, operation: ))
