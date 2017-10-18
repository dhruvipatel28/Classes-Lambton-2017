//
//  ViewController.swift
//  Radio button
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var btn_option1: UIButton!
    @IBOutlet weak var btn_option2: UIButton!
    @IBOutlet weak var btn_option3: UIButton!
    @IBOutlet weak var btn_option4: UIButton!
    
    var selected : String!
    var objectArray : [UIButton]!
    var answerIndex : String!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objectArray = [btn_option1, btn_option2, btn_option3, btn_option4]
        answerIndex = "2"
        //var radioButtonController
        //radioButtonController.setButtonsArray([button1!,button2!,button3!])
    }

    
    @IBAction func btn_option1_click(_ sender:UIButton)
    {
        selected = sender.restorationIdentifier
        btn_option1.setBackgroundImage(UIImage(named: "selected.png") , for: UIControlState.normal)
        btn_option2.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option3.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option4.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        
    }
    
    @IBAction func btn_option2_click(_ sender:UIButton)
    {
        selected = sender.restorationIdentifier
        btn_option2.setBackgroundImage(UIImage(named: "selected.png") , for: UIControlState.normal)
        btn_option1.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option3.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option4.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
       
    }
    
    @IBAction func btn_option3_click(_ sender: UIButton)
    {
        selected = sender.restorationIdentifier
        btn_option3.setBackgroundImage(UIImage(named: "selected.png") , for: UIControlState.normal)
        btn_option2.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option1.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option4.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
    }
    
    @IBAction func btn_option4_click(_ sender: UIButton)
    {
        selected = sender.restorationIdentifier
        btn_option4.setBackgroundImage(UIImage(named: "selected.png") , for: UIControlState.normal)
        btn_option2.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option3.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
        btn_option1.setBackgroundImage(UIImage(named: "unselected.png") , for: UIControlState.normal)
    }
   
    
    @IBAction func btn_click_next(_ sender: Any)
    {
        var selectedButtonIndex: Int = 0
        
        if (selected != nil)
        {
            if(selected != answerIndex)
            {
                for a in objectArray
                {
                    if(a.restorationIdentifier == selected)
                    {
                        a.setBackgroundImage(UIImage(named: "red") , for: UIControlState.normal)
                    }
                }
            }
         } // answer selected
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}






