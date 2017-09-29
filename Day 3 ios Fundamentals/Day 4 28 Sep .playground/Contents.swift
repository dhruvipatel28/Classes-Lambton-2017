//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class StudentClass
{
    //let x = 100
    var Id : Int = 0
    var Name : String? = nil
    var Total : Int = 0
    var per : Double = 0.0
    var result :String?
    var getResult: String?
    {
        set
        {
            if per >= 80.0
            {
                result = "First"
            }
            else if per >= 70.0
            {
                result = "Second"
            }
            else if per >= 60.0
            {
                result = "Third"
            }
            else if per >= 50.0
            {
                result = "Pass"
            }
            else
            {
                result = "Fail"
            }
        }//set
        get
        {
            if let x = result
            {
                return x
            }
            return "Unknown "
        }//get
    }// Result
    
    
    
    func setData(Id : Int , sname : String ,Total : Int , Percentage : Double)
    {
        self.Id = Id
        self.Name = sname
        self.Total = Total
        per = Percentage
    }//setData
    
    func displayData()
    {
        print(" Student Id : \(Id)" )
        print(" Student Name : \(Name!)" )
        print(" Student Total : \(Total)" )
        print(" Student Per : \(per)" )
        print(" Student Final Result : \(getResult!)" )
    }//displayData
    
} // StudentClass

var stu1 = StudentClass()

stu1.setData(Id: 1, sname: "Student name", Total: 390, Percentage: 45)
stu1.getResult = "Its pass"
stu1.displayData()
