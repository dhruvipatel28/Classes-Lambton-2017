//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(" -------- ------ -------- -------- Functions -------- ------ -------- --------" )

print("-------- Simple Fumction ----------")
func add()
{
    print("\nI m in a user define funciton add")
}

add()


print("\n\n -------- Single Perameter  Fumction ----------")


func welcome(name : String)
{
    print("\nWelcome ",name)
}

welcome(name : "Jack")

print("-------- Double Perameter Fumction ----------")


func add(a : Int , b : Int)
{
    print("\nSum of a & b  is : " ,a+b)
}

add(a: 4, b: 7)

print("-------- pass var in Fumction ----------")

var a = 30 ; var b = 50
add(a: a, b: b)



print("\n --------  Fumction  with optional Lable name---------- \n ")


func sub (a :Int , _ b: Int)
{
    print("\n Subtraction is  : " , a - b)
    
}

sub(a: 160 , 70)


print("\n --------  Fumction  with single return value ---------- \n" )

func multi(a: Int , b: Int) -> Int
{
    return a*b
}

print(" \n   Multiplication of a & b : " , multi(a: 4, b: 8))


print("\n --------  Fumction  with Multiple  return value ---------- \n" )

func swip(a : Int  , b: Int) -> (Int , Int)
{
    //var t = a
    //a = b
    //b = t
    print("\n After Swip Value of a : \(b) & b \(a) \n ")
    return (b,a)
}

swip(a: 10, b: 20)

var (x,z) = swip(a: 40, b: 70)
print("After Swipe  :  \(x,z)")


(_,_) = swip(a: 45, b: 54)  // just to precess function without storing return values
//(c,_) = swip(a: 78, b: 87)
//print("Store Only One return value from function  : \(c)")



print("\n --------  Fumction  with Multiple  return value  Using IN OUT key word---------- \n" )

func swipInOut(a: inout Double , b: inout Double)
{
    var  temp = a
    a = b
    b = temp
    print("\n After Swip Value of a : \(a) & b \(b) \n ")
    //return (a,b)
}

//  print(swip(a: 67.9, b: 76.8))  This will gives error you have to declare it like

var xx = 56.7 , zz = 76.5

swipInOut(a: &xx, b: &zz)

/*
 
 when we use double we use the reference of variable using & sign
 
 */

func swipeInOut(a1: inout Int , b1: inout Int)
{
    var  temp = a1
    a1 = b1
    b1 = temp
    print("\n Calling Inout with Int  After Swip Value of a : \(a1) & b \(b1) \n ")
    //return (a,b)
}

var xi = 5 , zi = 10
swipeInOut(a1: &xi, b1: &zi)



print(" \n \n ----------  Pass Array in Function   ---------- \n \n ")

var array:[Int] = [1,2,3,4,5]

func printArrayValue(array : Array<Int>)
{
    for i in array
    {
        print("Array Value  :  \(i)")
    } // for
}

printArrayValue(array : array)

print(" \n \n ----------  Pass Array as Variadic Parameters in Function    ---------- \n \n ")

func printArrayValue(array : Int...)
{
    for i in array
    {
        print("Array Value  Variadic Parameters :  \(i)")
    } // for
}
printArrayValue(array: 1,3,5,7,9,11,13)


print(" \n \n ----------  Pass Variable List as Variadic Parameters in Function    ---------- \n \n ")

var v1:Int = 2 ,v2:Int = 6,v3:Int = 9
printArrayValue(array: v1,v2,v3)

//var va1:[Int] = [21,22,23] , va2:[Int] = [31,32,33] , va3:[Int] = [41,42,43]
//printArrayValue(array: va1,va2,va3)

/*
func variadic(n : Int... , m: String...)
{
    
}
 
 ERROR :
only a single variadic parameter '...' is permitted
 
*/

print(" \n \n ---------- Lables rename facility in Function   ---------- \n \n ")

func renameLable(number a : Int)
{
    print("We use Lable 'a' in side function \(a) and while calling we can use 'number' lable")
}

renameLable(number: 676)


print(" \n \n ---------- Default Value in Function Variable ---------- \n \n ")



 // default value can b inbetween ofother variable with use of _
// but without use of _ defailt declaration should b at the end .


func simpleIntrest(amount: Double , noOfYears: Double, _ rate:Double = 5)
{
    print("Simple Intrest is : ",((amount * noOfYears) * rate) / 100)
}

simpleIntrest(amount: 10000, noOfYears: 4.3 , 34)  // we do not have to give lable name
simpleIntrest(amount: 10000, noOfYears: 4.3 ) // we use default value of rate

// we use the same function name but prameter type is difrent

func simpleIntrest(amount: Double , noOfYears: Int, _ rate:Double = 5)
{
    print("Simple Intrest using TypeCast is : ",((amount * Double(noOfYears)) * rate) / 100)
}

simpleIntrest(amount: 10000, noOfYears: 4 , 7)


print(" \n \n ---------- Sum of array  with inout ---------- \n \n ")


var array1: [Int] = [21,22,23,24,25]
var array2: [Int] = [31,32,33,34,35]

func sumOfArray1(ar1: [Int] , ar2: inout [Int]) //-> [Int]
{
    var temp = Array<Int>()
    if (ar1.count == ar2.count)
    {
        var counter = ar1.count , i = 0
        while i != counter
        {
            temp.append(ar1[i] + ar2[i])   // for blank array we have to use .append method
            i = i + 1
        }// while
    }// if
    ar2.removeAll()
    ar2 = temp
    print("Sum of array is  :   \(ar2)")
    //return temp
}

sumOfArray1(ar1: array1, ar2: &array2)

print(" \n \n ---------- Sum of array  with diffrent method  ---------- \n \n ")

//Sum of two array
func display(arrayList:[Int]...) -> [Int]
{
    var array1 = arrayList[0]
    var array2 = arrayList[1]
    var result = [Int]()
    
    if array1.count == array2.count
    {
        for i in 0..<array1.count
        {
            result.append(array1[i] + array2[i])
        }
    }
    return result
}
var a1 = [1,2,3,4,5]
var a2 = [10,11,12,13,14]
var a3 = display(arrayList:a1,a2)
print(a1)
print(a2)
print(a3)



print(" ----------------   Create array from string  ------------------" )

//https://stackoverflow.com/questions/38358312/componentsseparatedbystring-error-in-swift-3

var arrayInString = "1 34 56 4 67 456 234 4 56"

var arrayFromString = Array<Int>()
var tempArray: [String] = arrayInString.components(separatedBy:" ") //split(separator: splitC)
print(" Array as string  " ,tempArray  ," \n\n\n" )

var count = tempArray.count
var ai = 0

/*
 convert String to Ineger
 
 1>  ("45" as NSString).integerValue     from simple string
 2>  Int(tempArray["String value"])!     from array value
 */


while ai != count
{
    print("Index is \(ai) : \(tempArray[ai]) " )  //  convert string value to Interger isc ::    , Int(tempArray["String value"])!    or ("45" as NSString).integerValue
   arrayFromString.append(Int(tempArray[ai])!)
    ai = ai + 1
}//while

print("Interger  Array from String   :  \(arrayFromString)")

print("\n\nString Value to ineger   ------    " , ("45" as NSString).integerValue  )






print(" \n\n\n ----------------  Closures   ------------------" );

var StringA = ["abc" , "bcd", "cde", "def" ,"efg" ]

StringA = StringA.sorted
{
  (s1: String, s2: String) -> Bool in
        return s1 > s2
}
print("\n\n sorting s1 > s2 " , StringA)



StringA = StringA.sorted
    {
        (s1: String, s2: String) -> Bool in
        return s1 < s2
}
print("\n\n sorting s1 < s2 " , StringA)



var ac1 = 10
var ac2 = 20


var ac3 = { (ac1: Int, ac2: Int) -> Int in
        return ac1 + ac2
}// Closures

print("\n\n Sum of 2 Interger in closures   :   " , ac3(10,30))


print(" \n\n\n ---------------- Sum of Array in  Closures   ------------------" );

//----------- sum of arrayFromString
// Interger  Array from String   :  [1, 34, 56, 4, 67, 456, 234, 4, 56]

var sumOfArray =
{
    (array1: [Int]) -> Int in
    var counter = array1.count
    var i = 0
    var sumOfArray = 0
    while i != counter
    {
        sumOfArray =  sumOfArray + arrayFromString[i]
        i = i + 1
    }//  while
    return sumOfArray
}

print("   ----  sum of array is  : " , sumOfArray(arrayFromString) )



print("lalalalal " )








