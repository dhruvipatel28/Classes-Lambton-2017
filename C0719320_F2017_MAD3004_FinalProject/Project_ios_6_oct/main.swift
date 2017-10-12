//
//  main.swift
//  Project_ios_6_oct
//
//  Created by MacStudent on 2017-10-06.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//


var AllEmployees = [Employee]()

var Vehicle_car = Car(Make: "Audi"
    , Model: "A5"
    , type: "Auto Matic"
    , gasType: "Petrol")

var commissionPartTime_car = CommissionBasedPartTime(ppName:"Ramesh"
    , ppAge: 45
    , pHourlyRate: 17
    , pNumberHoursWorked: 40
    , ppV:Vehicle_car)

print(Vehicle_car.printMyData())
Vehicle_car.printMyData()
// ------------------------------------------------------------------------------------------------

var motorcycle_obj = Motorcycle(Make: "Bajaj"
    , Model: "Bullet"
    , seattype: "Sigle Seatter")


var fixedPartTime_motor = FixedBasedPartTimes(ppName: "Ganesh"
    , ppAge: 40
    , pHourlyRate: 30
    , pNumberHoursWorked: 25
    , ppV: motorcycle_obj
    , pnoOfDaysInWeek: 5)


// ------------------------------------------------------------------------------------------------

var commissionPartTime_obj = CommissionBasedPartTime(ppName:"Jack"
    , ppAge: 35
    , pHourlyRate: 20
    , pNumberHoursWorked: 20 )

// ------------------------------------------------------------------------------------------------

var fixedPartTime_obj = FixedBasedPartTimes(ppName: "Rana"
    , ppAge: 37
    , pHourlyRate: 33
    , pNumberHoursWorked: 25
    , pnoOfDaysInWeek: 3)


// ------------------------------------------------------------------------------------------------

var fulltime_obj = FullTime(ppName: "Jhon", ppAge: 41, pSalary: 680, pBonus: 30 , ppV: motorcycle_obj)

var fulltime_emp = FullTime(ppName: "Jill", ppAge: 31, pSalary: 678, pBonus: 24 )

// ------------------------------------------------------------------------------------------------

var intern = Intern(pName : "Matthew"
    , pAge : 24
    , pSchool : "Sheridan College"
    , pdepartment : "Marketing") //ppV

var intern3 = Intern(pName : "Rat"
    , pAge : 22
    , pSchool : "Cestar College"
    , pdepartment : "Big Data"
    )

var intern4 = Intern(pName : "Walter"
    , pAge : 21
    , pSchool : "Lambton College"
    , pdepartment : "Information Techonology"
    )

// ------------------------------------------------------------------------------------------------

AllEmployees.append(commissionPartTime_car)
AllEmployees.append(fixedPartTime_motor)
AllEmployees.append(commissionPartTime_obj)
AllEmployees.append(fixedPartTime_obj)
AllEmployees.append(intern)
AllEmployees.append(intern3)
AllEmployees.append(intern4)
AllEmployees.append(fulltime_obj)
AllEmployees.append(fulltime_emp)

// -----------------------------------------------

MySingleton.getInstant().setEmployeeAray(AllEmployees)

var Employees = MySingleton.getInstant().getEmployeeArray()

//-------------------------------------------------

// calculate payroll

var totalPR : Double = 0.0
var EachEmployee : Employee

for i in 0..<Employees.count
{
    
    EachEmployee = Employees[i]
    let earn = EachEmployee.calcEarnings()
    print(EachEmployee.printMyData())
    
    print ("  -----------   -----------  \n\n")
    totalPR = totalPR + earn
}

print ("TOTAL PAYROLL: \(totalPR)")


/*
 /////////////////////////////////////////   Add At time of Exam
 
 var intern1 = Intern("Walter" , 21 , "Lambton College" , "Information Techonology")
 AllEmployees.append(intern1)
 
 var intern3 = Intern("Rat" , 22 , "Cestar College" , "Big Data")
 AllEmployees.append(intern3)
 
 
 
 */





/*
 /////////////////////////////////////////   Add At time of Exam
 
 var intern1 = Intern("Walter" , 21 , "Lambton College" , "Information Techonology")
 AllEmployees.append(intern1)
 
 var intern3 = Intern("Rat" , 22 , "Cestar College" , "Big Data")
 AllEmployees.append(intern3)
 
 
 
 */




/*
 
 // create fulltime
 var fullTimeEmp = FullTime() // default constructor
 fullTimeEmp.name = "Janet"
 fullTimeEmp.age = 20
 fullTimeEmp.salary = 50000
 fullTimeEmp.bonus = 2000
 
 var vehicleFullTime = Vehicle(pMake: "Ferrari",pModel: "458")
 fullTimeEmp.vehicle = vehicleFullTime
 AllEmployees.append(fullTimeEmp)
 
 // create parttime
 var partTimeEmp : PartTime
 vehicleFullTime = Vehicle(pMake: "Porsche", pModel: "Carrera")
 partTimeEmp = PartTime(ppName: "Matthew", ppAge: 10, pHourlyRate: 100, pNumberHoursWorked: 2, ppV: vehicleFullTime)
 AllEmployees.append(partTimeEmp)
 
 
 //create intern
 
 vehicleFullTime = Vehicle(pMake: "BMW", pModel: "X6")
 var it1 = Intern(pName: "Loonie", pAge: 15, pSchool: "WoofCenter", "Marketing ",ppV: vehicleFullTime)
 AllEmployees.append(it1)
 
 //create intern
 var it2 = Intern( "Toonie", 15, "JKWoofCenter" , "Advertice")
 AllEmployees.append(it2)
 
 */



/*
 /////////////////////////////////////////   Add At time of Exam
 
 var intern1 = Intern("Walter" , 21 , "Lambton College" , "Information Techonology")
 AllEmployees.append(intern1)
 
 var intern3 = Intern("Rat" , 22 , "Cestar College" , "Big Data")
 AllEmployees.append(intern3)
 
 
 
 */




