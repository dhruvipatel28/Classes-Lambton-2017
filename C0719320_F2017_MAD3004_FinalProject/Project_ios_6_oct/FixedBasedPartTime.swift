//
//  FixedBasedPartTimes.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-05.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation
class FixedBasedPartTimes : PartTime
{
    private var _noOfDaysInWeek : Int?
    
    var noOfDaysInWeek : Int
    {
        set
        {
            self._noOfDaysInWeek = newValue
        }
        get
        {
            return self._noOfDaysInWeek!
        }
    }
    
    
    struct giveBonus
    {
        var days:Int = 0
        var bonus:Double
        {
            switch days
            {
            case 4:
                return 20.00 //4 * 5 bonus
            case 5:
                return 30.00 //5 * 6 bonus
            case 6 :
                return 42.00 //6 * 7 bonus
            case 7:
                return 56.00 //7 * 8 bonus
            default:
                return  0
            }
        }
        
    } //struct giveBonus
    
    override init()
    {
        self._noOfDaysInWeek = 5
        super.init()
    }
    
    init(ppName: String, ppAge: Int,  pHourlyRate: Int, pNumberHoursWorked: Int, pnoOfDaysInWeek : Int)
    {
        //bonusAmount = 5
        self._noOfDaysInWeek = 5
        if(pnoOfDaysInWeek > 0 && pnoOfDaysInWeek <= 7)
        {
            self._noOfDaysInWeek = pnoOfDaysInWeek
        }
        super.init(ppName, ppAge ,pHourlyRate, pNumberHoursWorked)
    }
    
    init(ppName: String, ppAge: Int, pHourlyRate: Int, pNumberHoursWorked: Int, ppV: Vehicle , pnoOfDaysInWeek : Int)//vehicle
    {
        //bonusAmount = 5
        self._noOfDaysInWeek = 5
        if(pnoOfDaysInWeek > 0 && pnoOfDaysInWeek <= 7)
        {
            self._noOfDaysInWeek = pnoOfDaysInWeek
        }
        super.init(ppName: ppName, ppAge: ppAge ,pHourlyRate: pHourlyRate, pNumberHoursWorked: pNumberHoursWorked, ppV:ppV)
    }
    
    override func calcEarnings() -> Double
    {
        /*var salary : Double = Double(numberHoursWorked * hourlyRate)
         //var comission_amount = (Double(numberHoursWorked * hourlyRate) *                                 Double(self.Commission)) / 100
         //var Earning = (Double(numberHoursWorked * hourlyRate) +                                            Double(noOfDaysInWeek*bonusAmount))
         //! + (Double(numberHoursWorked * hourlyRate))
         */
        
        let bonus:Double = (giveBonus(days:self._noOfDaysInWeek!).bonus)
        return (Double(numberHoursWorked * hourlyRate) + bonus)
        
    }
    
    override func printMyData() -> String
    {
        let bonus:Double = (giveBonus(days:self._noOfDaysInWeek!).bonus)
        let fixData =  super.printMyData() +  "\n \t No of Days/Week : \(self._noOfDaysInWeek!) " + "\n \t Bonus : \(bonus) \n"
            + "\t Earnings : \(calcEarnings()) (\(numberHoursWorked * hourlyRate) + \(bonus))"
        return fixData
    }
    
} //FixedBasedPartTimes
