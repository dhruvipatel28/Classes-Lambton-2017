//
//  ViewController.swift
//  FirstExample
//
//  Created by moxDroid on 2017-10-12.
//  Copyright © 2017 moxDroid. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginClick(_ sender: UIButton) {
        
        if(txtUserEmail.text == "admin@gmail.com" && txtPassword.text == "admin123")
        {
            print("Hello, My First Click : ", txtUserEmail.text! )
        }
        else{
            print("User Email / Password incorrect")
        }
    }
}

