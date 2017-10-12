
//  Vehicle.swift
//  Project_ios
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation
public class Vehicle: IDisplay
{
    private var _make: String?
    private var _model: String?
    
    var make:String
    {
        set
        {
            self._make = newValue
        }
        get
        {
            return self._make!
        }
    }
    
    var model:String
    {
        set
        {
            self._model = newValue
        }
        get
        {
            return self._model!
        }
    }
    
    init()
    {
        self._make = " "
        self._model = ""
    }
    
    init(pMake: String, pModel: String)
    {
        self._make = pMake
        self._model = pModel
    }
    
    func printMyData() -> String
    {
        
        return "\t Make: \(self._make!) \n \t Model: \(self._model!) "
    }
}

