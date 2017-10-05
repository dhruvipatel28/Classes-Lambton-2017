//
//  FullTimeStudent.swift
//  StudentProject
//
//  Created by MacStudent on 2017-10-04.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation

class FullTimeStudent : Student
{
    var noofdays: Int?
    
    override func display()
    {
        super.display()
        print(self.sid , " From Full Time Class ")
    }
}  //FullTimeStudent


extension IDisplay
{
    func Welcome(Name:String)
    {
        print("   ****  Hello, Welcome \(Name)")
    } // Welcome
} // Extention
