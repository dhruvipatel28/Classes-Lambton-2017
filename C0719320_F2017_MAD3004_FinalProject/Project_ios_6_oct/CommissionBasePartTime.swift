//
//  CommissionBasedPartTime.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-05.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation


class CommissionBasedPartTime : PartTime
{
    private var _commission : Double?
    private var Earning : Double?
    
    var Commission : Double
    {
        set
        {
            self._commission = newValue
        }
        get
        {
            return self._commission!
        }
    }
    
    
    override init()
    {
        self._commission = 1.0
        super.init()
    }
    
    init( ppName: String,  ppAge: Int,  pHourlyRate: Int, pNumberHoursWorked: Int)
    {
        self._commission = 1.0
        super.init(ppName, ppAge ,pHourlyRate, pNumberHoursWorked)
        setCommission(hours:pNumberHoursWorked)
    }
    
    override init(ppName: String,  ppAge: Int, pHourlyRate: Int,  pNumberHoursWorked: Int , ppV: Vehicle )
    {
        self._commission = 1.0
        super.init(ppName: ppName, ppAge: ppAge ,pHourlyRate: pHourlyRate, pNumberHoursWorked: pNumberHoursWorked, ppV:ppV)
        setCommission(hours:pNumberHoursWorked)
        
    }
    
    /* 20 - 30 : 2.5%
     30 - 40 : 4.0%
     40... : 4.5%*/
    func setCommission(hours : Int)
    {
        switch hours
        {
        case 20...30:
            self.Commission = 2.5
        case 30...40:
            self.Commission = 4.0
        case 40...:
            self.Commission = 4.5
        default:
            self.Commission = 0.2
        }
    }
    
    override func calcEarnings() -> Double
    {
        //var salary : Double = Double(numberHoursWorked * hourlyRate)
        //var comission_amount = (Double(numberHoursWorked * hourlyRate) * Double(self.Commission)) / 100
        Earning = (Double(numberHoursWorked * hourlyRate) * Double(self._commission!)) / 100
        return Earning! + (Double(numberHoursWorked * hourlyRate))
    }
    
    override func printMyData() -> String
    {
        let com = super.printMyData() +  "\n \t Commission : \(self._commission!) \n"
            + "\t Earnings : \(calcEarnings()) (" + "\(numberHoursWorked * hourlyRate) "
            + " + \(self._commission!) % of \(numberHoursWorked * hourlyRate )" + ")"
        return com
    }
}
