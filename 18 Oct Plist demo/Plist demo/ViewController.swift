//
//  ViewController.swift
//  Plist demo
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readPropertyList()
    }
    
    func readPropertyList()
    {
        //	var format = PropertyListSerialization.PropertyListFormat(rawValue: )    //format of the property list
        var format = PropertyListSerialization.PropertyListFormat(rawValue: 0)
        var plistData:[String:AnyObject] = [:]  //our data
        let plistPath:String? = Bundle.main.path(forResource: "Questions", ofType: "plist")!
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        
        do
        {
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &format!) as! [String : AnyObject]
            var questions : [String:Array<String>] = plistData["Data"] as! [String:Array<String>]
            
            for keys in questions.keys
            {
                var answer : [String] = questions[keys]!
                print("------  \(keys) \t \(answer[0]) ")
                print("(A) ",answer[1])
                print("(B) ",answer[2])
                print("(C) ",answer[3])
                print("(D) ",answer[4])
                print("Answer is  : " , answer[Int(answer[5])!] , "Index : " , answer[5])
            }
        }
        catch
        {
            print("Error reading plist: \(error), format: \(format)")
        }
        
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

