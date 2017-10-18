//
//  EmployeeDataViewController.swift
//  Navigation Demo
//
//  Created by MacStudent on 2017-10-16.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class EmployeeDataViewController: UIViewController
{

    @IBOutlet weak var lbl_view_all_employee: UILabel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btn_view_all_employee(_ sender: UIButton)
    {
        var allData : String = ""
        var employee_obj : Employee
        
        for id in Employee.employeeList.keys
        {
            employee_obj = Employee.employeeList[id]!
            allData += " Employee ID : \t  \(id)\n"
            allData += " Employee Name : \t  \(employee_obj.employee_id)\n"
            allData += " Employee Salary : \t \(employee_obj.salary)\n"
            allData += " Employee Birth Date : \t \(employee_obj.birtday)\n"
            allData += " ------------------------------- \n\n"
        }
        
        self.lbl_view_all_employee.text = allData
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
