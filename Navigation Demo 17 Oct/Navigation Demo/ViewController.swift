//
//  ViewController.swift
//  Navigation Demo
//
//  Created by MacStudent on 2017-10-16.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var switch_autologin: UISwitch!
    
    static var loginUserDefault: UserDefaults!
    var isSameUser : Bool!
    
     override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        isSameUser = false
        ViewController.loginUserDefault = UserDefaults.standard
        
        if( (ViewController.loginUserDefault.value(forKey: "userName") as! String?) != nil
            && (ViewController.loginUserDefault.value(forKey: "password") as! String?) != nil)
        {
            txtUserEmail.text = ViewController.loginUserDefault.value(forKey: "userName") as! String?
            txtPassword.text = ViewController.loginUserDefault.value(forKey: "password") as! String?

            isSameUser = true
            switch_autologin.setOn(true, animated: true)
        }
       
    } //viewDidLoad
    
     override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginClickEvent(_ sender: Any)
    {
        if (switch_autologin.isOn)
        {
            ViewController.loginUserDefault.set(txtUserEmail.text, forKey: "userName")
            ViewController.loginUserDefault.set(txtPassword.text, forKey: "password")
            allowLogin()
        }
        else
        {
            if( (txtUserEmail.text == ViewController.loginUserDefault.value(forKey: "userName") as! String?)
                && (txtPassword.text == ViewController.loginUserDefault.value(forKey: "password") as! String?))
            {
                ViewController.loginUserDefault.removeObject(forKey: "userName")
                ViewController.loginUserDefault.removeObject(forKey: "password")
                allowLogin()
            }
            else
            {
                print("User Email / Password incorrect")
            }
         }
    }//loginClickEvent
    
    func allowLogin()
    {
        // to redirect to next screen
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil) // from where to move
        let registerEmployee = storyBoard.instantiateViewController(withIdentifier: "RegisterEmployee") as! RegisterEmployeeViewController
        // we create a object of view controller we need to open
        // Dont forget to give a identifier to the targated view controller
        // Use that identifire in the object creation
        
        self.present(registerEmployee, animated: true, completion: nil)
        // here we present our targated view controller object on the button click.
    }
    
    


}

