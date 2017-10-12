
//
//  Car.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-05.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

/*
 
 
 */

class Car : Vehicle
{
    private var _type: String? // Auto matic / Gear
    private var _gasType :String? // Petrol / Desal
    
    var type : String
    {
        set
        {
            self._type = newValue
        }
        get
        {
            return self._type!
        }
    }
    
    var gasType : String
    {
        set
        {
            self._gasType = newValue
        }
        get
        {
            return self._gasType!
        }
    }
    
    override init()
    {
        
        self._type = "Auto Metic"
        self._gasType = "Petrol"
        super.init()
    }
    
    init(Make: String, Model: String, type: String)
    {
        self._type = type
        self._gasType = "Petrol"
        super.init( pMake: Make, pModel: Model)
    }
    
    init(Make: String, Model: String, type: String, gasType: String)
    {
        self._type = type
        self._gasType = gasType
        super.init( pMake: Make, pModel: Model)
    }
    
    /*
     override func printVehicleData()
     {
     super.printVehicleData()
     print ("\t Type of Car : \(type)")
     print ("\t Fule Type in Car : \(gasType)")
     }
     */
    
    override func printMyData() -> String
    {
        let motor = super.printMyData() +
            "\n \t Type of Car : \(self._type!)" +
        "\n \t Fule Type in Car : \(self._gasType!)"
        return motor
    }
    
} //Car : Vehicle

































