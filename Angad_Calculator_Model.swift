//
//  Angad_Calculator_Model.swift
//  Angad_Gupta_Green_Calculator
//
//  Created by Angad Gupta on 17/09/2022.
//

import Foundation

class Angad_Calculator_Model {
    var firstNumber : Double?
    var secondNumber : Double?
    var operation : String?
    
    func updateNumber(newNumber : Double){
        if(firstNumber == nil){
            firstNumber = newNumber
        } else if(operation == nil){
            firstNumber = newNumber
        } else {
            secondNumber = newNumber
        }
    }
    
    func getResult() -> Double {
        var result: Double
        switch (operation) {
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "X":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        default:
            result = 0.0
            
        }
        return result
    }
    
    func reset(){
        firstNumber = nil
        secondNumber = nil
        operation = nil
    }
}
