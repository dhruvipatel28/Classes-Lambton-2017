//
//  main.swift
//  StudentProject
//
//  Created by MacStudent on 2017-10-04.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import Foundation

print("Hello, World!")

var s1 = Student()

var s2 = Student(sid: 1, snm: "Cestar College" , marks:[120.0,80.50,90.00])
print("------- student class -------- \n\n")
s2.Welcome(Name: "Student Class Object")
s2.display()
s2.sid = 100
print("Total marks are : \(s2.total)")
s2.goodbye()


print("------- FullTimeStudent class --------\n\n")
var f1  = FullTimeStudent(sid: 2000,snm: "Name", marks:[20.0,40.50,60.00])
f1.Welcome(Name: "Student Full Time Class")
f1.display()
print("Total marks from Fulltime object : \(f1.total)")
f1.goodbye()

//var f2  = FullTimeStudent()
//f2.sid = 23
//f2.display()

