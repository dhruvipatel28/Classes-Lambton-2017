//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var x = (10, 20, 30)

print(x.0)    // o/p 10
print(x.1)        // o/p 20
print(x.2)        // o/p 30


var y = (x.0,x.1)

print(y)            // o/p (10,20)


var (a1,a2) = y

print (a1)        //o/p 10
print (a2)        //o/p 20


//-----------  we want x.0 and x.2 values in b1 and b2
// we use _ to obmit x.1 value

var (b1,_,b2) = x

print(b1)   //o/p 10
print(b2)   //o/p 30


//-------------------    arrays

var array1 = [10, 20, 30, 40, 50]


print("-------------------    arrays")
print (array1[0])   // o/p 10
print(array1[4])  // o/p 50


/* var b:[Int]
b[0] = 100;
 
 error of veriabble not declared
 
 */


/*
var b:[Int] = []

b[0] = 65
 
 error of out of index
 
 
*/

//-------------- use of append in array
var b = [Int]()

print("Array size is : " , b.count)

b.append(56)
print(b[0])

print("Array size is : " , b.count)

b[0] = 45
print("Array : " , b)
 print("Array size is : " , b.count)

b.append(78)
print("Array : " , b)
print("Array size is : " , b.count)


// -----------   ANY       --------------  create array of any type
/*
 
 Here we have ANY key word to create any type of array
 
 */

var c = [Any]();
c.append(100)
c.append("Patel")
c.append("lalala")


print("Values in C array" , c)


// ----------------------------                 ---------------------------


print("1.1  --------------------------- \n\n\n")

/*
 Here if you say
 
 var1 = [1...4]  this will print values in for loop like   0...4
 
 var1 = 0...4   and if we remove []
 
 o/p is
 
 var1 items :  0
 var1 items :  1
 var1 items :  2
 var1 items :  3
 var1 items :  4

 
 */



var var1 = 0...4

print("var1.startIndex  :  ",var1.startIndex)

for t in var1
{
    print("var1 items : " , t)
}



/*
here we have  array1 = [10, 20, 30, 40, 50]
 we want values 20,30,40
 that is index range of 1 to 3
*/
print(" -----------  fatch vaues of sliced array    ----------- " )

print("1.2  -------------------- using loop   \n\n\n")
var var2 = array1[1...3]
for j in var2
{
    print("values in var2" , j)
}

/*
 output
 
 values in var2 20
 values in var2 30
 values in var2 40
 
 
 */

print(" \n 1.3  --------------------------- using index " )

/*
 
 print("value of 0 index of var2" , var2[0])
 
 we here take var2 = array1[1...3]
 
 so we are taking a slice from the array1
 
 not the var2 hase the index values that is 1, 2 and 3
 
*/

print("index 1 " , var2[1])
print("index 2 " , var2[2])
print("index 3 " , var2[3])

/*
 out put is
 
 index 1  20
 index 2  30
 index 3  40

 */




var repeatingArray = Array(repeating: 0.0, count: 5)
for t in repeatingArray
{
   print(t)
}

/*   optput
 
 0.0
 0.0
 0.0
 
 */


/*
var CombineArray = array1 + repeatingArray

 gives ambigous error
 
 beacouse of value types are diffrent
 
 
*/
print("\n 1.5  -------------- Conbine arrays------------- \n\n\n" )

var repeatingArray1 = Array(repeating: 60, count: 5)

var CombineArrays = array1 + repeatingArray1

print("Value of Combine Array " , CombineArrays)


print(" \n\n 1.6   ------------  Sets    ---------------- \n")

//Assign values at time of declaration
var set1: Set<String> = ["ONE" , "TWO" , "THREE" ,"FOUR" ]



//Assign value after declaration
var set2 = Set<Int>()

set2.insert(203)
set2.insert(405)
set2.insert(0)
set2.insert(10)
set2.insert(2)
set2.insert(4)
set2.insert(57)
print ("Set2 values " , set2)

print("Capacity of set2 : " ,set2.capacity)

print(" \n\n 1.7   ------------  Dictionary   is a <Key, Value> pair array or set  ---------------- \n")

var dicti1 = Dictionary<Int,String>()

dicti1 = [1:"One" , 2:"Two" , 3:"Three" , 4000:"four thousand"]

print("dicti1 value" , dicti1)
print("dicti1 description " , dicti1.description ,"\n\n\n")

print("diciti1 value of key 1 " , dicti1[1])
print("diciti1 value of key 1 " , dicti1[2])
print("diciti1 value of key 4000 " , dicti1[4000] , " \n")


print(" \n\n 1.8   ------------  Fatch Dicitinory values with loop as key,value pair   ---------------- \n")

for (i,j) in dicti1
{
    print(" Dicti1 Vlaues are    \(i) : \(j ) ")
}

print("   ------------  Add Key n value to Dicitinory  ---------------- \n")


dicti1[45] = "Fourty Five"
print("dicti1 description " , dicti1.description ,"\n\n\n")

print("   ------------  Dicitinory  with ANY datatype ---------------- \n")

var dicti2: Dictionary<String , Any>  = ["4 and 5"  :  45 ,   "6 and 7" : 67, "first chracter" : "abc"  ]

print(dicti2)

print("   ------------  Dicitinory  AnuObject ---------------- \n")


var dicti3 : Dictionary<String, AnyObject> = ["for" : 1 as AnyObject , "Six" : 4 as AnyObject]
dicti3["keyr"] = nil
dicti3["Date"] = Date() as AnyObject   // or NSDate()  will work Same
dicti3["integer"] = 32 as AnyObject

print("dicit3 : " , dicti3.description ,"\n \n")

print("   -------     Retrival of Dictinory   Key : Value--------------- \n\n\n  ")
for (key,value) in dicti3
{
    print("Key is \(key) \t\t\t : Value \(value)")
}


print("   -------     Retrival of Dictinory    as single Object --------------- \n\n\n  ")

for obj in dicti3
{
    print("Dictinory A single object   : \t \t " , obj)
}

print("   -------     Retrival of Dictinory    Only Key  --------------- \n\n\n  ")

/*
for Keys in dicti3
{
        print("Dictinory A single object   : \t \t " , Keys)
}
*/


///var dicti2: Dictionary<String , Any>  = ["4 and 5"  :  45 ,   "6 and 7" : 67, "first chracter" : "abc"  ]

var studentRecord  = [Any]()
var sidDic: Dictionary<String,String> = ["sid1": "StudentID 1"]
var stuName: Array<String> = ["s1 First","s1 Last"]
var stuAdd: Array<String> = ["George","5100","city1","h5h5h5"]
var stuBirth :Array<Int> = [05,08, 1987]
var studentArray: Dictionary<String,AnyObject> = ["id" : "Student1" as AnyObject, "Name" : stuName as AnyObject , "Address" : stuAdd as AnyObject ,"Birthdate" : stuBirth as AnyObject]

studentRecord.append(studentArray)

print(studentRecord[0])






