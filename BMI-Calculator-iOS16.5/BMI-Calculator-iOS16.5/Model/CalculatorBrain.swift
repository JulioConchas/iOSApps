//
//  CalculatorBrain.swift
//  BMI-Calculator-iOS16.5
//
//  Created by Julio Conchas on 31/01/24.
//

import UIKit

struct CalculatorBrain
{
    var bmi : String? //Optional
    var bmi_0 : BMI?
    
    mutating func calculateBMI(heigth : Float , weight : Float )
    {
        //self.bmi = String(format:"%.1f",(weight/pow(heigth,2)))
        let bmiValue = weight/pow(heigth,2)
        let info = getInfo(bmiValue: bmiValue)
        bmi_0 = BMI(value: String(format:"%.1f",bmiValue), advice: info.message, color: info.color)
    }
    func getBMIValue() -> String
    {
        return self.bmi_0?.value ?? "0.0"
    }
    func getAdvice() -> String
    {
        return self.bmi_0?.advice ?? "BMI"
    }
    func getColor() -> UIColor
    {
        return self.bmi_0?.color ?? UIColor.white
    }
    func getInfo(bmiValue : Float) -> Info
    {
        var info : Info
        
        if bmiValue < 18.5
        {
            info = Info(status: "Underweight", message: "Eat more pies!", color: UIColor(red: 80/255, green: 197/255, blue: 244/255, alpha: 1))
        }
        else if bmiValue >= 18.5 && bmiValue <= 24.9
        {
            info = Info(status: "Normal", message: "Fit as a fiddle!", color: UIColor(red: 59/255, green: 244/255, blue: 39/255, alpha: 1))
        }
        else
        {
            info = Info(status: "Overweight", message: "Eat less pies", color: UIColor(red: 245/255, green: 58/255, blue: 13/255, alpha: 1))
        }
       return info
    }
    
}
