//
//  ViewController.swift
//  Plist demo
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Dhruvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource
{
    var format : PropertyListSerialization.PropertyListFormat!
    var plistData:[String:AnyObject]!
    var plistPath:String!
    var plistXML : Any!
    var questions : [String:Array<String>]!
    
    var countyList = ["India" , "United States" ,"United states of emirats" , "Mexico" , "Newzeland" , "United Kigtom" , "China" ,"Africa" ]
    
    var Qlist = [String]()
    var questionList =  [String]()
    var answerList = [String]()
    
    @IBOutlet weak var questionPicker: UIPickerView!
    @IBOutlet weak var lbl_question: UILabel!
    @IBOutlet weak var lbl_answerSelected: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionPicker.dataSource = self
        questionPicker.delegate = self
        
        readplist()
        GetquestionList()
    }

    func readplist()
    {
        format = PropertyListSerialization.PropertyListFormat(rawValue: 0)
        plistPath = Bundle.main.path(forResource: "Questions", ofType: "plist")!
        plistXML = FileManager.default.contents(atPath: plistPath!)!
        readPropertyList()
    }
    
    func readPropertyList()
    {
        //	var format = PropertyListSerialization.PropertyListFormat(rawValue: )    //format of the property list
        
        do
        {
            plistData = try PropertyListSerialization.propertyList(from: plistXML as! Data, options: .mutableContainersAndLeaves, format: &format!) as! [String : AnyObject]
            questions  = plistData["Data"] as! [String:Array<String>]
            
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func  GetquestionList()
    {
        var answer : [String]!
        for keys in questions.keys
        {
            Qlist.append(keys)
            answer = questions[keys]!
            questionList.append(answer[0])
        }
      
    }// GetquestionList
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        var size = 0
        switch  component
        {
            case 0:
                size = Qlist.count
            case 1:
                size = 4
            default:
                return size
        }
        return size
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            lbl_question.text = questionList[row]
            answerList = questions[Qlist[row]]! //getAnswerOptions(question: Qlist[row])
            answerList.removeFirst()
            answerList.removeLast()
            questionPicker.reloadAllComponents()
        }
        else
        {
            lbl_answerSelected.text = answerList[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if (component == 0)
        {
           return  Qlist[row]
        }
        if (component == 1)
        {
              answerList = questions[Qlist[questionPicker.selectedRow(inComponent: 0)]]! //getAnswerOptions(question: Qlist[row])
            answerList.removeFirst()
            answerList.removeLast()
            //print(answerList, row, component)
            return answerList[row]
         }
        return " "
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

