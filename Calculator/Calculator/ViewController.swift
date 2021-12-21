//
//  ViewController.swift
//  Calculator
//
//  Created by user on 14.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var operand = ""
    var numberOne = ""
    var numberTwo = ""

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func inputNumber(_ sender: UIButton) {
        if operand.isEmpty{
            numberOne = numberOne + (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        }else{
            numberTwo = numberTwo + (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        operand = ""
        numberOne = ""
        numberTwo = ""
        resultLabel.text = "0"
    }
    @IBAction func inputOperand(_ sender: UIButton) {
        operand = sender.titleLabel?.text as! String
    }
    @IBAction func resultAction(_ sender: Any) {
    var result = 0.0
    
    switch operand {
    case "/":
    result = Double(numberOne)!/Double(numberTwo)!
    case "*":
    result = Double(numberOne)!*Double(numberTwo)!
    case "-":
    result = Double(numberOne)!-Double(numberTwo)!
    case "+":
    result = Double(numberOne)!+Double(numberTwo)!
    default:
    break
    }
    
        if result.truncatingRemainder(dividingBy: 1.0) == 00 {
            resultLabel.text = String(Int(result))
        }else {
            resultLabel.text = String(result)
        }
    }
}
