//
//  ViewController.swift
//  advCalculator
//
//  Created by swift-mw on 2/20/19.
//  Copyright © 2019 swift-mw. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var numOnScreen: Double = 0.0
    var previousNumber: Double = 0.0
    var performingMath = false
    var operation = 0
    
    func make0Empty() /*when called, func will convert 0 to an empty value.  For example, if you click on 1 without this function it would display, "01".  This function eliminates the 0 that comes before the 1.*/
    {
        if lblDisplay.text == "0"
        {
            lblDisplay.text = ""
        }
    }
    
    @IBOutlet weak var lblDisplay: UILabel!
    
    @IBAction func negativebtn(_ sender: UIButton)
    {
        if sender.tag == 11 //convert to negative or positive
        {
            numOnScreen *= -1
            let label = String(numOnScreen)
            lblDisplay.text = label
        }
        
    }
    @IBAction func btnNum(_ sender: UIButton)
    {
        //count = 0
        make0Empty()
        if performingMath == true
        {
            lblDisplay.text = String(sender.tag-1)
            numOnScreen = Double(lblDisplay.text!)!
            performingMath = false
        }
        else
        {
            lblDisplay.text = lblDisplay.text! + String(sender.tag-1)
            numOnScreen = Double(lblDisplay.text!)!
        }
    }
    @IBAction func btnClear(_ sender: UIButton)
    {
        lblDisplay.text = "0"
        count = 0
        
    }
    var count : Int = 0
    @IBAction func dotOperator(_ sender: UIButton)
    {
        if sender.tag == 18 && count <= 0
        {
            lblDisplay.text = (lblDisplay.text)! + "." /*trying to make the button only do it's function one time*/
            count = count + 1
        }
        
        if sender.isEnabled
        {
           count = 1
        }
    }
    
    @IBAction func percentageVal(_ sender: UIButton)
    {
        if sender.tag == 12  //Percentage value
        {
            lblDisplay.text = String(numOnScreen * 0.01)
        }
    }
    @IBAction func btnCalc(_ sender: UIButton)
    {
        let c1 = Calculator(firstNum: previousNumber, secondNum: numOnScreen)
       
       
     if sender.tag != 11 && sender.tag != 12 && sender.tag != 17 && sender.tag != 18
     {
        previousNumber = Double(lblDisplay.text!)!
        if sender.tag == 13  //Division
        {
            lblDisplay.text = "/"
        }
        else if sender.tag == 14  //Multiplication
        {
            lblDisplay.text = "x"
        }
        else if sender.tag == 15  //Subtraction
        {
            lblDisplay.text = "-"
        }
        else if sender.tag == 16  //Addition
        {
            lblDisplay.text = "+"
        }
        lblDisplay.text = String(numOnScreen)
        performingMath = true
        operation = (sender.tag)
     }
        if sender.tag == 17  // Equals
        {
            if operation == 13 //Division
            {
                lblDisplay.text = String(c1.divide())
            }
            else if operation == 14 //Multiplication
            {
                lblDisplay.text = String(c1.multiply())
            }
            else if operation == 15 //Subtraction
            {
                lblDisplay.text = String(c1.subtract())
            }
            else if operation == 16 //Addition
            {
                lblDisplay.text = String(c1.add())
            }
            
        }
        
    }

   
    


}

struct Calculator
{
    var firstNum: Double = 0.0
    var secondNum: Double = 0.0
    
    func add() -> Double
    {
        return firstNum + secondNum
    }
    func subtract() -> Double
    {
        return firstNum - secondNum
    }
    func multiply() -> Double
    {
        return firstNum * secondNum
    }
    func divide() -> Double
    {
        return firstNum / secondNum
    }
}
