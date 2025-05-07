//: [Previous](@previous)

import Foundation

class IntClass {
    @Published var value = 0
}

let intClass = IntClass()
intClass.$value
    .sink { value in
        print("value : ", value)
    }
intClass.value = 100
intClass.value = 1

let someValue = 10
