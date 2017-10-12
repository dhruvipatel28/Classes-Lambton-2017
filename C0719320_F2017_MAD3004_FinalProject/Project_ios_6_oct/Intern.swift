//
//  Intern.swift
//  Project_ios_6_oct
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//


public class Intern : Employee
{
    private var _schoolName : String?
    private var _department : String?
    
    var schoolName : String
    {
        set
        {
            self._schoolName = newValue
        }
        get
        {
            return self._schoolName!
        }
    }
    
    var department : String
    {
        set
        {
            self._department = newValue
        }
        get
        {
            return self._department!
        }
    }
    
    
    override init()
    {
        self._schoolName = ""
        self._department = "Receptionist"
        super.init()
    }
    
    init(pName: String,  pAge: Int, pSchool: String , pdepartment : String)
    {
        self._schoolName = pSchool
        self._department = pdepartment
        super.init(pName, pAge)
    }
    
   
    
    override func calcEarnings() -> Double
    {
        switch department
        {
            case "Marketing" :
                return 300.00
            case "Information Techonology" :
                return 450.00
            case "Big Data" :
                return 350.00
            default :
                return 250.00
        }
        
    }
    
    
    override func printMyData() -> String
    {
        let internInfo = super.printMyData() +  "\n  \t School Name: \(self._schoolName!) \n"
            + "\t Department: \(self._department!) \n "
            + "\t Earning: \(calcEarnings())"
        return internInfo
    }
    
} 
