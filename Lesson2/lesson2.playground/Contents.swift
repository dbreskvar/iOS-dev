
import UIKit

var str = "Welcome to"

let name = "David"

str += " Xcode"

let number = 4
let number2 = 7.4

let 😁 = "haha"

let sum = Double(number) + number2

let number3 = Double("3.8")

let numbers = [2, 5, 125, 65, 78]

let testNumbers = [sum, number3]

var names = ["David", "Miha", "Viktor"]
var languages = ["Java", "Objective-C", "Swift"]

let programmers = [names[1] : languages[1], names[0] : languages[0]]

names[0] = "Andrej"
names.append("David")

names.insert("Jozica", atIndex: 4)

print("\(names)")

print("\(programmers)")

var test = "Test, swift xocde, kiwi factory"

print(test)

print(test.componentsSeparatedByString(","))

var test1 = test as NSString

test1 = "New test"

if let stevilo = number3 {
    let stevila = [sum, stevilo]
} else {
    print("Bad instruction")
}

class Vozilo {
    var pogon : String? = nil
    var visina = 2.0
    var sirina = 2.0
    var maxHitrost : Double
    
    let steviloPotnikov : Int
    
    func opis() -> String {
        return "Neznano vozilo"
    }
    
    init(maxHitrost : Double, steviloPotnikov : Int) {
        self.maxHitrost = maxHitrost
        self.steviloPotnikov = steviloPotnikov
    }
    
}

class Avto : Vozilo {
    var gume : Int = 4
    
    override func opis() -> String {
        return "Avto"
    }
    
}


let avto1 = Avto(maxHitrost: 4.0, steviloPotnikov: 4)
avto1.gume = 5

let avto2 = Avto(maxHitrost: 2.0, steviloPotnikov: 3)
print(avto2.opis())


let avto3 = Vozilo(maxHitrost: 85.7, steviloPotnikov: 12)
print(avto3.opis())






















