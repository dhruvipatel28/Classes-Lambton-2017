//
//  Student.swift
//  StudentProject
//
//  Created by MacStudent on 2017-10-04.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation

class Student : IDisplay
{
    private var _sid:Int?
    private var _snm:String?
    private var _total:Double?
    private var _marks:[Double]?
    
    var sid:Int
    {
        set
        {
            self._sid = newValue
        }
        get
        {
            return self._sid!
        }
    }
    
    var total:Double
    {
        get
        {
            self._total = self._marks![0] + self._marks![1] + self._marks![2]
            return self._total ?? 0.0
        }
    }
  
    init()
    {
        _sid = 0
        _snm = ""
        _total = 0.0
        _marks = [0.0,0.0,0.0]
    } // init
    
    init(sid: Int , snm: String, marks: [Double])
    {
        self._sid = sid
        self._snm = snm
        self._marks = marks
        self._total = total
    }//init()
    
    func display()
    {
        print(self._sid! , self._snm!)
    }// goodbye
} // student class


//----------------------------------  Extention of Student Start ---------------------------------------


extension Student
{
    func goodbye()
    {
        print("Good Bye from Student Class Extention \n " )
    } // goodbye
} //extension Student



