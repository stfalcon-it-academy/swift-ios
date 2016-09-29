/*: ## Error Handling. Defer. Examples (Обработка ошибок. Defer. Примеры) */
//:
/*: [Swift 2: Ключевое слово defer](http://swiftbook.ru/blog/swift-2-defer-keyword) */


import Foundation

/*:
    func writeLog() {
        let file = openFile()
        
        let hardwareStatus = fetchHardwareStatus()
        guard hardwareStatus != "катастрофа" else { return }
        file.write(hardwareStatus)
        
        let softwareStatus = fetchSoftwareStatus()
        guard softwareStatus != "катастрофа" else { return }
        file.write(softwareStatus)
        
        let networkStatus = fetchNetworkStatus()
        guard neworkStatus != "катастрофа" else { return }
        file.write(networkStatus)
        
        closeFile(file)
    }
 */

// Сначала файл открывается, затем в него вписываются некоторые данные, а потом он закрывается.

// Если оператор `guard` поймает ошибку - произойдет выход из метода, при этом файл останется открытым!

// Ключевое слово `defer` означает работу, которая должна быть выполнена при любых обстоятельствах!!!
/*:
    func writeLog() {
        let file = openFile()
 
        // Закрыть файл в любом случае - с ошибкой или без нее
        defer { closeFile(file) }
        
        let hardwareStatus = fetchHardwareStatus()
        guard hardwareStatus != "катастрофа" else { return }
        file.write(hardwareStatus)
        
        let softwareStatus = fetchSoftwareStatus()
        guard softwareStatus != "катастрофа" else { return }
        file.write(softwareStatus)
        
        let networkStatus = fetchNetworkStatus()
        guard neworkStatus != "катастрофа" else { return }
        file.write(networkStatus)
    }
 */


// Использование `defer` внутри метода означает, что отложенная работа будет выполнена непосредственно перед выходом из метода.
func myFunc() {
    print("Шаг 2")

    defer { print("Шаг 3 - defer") }
    
    print("Шаг 4")
}

print("Шаг 1")
myFunc()
print("Шаг 5")



// Пример использования пары `do-defer` вместо `do-catch`:
print("Шаг 1")

do {
    defer { print("Шаг 2 - defer") }
   
    print("Шаг 3")
    print("Шаг 4")
}

print("Шаг 5")


// Пример использования `defer` в операторе цикла `for-in` перед завершением очередной итерации:
for i in 1...10 {
    print ("In \(i)")
    defer { print ("Deferred \(i)") }
    print ("Out \(i)")
}


// Одной из мощных особенностей defer является то, что вы можете назначать несколько отложенных кусков кода к исполнению и Swift гарантирует их выполнение.
// Более того, Swift исполняет отложенные куски кода в обратной последовательности. 
// То есть, то, что вы отложили в последнюю очередь, исполнится первым, и наоборот. Таким образом, получается обратный стек.



// Пример использования нескольких `defer` - пример обратного стека:
func deferExample() {
    defer {
        print("This will be run last")
    }
    
    defer {
        print("This will be run second-last")
    }
    
    print("operation started")
    
    // ...
    print("operation complete")
}

deferExample()



// Пример использования `defer`:
func aTestFunction(a:Int) {
    defer {
        print("clean-up")
    }
    
    // Если условие верно - печать и выход из метода через `defer`
    if a > 5 {
        print("1")
        
        return
    }
    
    // Предыдущее условие не сработало - печать и окончание метода через `defer`
    print("2")
}

aTestFunction(-3)
aTestFunction(9)


// Вы можете разместить `defer` в любом месте текущей области, однако хорошим тоном считается поместить его в самом ее начале!!!



// Пример использования нескольких `defer` - пример обратного стека:
class Foo {
    var Bar: String = ""
    var Baz: Int = 0
}

func showOffDefer() {
    var originalFoo: Foo?
    
    defer {
        print ("1.1. Original Foo's Bar was \(originalFoo!.Bar)")
        originalFoo = nil
        print ("1.2. Now it is \(originalFoo?.Bar)")
    }
    
    originalFoo = Foo()
    originalFoo!.Bar = "Lorem Ipsum"
    originalFoo!.Baz = 7
    
    print("3. We are doing other work")
    
    var newFoo: Foo?
    
    defer {
        print ("2.1. New Foo's Bar was \(newFoo!.Bar)")
        newFoo = nil
        print("2.2. Now it is \(newFoo?.Bar)")
    }
    
    newFoo = Foo()
    newFoo!.Bar = "Monkeys"
    newFoo!.Baz = 42
    
    print("4. We are doing even more work")
}

showOffDefer()
