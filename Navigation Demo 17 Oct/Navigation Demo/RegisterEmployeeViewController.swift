//
//  RegisterEmployeeViewController.swift
//  Navigation Demo
//
//  Created by MacStudent on 2017-10-16.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class RegisterEmployeeViewController: UIViewController
{

    @IBOutlet weak var txt_employee_id: UITextField!
    @IBOutlet weak var txt_employee_name: UITextField!
    @IBOutlet weak var txt_employee_salary: UITextField!
    @IBOutlet weak var txt_employee_birtdate: UITextField!
    
    var emp_object = Employee()
    
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
    
   
    @IBAction func btn_clear_data(_ sender: UIButton)
    {
        self.txt_employee_id.text! = ""
        self.txt_employee_name.text! = ""
        self.txt_employee_salary.text! = ""
        self.txt_employee_birtdate.text! = ""
    }
    
    
    @IBAction func btn_register_emp(_ sender: UIButton)
    {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
       //print(dateFormatter.date(from: txt_employee_birtdate.text!))
       
        
        var emp_obj = Employee( Int(txt_employee_id.text!)!
                            , txt_employee_name.text!
                            , Double(txt_employee_salary.text!)!
                            , dateFormatter.date(from: txt_employee_birtdate.text!)!
                            )
        if( Employee.addEmployee(employee: emp_obj) )
        {
            showAlterOnRegister(true)
        }
        else
        {
            showAlterOnRegister(false)
        }
        
    }
    
    // ------ ------- -------------- ----------- ----------- --------- showAlterOnRegister  ------ ------- -------------- ----------- 
    func  showAlterOnRegister(_ isRegisterd : Bool)
    {
        let alert : UIAlertController
        let actionOk : UIAlertAction
            if(isRegisterd)
            {
               alert  = UIAlertController(title: "Employee", message: "Congratulations you are sucessfully registerd", preferredStyle: UIAlertControllerStyle.alert)
               actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            }
            else
            {
                alert  = UIAlertController(title: "Employee", message: "Sorry! Failed to Register !", preferredStyle: UIAlertControllerStyle.alert)
                actionOk = UIAlertAction(title: "Try Again", style: UIAlertActionStyle.cancel, handler: nil)
            }
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
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

