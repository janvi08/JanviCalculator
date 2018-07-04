//
//  ViewController.swift
//  JCalculator
//
//  Created by admin on 12/12/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var answer = 0.0
    var num1=0.0
    var num2=0.0
    var oper=""
    var dec=false
    var cal=false
    @IBOutlet weak var labelDisplay: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let number = sender.currentTitle
        if cal==true
        {
        labelDisplay.text=""
            cal=false
        }
        if labelDisplay.text == "0"        {
            labelDisplay.text = number!
            
        }
        else {
        labelDisplay.text = labelDisplay.text! + number!
        }
        
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        labelDisplay.text="0"
        num1=0
        num2=0
        answer=0
        
        
    }
    @IBAction func squareroot(_ sender: UIButton) {
        var number = labelDisplay.text
        let num = Double(number!)
        number = "\(sqrt(num!))"
        labelDisplay.text=number
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if dec==false{
        labelDisplay.text=labelDisplay.text!+"."
            dec=true
    }
    }
    @IBAction func solution(_ sender: UIButton) {
         num2=Double(labelDisplay.text!)!
        switch oper {
        case "+":
            answer = num1+num2
            break
        case "-":
            answer = num1-num2
            break
        case "*":
            answer = num1*num2
            break
        case "/":
            answer = num1/num2
            break
        default:
            answer = 0.0
            
        }
        labelDisplay.text="\(answer)"
        cal=true
        dec=false
        
    }
    @IBAction func operation(_ sender: UIButton) {
        num1=Double(labelDisplay.text!)!
        labelDisplay.text="0"
        oper = sender.currentTitle!
        dec=false
    }
    
    @IBAction func trigo(_ sender: UIButton) {
        let trig=sender.currentTitle!
        var num=Double(labelDisplay.text!)!
        num=(num/180)*Double.pi
        switch trig {
        case "sin":
            num=sin(num)
            break
        case "cos":
            num=cos(num)
            break
        default:
            labelDisplay.text=labelDisplay.text
        }
        if num < 0.00000001{
        num=0.0
        }
        
        labelDisplay.text="\(num)"
        cal=true
    }
    }


