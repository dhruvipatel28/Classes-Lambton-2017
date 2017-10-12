import Foundation
//
//  Employee.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//


public class Employee : IDisplay
{
    
    
    private var _name: String?
    private var  _age: Int?
    public var vehicle: Vehicle? // optional
    
    var name : String
    {
        set
        {
            self._name = newValue
        }
        get
        {
            return self._name!
        }
    }
    
    var age : Int
    {
        set
        {
            self._age = newValue
        }
        get
        {
            return self._age!
        }
    }
    
    struct giveYear
    {
        var age:Int = 0
        var year: Int
        {
            if age > 0
            {
                return (2017 - age)
            }
            else
            {
                return 0
            }
        }
    } //struct giveYear
    
    init()
    {
        self._name = ""
        self._age = 0
        vehicle = nil
    }
    
    init (_ pName: String,_ pAge: Int)
    {
        self._name = pName
        self._age = pAge
        vehicle = nil
    }
    
    init (_ pName: String,_ pAge: Int, _ pV: Vehicle)
    {
        self._name = pName
        self._age = pAge
        vehicle = pV
    }
    
    
    func calcEarnings() -> Double
    {
        return 100.00
    }
    
    func printMyData() -> String
    {
        var nameString = "Name: \(self._name!) \n"
            + "Year of Birth:  \(giveYear(age:self._age!).year)"
        
        if (self.vehicle == nil)
        {
            nameString += "\nEmployee has not registered any vehicle "
        }
        else
        {
            switch self.vehicle
            {
            case is Car:
                nameString += "\nEmployee has a Car \n "  + self.vehicle!.printMyData()
                
            case is Motorcycle:
                nameString += "\nEmployee has a Motorcycle \n " + self.vehicle!.printMyData()
              
            default :
                nameString += "\nEmployee has not registered any vehicle "
                
            }
        }
        
        if(self is CommissionBasedPartTime)
        {
            nameString += "\nEmployee is PartTime / Commissioned"
        }
        else if (self is FixedBasedPartTimes)
        {
            nameString += "\nEmployee is PartTime / Fixed Amt"
        }
        else if(self is Intern)
        {
            nameString += "\nEmployee is Intern"
        }
        else if(self is FullTime)
        {
            nameString += "\nEmployee is Full Time"
        }
        return nameString
    }// func
    
}


