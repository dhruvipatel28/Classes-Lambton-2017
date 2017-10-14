//
//  SecondViewController.swift
//  FirstExample
//
//  Created by MacStudent on 2017-10-13.
//  Copyright © 2017 moxDroid. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{

    @IBAction func btn_showAlert(_ sender: UIButton)
    {
        let alert  = UIAlertController(title: "Login Response", message: "You failed to logged In", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let actionTryAgain = UIAlertAction(title: "Try Again", style: UIAlertActionStyle.destructive, handler: nil)
        let actionCancle = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.cancel, handler: nil)
        let actiionOk = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        let actionConfirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default
            , handler:
            {
                _ in self.someHandler()
            }
        );
        
        alert.addAction(actionTryAgain)
        alert.addAction(actionCancle)
        alert.addAction(actiionOk)
        alert.addAction(actionConfirm)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func someHandler()
    {
        // Do something...
        print("Confirm my data ... !")
    }

    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
