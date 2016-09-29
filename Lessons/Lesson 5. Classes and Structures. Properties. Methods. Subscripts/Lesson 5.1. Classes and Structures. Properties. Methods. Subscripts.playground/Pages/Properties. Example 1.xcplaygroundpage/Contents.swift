/*: ## Properties. Example 1 (Свойства. Пример 1) */
//:
/*:  */


import Foundation

// Stored Properties (Хранимые свойства)
struct Student {
    var firstName : String {
        willSet {
            print("will set " + newValue + " instead of " + firstName)
        }
        
        didSet {
            print("did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalizedString
        }
    }
    
    var lastName : String {
        didSet {
            lastName = lastName.capitalizedString
        }
    }
    
    var fullName : String {
        get {
            return firstName + " " + lastName
        }
        
        set {
            print("fullName wants to be set to " + newValue)
            let words = newValue.componentsSeparatedByString(" ")
    
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student = Student(firstName: "Alex", lastName: "Skutarenko")

student.firstName
student.lastName
student.fullName

student.firstName = "Bob"

student.firstName
student.lastName
student.fullName

student.fullName = "iVAN IVAnov"
student.firstName
student.lastName
student.fullName
