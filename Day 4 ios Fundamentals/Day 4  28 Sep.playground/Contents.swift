//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Structure is VALUE type
struct s{
    var x = 100;
}

var s1 = s()
//print("s1 (x) \(s1.x)")
var s2 = s1
//print("s2 (x) \(s2.x)")
s1.x = 200;
//print("s1 (x) \(s1.x)")
//print("s2 (x) \(s2.x)")

//Class is REFERENCE type
class c{
    var x = 100;
}

var c1 = c()
//print("c (x) \(c1.x)")
var c2 = c1
//print("c2 (x) \(c2.x)")
c1.x = 200;
//print("c1 (x) \(c1.x)")
//print("c2 (x) \(c2.x)")

if(c1===c2)
{
    print("Both are same object")
}





class StudentClass
{
    var sid:Int = 0
    var snm:String?
    var result:String? = "Unknown"
    
    //Properties
    var total:Double = 0.0
    {
        willSet(newTotal) {
            
        }
        didSet {
            self.per = self.total / 5.0
        }
        
    }
    var per:Double = 0.0
    {
        willSet(newPercentage) {
            print("***Result About to set based on new \(newPercentage)% calculation")
        }
        didSet {
            if self.per >= 80.0{
                self.result = "First"
            } else if self.per >= 70.0{
                self.result = "Second"
            } else if self.per >= 60.0{
                self.result = "Third"
            } else if self.per >= 50.0{
                self.result = "Pass"
            } else {
                self.result = "Fail"
            }
        }
    }
    
    func setData(studentId sid:Int, snm:String, marks:Double){
        self.sid = sid
        self.snm = snm
        self.total = marks
    }
    
    func displayData(){
        print("\n\n\n---------------------------")
        print("Student ID : \(sid)")
        print("Student Name : \(snm!)")
        print("Student Total Marks : \(total)")
        print("Student Percentage : \(per)")
        print("Student Final Result : \(self.result!)")
        print("---------------------------")
    }
}

var stu1 = StudentClass()
stu1.setData(studentId: 1, snm: "Pritesh", marks: 200)
stu1.displayData()
stu1.total = 500
stu1.displayData()


stu1.total = 350
stu1.displayData()



































