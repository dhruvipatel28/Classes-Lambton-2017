//
//  ViewController.swift
//  Switch View Controller
//
//  Created by MacStudent on 2017-10-13.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class MySwitchViewController: UIViewController
{

    @IBOutlet weak var lbl_switch_change: UILabel!
    @IBOutlet weak var my_switch: UISwitch!
    @IBOutlet weak var progress_bar: UIProgressView!
   
    //@IBOutlet weak var slider_show_range: UISlider!
    //this is required if you want to accsess this object out side the fuction or event
    
    @IBAction func swc_on_off(_ sender: UISwitch) // Call thisfunction at "Value Change" Action
    {
        if my_switch.isOn
        {
            //print("Switch id on ... ! ")
            lbl_switch_change.text = "Switch is on ... ! "
        }
        else
        {
            //print("Switch is off ... !")
            lbl_switch_change.text = "Switch is off ... ! "
        }
    }
    
    @IBAction func slider_change(_ sender: UISlider)
    {
        lbl_switch_change.text = " Slider \(Int(sender.value))"
        // we have set the slider minimum n maximum values 0 , 100 respectively.
        // thats y we can accsess Value of slider here
    progress_bar.progress = Float( sender.value/100 )
      // this will give values between 0 to 1
        // coz progress bar can have values between 0 -1
    }
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

