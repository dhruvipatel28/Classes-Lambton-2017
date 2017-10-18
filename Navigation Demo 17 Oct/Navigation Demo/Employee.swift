//
//  File.swift
//  Navigation Demo
//
//  Created by MacStudent on 2017-10-16.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation


class Employee
{
    var employee_id : Int?
    var employee_name : String?
    var salary: Double?
    var birtday : Date?
    
    static var employeeList = [Int:Employee]()
    
    init()
    {
        employee_id = 0
        employee_name = " "
        salary = 0.0
        birtday = Date()
    }
    
    init(_ empid: Int , _ empName:String , _ empSalary:Double , _ emp_birtDate: Date)
    {
        self.employee_id = empid
        self.employee_name = empName
        self.salary = empSalary
        self.birtday = emp_birtDate
    }
    
    static func addEmployee(employee : Employee ) -> Bool
    {
        
        if (employeeList[employee.employee_id!]) == nil
        {
            employeeList[employee.employee_id!] = employee
            return true
        }
        else
        {
           return false
        }
   } // addEmployee
    
    
    static func getEmployeeDetail(employeeId : Int) -> Employee
    {
        if (self.employeeList[employeeId] != nil )
        {
            return self.employeeList[employeeId]!
        }
        return Employee()
    } // getEmployeeDetail
    
    static func getAllEmployee() -> [Int : Employee]
    {
        return self.employeeList
    }// getAllEmployee
    
    
    static func updateEmployeeData(employee_obj : Employee) -> Bool
    {
        if (self.employeeList[employee_obj.employee_id!] != nil )
        {
            self.employeeList[employee_obj.employee_id!] = employee_obj
            return true
        }
        return false
    } // updateEmployeeData
    
    
    static func removeEmplotee(employee_obj : Employee) -> Bool
    {
        if(self.employeeList[employee_obj.employee_id!] != nil)
        {
            self.employeeList.removeValue(forKey: employee_obj.employee_id!)
            return true
        }
        return false
    } // removeEmplotee
    
    
    static func removeEmployeeByID(employee_id : Int) -> Bool
    {
        if (self.employeeList[employee_id] != nil)
        {
            self.employeeList.removeValue(forKey: employee_id)
            return true
        }
        return false
    }
    
    
    static func removeAllEmploye()
    {
        self.employeeList.removeAll()	
    }
    
    
    
} // Employee
