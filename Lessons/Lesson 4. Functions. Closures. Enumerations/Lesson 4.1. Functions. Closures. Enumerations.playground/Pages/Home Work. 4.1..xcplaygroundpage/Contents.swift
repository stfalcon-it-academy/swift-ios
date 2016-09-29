import Foundation



// 4.1. Вы работаете над созданием игры, в которой главный персонаж двигается по карте. Входные данные: его начальное положение на карте `var location = (x: 0, y: 0)` и перемещение в шагах - перечисление `var steps: [Direction] = [.Up, .Up, .Left, .Down, .Left]`. Движение `.Up` позволит увеличить координату `x` на `1`, .Down - уменьшит координату `x` на `1`. Шаг `.Right` увеличит координату `y` на `1`, а `.Left` уменьшит `y` на 1. Задание - вывести в консоль координаты нового местоположения персонажа после заданного перемещения. Используйте оператор `switch-case`.

enum Direction {
    case Up
    case Down
}

struct Location {
    var position = (x: 0, y: 0)
}

func move(location: Location, steps: [Direction]) -> Location {
    var position = location.position
    
    for step in steps {
        switch step {
        case .Up:
            position = (x: position.x + 1, y: position.y)
            
        case .Down:
            position = (x: position.x - 1, y: position.y)
//         
//        default:
//            break
        }
    }
    
    return Location(position: position)
}

var location = Location(position: (x: 5, y: 4))

print(move(location, steps: [.Up, .Up, .Down, .Down, .Up]))
