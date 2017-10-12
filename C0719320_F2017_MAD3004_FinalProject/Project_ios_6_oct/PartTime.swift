//
//  PartTime.swift
//  Project_ios_6_oct
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation


public class PartTime: Employee
{
    
    private var _hourlyRate : Int?
    private var _numberHoursWorked : Int?
    
    var hourlyRate : Int
    {
        set
        {
            self._hourlyRate = newValue
        }
        get
        {
            return self._hourlyRate!
        }
    }
    
    var numberHoursWorked : Int
    {
        set
        {
            self._numberHoursWorked = newValue
        }
        get
        {
            return self._numberHoursWorked!
        }
    }
    
    override init()
    {
        self._hourlyRate = 0
        self._numberHoursWorked = 0
        super.init();
    }
    
    init(_ ppName: String, _ ppAge: Int, _ pHourlyRate: Int, _ pNumberHoursWorked: Int)
    {
        self._hourlyRate = pHourlyRate
        self._numberHoursWorked = pNumberHoursWorked
        super.init(ppName, ppAge)
    }
    
    init(ppName: String, ppAge: Int, pHourlyRate: Int, pNumberHoursWorked: Int, ppV: Vehicle)
    {
        self._hourlyRate = pHourlyRate
        self._numberHoursWorked = pNumberHoursWorked
        super.init(ppName, ppAge, ppV)
    }
    
    
    override func calcEarnings() -> Double
    {
        return Double(numberHoursWorked * hourlyRate)
    }
    
    override func printMyData() -> String
    {
        let rateString = super.printMyData() +  "\n \t Rate: \(self._hourlyRate!) \n"
            + "\t Hours Worked: \(self._numberHoursWorked!)"
        return rateString
    }
    
}


