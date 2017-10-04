//: Playground - noun: a place where people can play

import UIKit

// Extention is to provide more power to the existing class, structure or datatype

// "Welcome" + S1
// "12345" to "12,345.00"
// "50" - "$50.00"

extension String
{
    var concate : String { return "Welcome "+self }
    var length: Int
    {
        get
        {
            return self.count
        }
    }
    
    func contains(s: String) -> Bool
    {
        return true
    }
    
    var vowels: String
    {
        get
        {
            var hasVovel = [Character]()
            for x in self.characters
            {
                switch x
                {
                case "a","A":
                    hasVovel.append(x)
                case "e","E":
                    hasVovel.append(x)
                case "i","I":
                    hasVovel.append(x)
                case "o","O":
                    hasVovel.append(x)
                case "u","U":
                    hasVovel.append(x)
                default:
                    print()
                }
            }
            return String(hasVovel)
            //return hasVovel //["a", "e", "i", "o", "u"]
           // return ["a", "e", "i", "o", "u"]
        }
    }
    
    private var consonants: [String]
    {
        get
        {
            return ["b", "c", "d", "f", "g", "h", "j", "k",
                    "l", "m", "n", "p",
                    "q", "r", "s", "t", "v", "w", "x", "z"]
        }
    }
}  //extention String


var str = "Hello world"
let v = str.vowels
print("Vovels in string : \(str) : " , v)


