//
//  Motorcycle.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-05.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation
class Motorcycle : Vehicle
{
    private var _seatType : String? // Single Seater , DoubleSeater
    
    var seatType : String
    {
        set
        {
            self._seatType = newValue
        }
        get
        {
            return self._seatType!
        }
    }
    
    override init()
    {
        self._seatType = "Single Seater"
        super.init()
    }
    
    init(Make: String, Model: String , seattype: String)
    {
        self._seatType = seattype
        super.init( pMake: Make, pModel: Model)
    }
    
    override func printMyData() -> String
    {
        let motor = super.printMyData() + "\n \t No Of Passanger/s : \(self._seatType!)"
        return motor
    }
    
    
} // Motorcycle

//CommissionBasedPartTime
//FixedBasedPartTimes
//Commission


























