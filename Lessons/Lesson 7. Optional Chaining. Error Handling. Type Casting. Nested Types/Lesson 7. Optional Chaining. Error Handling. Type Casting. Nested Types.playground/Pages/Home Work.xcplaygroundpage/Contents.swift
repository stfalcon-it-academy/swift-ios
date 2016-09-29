/*: ## Home Work (Домашняя работа) */
//:


import Foundation


// В заданиях используем Optional chaining и Type casting

// 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально). Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии. Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, и т.д.
class Pet {
    func makeSound() {
        print("Pet silent.")
    }
}

class Parrot: Pet {
    override func makeSound() {
        print("Parrot speaking.")
    }
}

class Dog: Pet {
    override func makeSound() {
        print("Dog barks.")
    }
}

class Cat: Pet {
    override func makeSound() {
        print("Cat meows.")
    }
}

class Cow: Pet {
    override func makeSound() {
        print("Cow Moo.")
    }
}


class Human {
    let firstName: String
    let lastName: String
    
    var father: Man?
    var mother: Woman?
    var brothers = [Man]?()
    var sisters = [Woman]?()
    var sons = [Man]?()
    var daughter = [Woman]?()
    var pets = [Pet]?()
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    // Создать родителей
    func addFatherFrom(mans: [Human], andMotherFrom womans: [Human]) {
        guard mans.count > 0 && womans.count > 0 else {
            print("ZZZ")
            return
        }
        
        self.father = mans[Int(arc4random_uniform(UInt32(mans.count - 1)))] as? Man
        guard self.father != nil else {
            print("XXX")
            return
        }
        
        self.mother = womans[Int(arc4random_uniform(UInt32(womans.count - 1)))] as? Woman
        guard self.mother != nil else {
            print("YYY")
            return
        }
    }
    
    // Создать сыновей и дочерей
    func addSonsFrom(mans: [Human], andDaughterFrom womans: [Human]) {
        let childrenCount = Int(arc4random_uniform(4))
        let sonsCount = childrenCount - Int(arc4random_uniform(UInt32(childrenCount)))
        let daughterCount = childrenCount - sonsCount
        
        for i in 0...sonsCount {
            if i == 0 {
                self.sons = [Man]()
            } else {
                self.sons!.append(mans[Int(arc4random_uniform(UInt32(mans.count - 1)))] as! Man)
            }
        }
        
        for i in 0...daughterCount {
            if i == 0 {
                self.daughter = [Woman]()
            } else {
                self.daughter!.append(womans[Int(arc4random_uniform(UInt32(womans.count - 1)))] as! Woman)
            }
        }
    }

    // Создать братьев и сестер
    func addBrothersFrom(mans: [Human], andSistersFrom womans: [Human]) {
        let childrenCount = Int(arc4random_uniform(4) + 1)
        let brothersCount = childrenCount - Int(arc4random_uniform(UInt32(childrenCount)) + 1)
        let sistersCount = childrenCount - brothersCount
        
        print("childrenCount = \(childrenCount)")
        print("brothersCount = \(brothersCount)")
        print("sistersCount = \(sistersCount)")
        
        for i in 0...brothersCount {
            if i == 0 {
                self.brothers = [Man]()
            } else {
                self.brothers!.append(mans[Int(arc4random_uniform(UInt32(mans.count - 1)))] as! Man)
            }
        }
        
        for y in 0...sistersCount {
            if y == 0 {
                self.sisters = [Woman]()
            } else {
                self.sisters!.append(womans[Int(arc4random_uniform(UInt32(womans.count - 1)))] as! Woman)
            }
        }
        
        print("self.sisters.count = \(self.sisters!.count)")
    }
    
    // Добавить домашних животных
    func addSomePets() {
        if Int(arc4random_uniform(2)) == 1 {
            self.pets = [Pet]()
            let petsTemplate = [Parrot(), Dog(), Cat(), Cow()]
            let index = Int(arc4random_uniform(UInt32(petsTemplate.count)))
            self.pets!.append(petsTemplate[index])
        }
    }
    
    var familyTree = [AnyObject]()
    
    // Тип родственника
    enum Relative: Int {
        case Father, Mother, Grandad, Grandmom, Brother, Sister, Uncle, Aunt, Son, Daughter
    }
    
    // Проиндексировать родственников
    func createRelatives(level: Int, fromMans mans: [Human], andFromWomans womans: [Human]) {
        guard mans.count > 0 && womans.count > 0 else {
            print("QQQQ")
            return
        }
        
        switch level {
        // Level = 0 - Родные (папа, мама, дедушки, бабушки, братья, сестры, дяди, тети, сыновья, дочери)
        case 0:
            // Родители - массив
            self.addFatherFrom(mans, andMotherFrom: womans)
            self.father!
            self.mother!
            self.father?.addFatherFrom(mans, andMotherFrom: womans)
            self.father!.father!
            self.father!.mother!
            self.mother?.addFatherFrom(mans, andMotherFrom: womans)
            self.mother!.father!
            self.mother!.mother!
            
            familyTree.append([self.father!])
            familyTree.append([self.mother!])
            familyTree.count
            
            // Дедушки - массив
            var grandads = [Man]()
            grandads.append(self.father!.father!)
            grandads.append(self.mother!.father!)
            grandads.count
            familyTree.append(grandads)
            
            // Бабушки - массив
            var grandmoms = [Woman]()
            grandmoms.append(self.father!.mother!)
            grandmoms.append(self.mother!.mother!)
            grandmoms.count
            familyTree.append(grandmoms)
 
            // Братья - массив
            self.addBrothersFrom(mans, andSistersFrom: womans)
            self.brothers!.count
            familyTree.append(self.brothers!)
            
            // Сестры - массив
            self.sisters!.count
            familyTree.append(self.sisters!)
            
            // Дяди - массив
            self.father!.addBrothersFrom(mans, andSistersFrom: womans)
            self.mother!.addBrothersFrom(mans, andSistersFrom: womans)
            self.father!.brothers!.count
            self.mother!.brothers!.count
            familyTree.append(self.father!.brothers! + self.mother!.brothers!)
            
            // Тети - массив
            self.father!.sisters!.count
            self.mother!.sisters!.count
            familyTree.append(self.father!.sisters! + self.mother!.sisters!)

            // Сыновья - массив
            self.addSonsFrom(mans, andDaughterFrom: womans)
            self.sons!.count
            self.daughter!.count
            familyTree.append(self.sons!)
            familyTree.count
            
            // Дочери - массив
            familyTree.append(self.daughter!)
            familyTree.count
        
        // Level = 1 - Двоюродные (папа?, мама?, прадедушки, прабабушки, братья, сестры, дяди, тети)
        case 1:
            // Прадедушки - массив
            var grandads = [Man]()
            self.father!.father!.addFatherFrom(mans, andMotherFrom: womans)
            self.father!.mother!.addFatherFrom(mans, andMotherFrom: womans)
            grandads.count
            grandads.append(self.father!.father!.father!)
            grandads.count
            grandads.append(self.father!.mother!.father!)
            grandads.count

            self.mother!.father!.addFatherFrom(mans, andMotherFrom: womans)
            self.mother!.mother!.addFatherFrom(mans, andMotherFrom: womans)
            grandads.append(self.mother!.father!.father!)
            grandads.count
            grandads.append(self.mother!.mother!.father!)
            grandads.count
            
            
            familyTree.append(grandads)
            familyTree.count
            /*
            // Прабабушки - массив
            var grandmoms = [Woman]()
            grandmoms.append(self.father!.mother!.mother!)
            grandmoms.append(self.mother!.mother!.mother!)
            familyTree[level * 10 + Relative.Grandmom.rawValue] = grandmoms
            
            // Двоюродные братья и сестры - массивы
            var brothers = [Man]()
            var sisters = [Woman]()
            let uclesAndAunts: [Human] = familyTree[Relative.Uncle.rawValue] as! [Human] + (familyTree[Relative.Aunt.rawValue] as! [Human])
            
            for human in uclesAndAunts {
                for son in human.sons! {
                    brothers.append(son)
                }
                
                for daughter in human.daughter! {
                    sisters.append(daughter)
                }
            }
            
            familyTree[level * 10 + Relative.Brother.rawValue] = brothers
            familyTree[level * 10 + Relative.Sister.rawValue] = sisters
            */
        
        default:
            break
        }
    }
    

    // Работа с родственниками
    subscript(level: Int) -> String {
        // Посчитать родственников
        get {
            var relatives = String()
            
            switch level {
            case 0:
                relatives = "I'm a \(self) - \(firstName) \(lastName). I have \(familyTree[Relative.Father.rawValue].count) father and \(familyTree[Relative.Mother.rawValue].count) mother, \(familyTree[Relative.Grandad.rawValue].count) grandad(s) and \(familyTree[Relative.Grandmom.rawValue].count) grandmom(s), \(familyTree[Relative.Brother.rawValue].count) brother(s) and \(familyTree[Relative.Sister.rawValue].count) sister(s), \(familyTree[Relative.Uncle.rawValue].count) uncle(s) and \(familyTree[Relative.Aunt.rawValue].count) aunt(s), \(familyTree[Relative.Son.rawValue].count) son(s) and \(familyTree[Relative.Daughter.rawValue].count) daughter(s)"
                
            case 1:
                relatives = "I'm a \(self). I have \(familyTree[10].count) great-grandfathers"// and \(familyTree[10 + Relative.Grandmom.rawValue].count) great-grandmothers"
                
            default:
                break
            }
            
            return relatives
        }
    }
}

class Man: Human {
    func moveSofa() {
        print("Man move sofa.")
    }
}

class Woman: Human {
    func giveManTheCommand() {
        print("Woman give man the command to move sofa.")
    }
}

let firstNameMans = [
    "Jacob", "Michael", "Joshua", "Matthew",
    "Ethan", "Andrew",  "Daniel", "William",
    "Joseph", "Christopher", "Anthony", "Ryan",
    "Nicholas", "David"
]

let firstNameWomans = [
    "Emily", "Emma", "Madison", "Olivia",
    "Hannah", "Abigail", "Isabella", "Ashley",
    "Samantha", "Elizabeth", "Alexis", "Sarah",
    "Grace", "Alyssa"
]

let lastNames = [
    "Smith", "Johnson", "Williams", "Jones",
    "Brown", "Davis", "Miller", "Wilson",
    "Moore", "Taylor", "Anderson", "Thomas",
    "Jackson", "White", "Harris", "Martin",
    "Thompson", "Garcia"
]

var mans = [Human]()
var womans = [Human]()

// Создать массив из 30 человек
for i in 1...2 {
    let isMan = Int(arc4random_uniform(2)) == 1 ? true : false
    
    switch isMan {
    case true:
        mans.append(Man(firstName: firstNameMans[Int(arc4random_uniform(13))], lastName: lastNames[Int(arc4random_uniform(17))]))

    case false:
        womans.append(Woman(firstName: firstNameWomans[Int(arc4random_uniform(13))], lastName: lastNames[Int(arc4random_uniform(17))]))
    }
}

// Список из 30-ти людей
var humans = mans + womans
humans.count

// Произвольно выбранный человек - мужчина или женщина
let someHuman = humans[Int(arc4random_uniform(UInt32(humans.count - 1)))]

// Добавить родственников - 1 линия
mans.count
womans.count

someHuman.createRelatives(0, fromMans: mans, andFromWomans: womans)
//print(someHuman[0])

//someHuman.createRelatives(1, fromMans: mans, andFromWomans: womans)
//print(someHuman[1])


/*
// Добавить родителей
someHuman.addFatherFrom(mans, andMotherFrom: womans)
someHuman.father?.firstName
someHuman.father?.lastName
someHuman.mother?.firstName
someHuman.mother?.lastName

// Добавить братьев и сестер
someHuman.addBrothersFrom(mans, andSistersFrom: womans)
someHuman.sisters?.count

// Родителям добавить родителей + братьев + сестер
someHuman.father?.addFatherFrom(mans, andMotherFrom: womans)
someHuman.father?.addBrothersFrom(mans, andSistersFrom: womans)
someHuman.father?.brothers?.count
someHuman.father?.sisters?.count

someHuman.mother?.addFatherFrom(mans, andMotherFrom: womans)
someHuman.mother?.addBrothersFrom(mans, andSistersFrom: womans)
someHuman.mother?.brothers?.count
someHuman.mother?.sisters?.count



// 2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины. У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее. Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
var family = [Human]()
family.append(someHuman)
family.count

if someHuman.father != nil {
    family.append(someHuman.father!)
}

family.count

if someHuman.mother != nil {
    family.append(someHuman.mother!)
}

family.count
someHuman.brothers?.count

if someHuman.brothers?.count > 0 {
    for brother in someHuman.brothers! {
        family.append(brother)
    }
}

family.count
someHuman.sisters?.count

if someHuman.sisters?.count > 0 {
    for sister in someHuman.sisters! {
        family.append(sister)
    }
}

family.count

var mansCount = 0
var womansCount = 0

for human in family {
    switch human {
    case let man as Man:
        mansCount += 1
        man.moveSofa()
        
    case let woman as Woman:
        womansCount += 1
        woman.giveManTheCommand()
        
    default:
        break
    }
}

print("In this family \(mansCount) man(s) and \(womansCount) woman(s): I'm a \(someHuman), father and \(someHuman is Man ? mansCount - 2 : mansCount) brothers, mother and \(someHuman is Woman ? womansCount - 2 : womansCount - 1) sisters")



// 3. Расширить класс Человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще. Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве. Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук. Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
var parrotsCount = 0
var dogsCount = 0
var catsCount = 0
var cowsCount = 0

for human in humans {
    human.addSomePets()
    
    if let pets = human.pets {
        for pet in pets {
            switch pet {
            case let pet as Parrot:
                parrotsCount += 1
                pet.makeSound()
                
            case let pet as Dog:
                dogsCount += 1
                pet.makeSound()

            case let pet as Cat:
                catsCount += 1
                pet.makeSound()

            case let pet as Cow:
                cowsCount += 1
                pet.makeSound()
            
            default:
                break
            }
        }
    }
}

print("All pets = \(parrotsCount + dogsCount + catsCount + cowsCount): parrots = \(parrotsCount), dogs = \(dogsCount), cats = \(catsCount), cowsCount = \(cowsCount)")
 */
