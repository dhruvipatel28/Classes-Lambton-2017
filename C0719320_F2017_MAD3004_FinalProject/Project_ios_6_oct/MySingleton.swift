//
//  MySingleton.swift
//  Project_ios_6_oct
//
//  Created by MacStudent on 2017-10-10.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation

class MySingleton
{
    private static var instant = MySingleton()
    private var employee : [Employee]
    
    private init()
    {
        employee = [Employee]()
    }
    
    static func getInstant() -> MySingleton
    {
        if instant != nil
        {
            return instant
        }
        else
        {
            instant = MySingleton()
            return instant
        }
    }
    
    
    func getEmployeeArray() -> [Employee]
    {
        return employee
    }
    
    func setEmployeeAray(_ emp : [Employee])
    {
        employee = []
        employee = emp
    }
}



