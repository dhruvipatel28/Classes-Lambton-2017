//: Playground - noun: a place where people can play

import UIKit

protocol Icaculate
{
    var Ia :Int {get set}
    var Ib :Int {get}
    
    func Calculae(o: Character) ->Int
} // Icaculate

class Addition : Icaculate
{
    //var Ia: Int = 100 // get
    var Ia: Int // get & set so no defination mendatory
    var Ib: Int = 50 // get
    
    init(a: Int, b: Int)
    {
        self.Ia = a
        self.Ib = b
    }
    
    func Calculae(o: Character) -> Int
    {
        switch o
        {
        case "+":
            return Ia+Ib
        default:
            return 0
        }
        //return 0
    }
}// class Addition


class Subtraction : Icaculate
{
    var Ia: Int = 1000_00
    var Ib: Int = 80_0
    
    init(a: Int, b: Int)
    {
        self.Ia = a
        self.Ib = b
        
    }
    
    func Calculae(o: Character) -> Int
    {
       switch o
        {
        case "-":
            if Ia > Ib
            {    return Ia-Ib     }
            else
            {    return 0       }
        default:
            return 0
        }
        //return 0
    }
}// class Subtraction


var A1 = Addition(a: 1_00_00, b: 100)
print("Addition :  \(A1.Calculae( o: "+"))")

var S1 = Subtraction(a: 1_00_00, b: 100)
print("Subtraction :  \(S1.Calculae( o: "-"))")

