//
//  ViewController.swift
//  Angad_Gupta_Green_Calculator
//
//  Created by Angad Gupta on 17/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets

    @IBOutlet weak var numberDisplay: UITextField!
    var startNewNumber = true
    
    //MARK:- Other Variables
    var calculatorModel = Angad_Calculator_Model()
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- IBActions
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        print("Button touched")
        print(sender.currentTitle!)
        
        let buttonText = sender.currentTitle!
        var currentValue = numberDisplay.text!
        
        switch(buttonText) {
        case "0","1","2","3", "4","5", "6","7", "8","9",".":
//            print(buttonText)
            if(startNewNumber){
                if(buttonText == "."){
                    currentValue = "0."
                }
                else{
                    currentValue = buttonText
                }
            }else{
                if(buttonText == "."){
                    if(currentValue.contains(".")){
                        
                    }
                    else{
                        currentValue = currentValue + buttonText
                    }
                }
                else{
                    currentValue = currentValue + buttonText
                }
            }
            startNewNumber = false
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
        case "+","-","X","/":
            if(calculatorModel.secondNumber != nil){
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            
            calculatorModel.operation = buttonText
            startNewNumber = true
        case "=":
            if(calculatorModel.secondNumber == nil){
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            currentValue = String(calculatorModel.getResult())
        
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
        default:
                print(buttonText)
            
           
        }
        
        numberDisplay.text = currentValue
    }
}

