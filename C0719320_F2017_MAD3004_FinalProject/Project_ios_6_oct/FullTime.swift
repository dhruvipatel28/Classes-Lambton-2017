//
//  FullTime.swift
//  Project_ios_6_oct
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation
public class FullTime : Employee
{
    private var _salary : Int?
    private var _bonus : Int?
    
    var salary : Int
    {
        set
        {
            self._salary = newValue
        }
        get
        {
            return self._salary!
        }
    }
    
    var bonus : Int
    {
        set
        {
            self._bonus = newValue
        }
        get
        {
            return self._bonus!
        }
    }
    
    override init()
    {
        self._salary = 0
        self._bonus = 0
        super.init();
    }
    
    init(ppName: String, ppAge: Int, pSalary: Int, pBonus: Int)
    {
        self._salary = pSalary
        self._bonus = pBonus
        super.init(ppName, ppAge)
    }
    
    init(ppName: String, ppAge: Int, pSalary: Int, pBonus: Int, ppV: Vehicle)
    {
        self._salary = pSalary
        self._bonus = pBonus
        super.init(ppName, ppAge, ppV)
    }
    
    
    override func calcEarnings() -> Double
    {
        return Double(salary + bonus)
    }
    
    func printMyData()
   {
        print ("Salary: \(self._salary!)")
        print ("Bonus: \(self._bonus!)")
    
    }
    override func printMyData() -> String
    {
        let rateString = super.printMyData() +  "\n \t Salary: \(self._salary!) \n"
            + "\t Bonus : \(self._bonus!)\n"
            + "\t Earnings : \(calcEarnings()) (\(self._salary!) + \(self._bonus!) )"
        return rateString
    }
    
    
    
}
//
//  FullTime.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//


