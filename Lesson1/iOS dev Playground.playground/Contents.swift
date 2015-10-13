//: Playground - noun: a place where people can play

import UIKit

func recursiveFib(num : Int) -> Int {
    if num == 1 || num == 2 {
        return 1
    }
    else {
        return recursiveFib(num - 1) + recursiveFib(num - 2)
    }
}

func iterativeFib(num : Int) -> Int {
    var fib1 = 1
    var fib2 = 1
    var returnNum = 1
    if num == 1 || num == 2 {
        return 1
    }
    for var i = 3; i <= num; i++ {
        returnNum = fib1 + fib2
        fib1 = fib2
        fib2 = returnNum
    }
    
    return returnNum
}

let number = recursiveFib(7)
let iterativeNumber = iterativeFib(7)

print("Recursive: \(number)")
print("Iterative: \(iterativeNumber)")

