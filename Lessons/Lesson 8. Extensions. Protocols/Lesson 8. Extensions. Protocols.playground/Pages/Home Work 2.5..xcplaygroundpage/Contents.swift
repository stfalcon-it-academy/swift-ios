import Foundation


// 2.5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы `Storable` не наследовался от `Food`. Мы по прежнему приносим еду домой, только теперь некоторые продукты реализуют (подписаны на) 2 протокола. Холодильник принимает только те продукты, которые еще и `Storable`. Функция сортировки должна по прежнему работать.

protocol Food {
    var name: String { get }
    
    func taste() -> String
}

// п.2.3.
protocol Storable {
    // п.2.5.
    var name: String { get }
    
    // п.2.3.
    var expired: Bool { get }
    
    // п.2.4.
    var daysToExpire: Int { get }
}

class Product: Food {
    var name: String
    
    func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString)."
    }
    
    init(name: String) {
        self.name = name
    }
}

extension Array {
    func sorting(items: [Product]) -> [Product] {
        return items.sort { $0.name < $1.name }
    }
}

let days = 14

class Apple: Product {
    
}

class Lemon: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0 : Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Milk: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0: Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Bread: Product {
    
}

class Meat: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0: Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

class Cheese: Product, Storable {
    var expired = false
    var daysToExpire = 7
    
    init(name: String, expired: Bool) {
        super.init(name: name)
        self.expired = expired
        self.daysToExpire = expired ? 0: Int(arc4random_uniform(UInt32(days)))
    }
    
    override func taste() -> String {
        return "This product is inherent taste of the \(name.capitalizedString). Before the end of shelf life left \(self.daysToExpire) day(s). It's \(expired == true ? "expired." : "not expired.")"
    }
}

let products = [Apple(name: "apple"), Meat(name: "meat", expired: arc4random_uniform(2) == 1), Lemon(name: "lemon", expired: arc4random_uniform(2) == 1), Bread(name: "bread"), Cheese(name: "cheese", expired: arc4random_uniform(2) == 1), Milk(name: "milk Danone", expired: arc4random_uniform(2) == 1), Milk(name: "milk Ferma", expired: arc4random_uniform(2) == 1)]
var productsSorted = products.sorting(products)

for (index, product) in productsSorted.enumerate() {
    print("2.2. \(product.name.capitalizedString). \(product.taste())")
}

print()


class Refrigerator {
    var productsList = [Product]()
    
    // п.2.3
    func productsListPrint() {
        var list = String()
        
        for product in productsList {
            list += list.isEmpty ? product.name.capitalizedString : ", " + product.name.capitalizedString
        }
        
        print("A list of products from the refrigerator: \(list)")
    }
    
    // п.2.4.
    func productsListSort() {
        self.productsList = productsList.sort({ (item0, item1) -> Bool in
            let product0 = item0 as? Storable
            let product1 = item1 as? Storable
            
            if product0!.daysToExpire == product1!.daysToExpire {
                return product0!.name < product1!.name
            } else {
                return product0!.daysToExpire < product1!.daysToExpire
            }
        })
    }
}

var refrigerator = Refrigerator()
refrigerator.productsList

for (index, product) in productsSorted.enumerate() {
    if let item = product as? Storable {
        if item.expired == false {
            refrigerator.productsList.append(product)
        }
    }
}

print("2.3. ", terminator: "")
refrigerator.productsListPrint()
print()


refrigerator.productsListSort()

print("2.4. ", terminator: "")
refrigerator.productsListPrint()
print()


