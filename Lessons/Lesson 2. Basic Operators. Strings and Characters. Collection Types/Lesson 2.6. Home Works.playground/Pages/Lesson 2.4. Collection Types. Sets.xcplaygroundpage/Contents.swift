import Foundation


// 1.1. Создайте псевдоним `Chessman` для типа словаря `[String:(alpha: Character, num: Int)?]`. Данный тип описывает шахматную фигуру на игровом поле. В ключе словаря должно храниться имя фигуры, например `Белый король`, а в значении — кортеж, указывающий на координаты фигуры на игровом поле. Если вместо кортежа находится `nil`, это означает, что фигура убита (не имеет координат на игровом поле).
typealias Chessman = [String : (alpha: Character, num: Int)?]

// 1.2. Создайте переменный словарь `Chessmans` типа `Chessman` и добавьте в него три произвольные фигуры, одна из которых не должна иметь координат.
var chessmans: Chessman = ["Белый король" : (alpha: "d", num: 4), "Черная пешка" : (alpha: "c", num: 5), "Черная ладья" : nil]

// 1.3. Создайте конструкцию `if-else`, которая проверяет, убита ли переданная ей фигура (элемент словаря `Chessmans`), и выводит на консоль информацию либо о координатах фигуры, либо о ее отсутствии на игровом поле.
for chessman in chessmans {
    // Forced Unwrapping (Принудительное извлечение опционала)
    if chessman.1 != nil {
        print("\"\(chessman.0)\" стоит на клетке \(String((chessman.1!).0) + String((chessman.1!).1))")
    } else {
        print("\"\(chessman.0)\" побита!!!")
    }
}

// 1.4. Для получения координат переданной фигуры используйте опциональное связывание.
for chessman in chessmans {
    // Optional Binding (Связывание опционала)
    if let position = chessman.1 {
        print("\"\(chessman.0)\" стоит на клетке \(String(position.0) + String(position.1))")
    } else {
        print("\"\(chessman.0)\" побита!!!")
    }
}
