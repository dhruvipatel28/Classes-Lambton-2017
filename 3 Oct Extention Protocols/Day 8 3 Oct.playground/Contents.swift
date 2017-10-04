//: Playground - noun: a place where people can play
import UIKit

protocol IDisplay
{
    init()  // Use it with Required KeyWord
    func display()
} //IDisplay

protocol IGreet
{
    func Greet() -> String
}//IGreet


class Fruits : IDisplay ,IGreet
{
    // Required Key Word is Imp beacouse we have init() in Protocol
    required init()
    {}
    
    init(Name: String)
    {
        print("Fruit Init with Perameter")
    }
    
    //
    func display()
    {
        print("protocol Display()")
    }
    
    // Method is of IGreet Protocol
    func Greet() -> String
    {
        return "Welcom To Protolol Programmig"
    }
    
    // Method is of Fruits Class
    func Greet(name : String)
    {
        print("I will fire the error " , name)
    }
} // Class Fruits

class Apple:Fruits
{
    required init()
    {
        super.init(Name: "Call from Apple required init() ")
    } //required init
    
//    override init(Name:String)
//    {
//        super.init()
//        self.name = Name
//    }
}


var f1 = Fruits()
f1.display()
print(f1.Greet())
f1.Greet(name: "Name")
//var f3 = IDisplay() //  ERROR : protocol type 'IDisplay' cannot be instantiated
//var f4 = IDisplay //ERROR : expected member name or constructor call after type name
/*
  Here we have reference of the perent protocal.
 This will give accsess toall object of the child.
*/
var f2 : IDisplay
/*
refer fruit object with its perent protocol.
f2 = f1 as Fruits
f2.display()
o/p : protocol Display()
here we get the detail of fruit class object
which is a child class  of IDisplay Perent protocol
*/

f2 = f1 as Fruits

f2.display()   // o/p protocol Display()

//--------------------- ------------------------ ------------------------
print("--------------------- ------------------------ ------------------------")


var apple1 = Apple()
apple1.display()










