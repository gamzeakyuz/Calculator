//
//  ViewController.swift
//  calculator
//
//  Created by Gamze Akyüz on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textResultLabel: UILabel!
    
    @IBOutlet weak var view1: UIView!
    
    var number:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
        
        view1.layer.cornerRadius = 10.0
        
    }
    
    func clearAll(){
        number = ""
        textLabel.text = ""
        textResultLabel.text = ""
    }
    func addNumber(value: String){
        number = number + value
        textLabel.text = number
    }
    func formatResult(result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    @IBAction func buttonPoint(_ sender: Any) {
        addNumber(value: ".")
    }
    
    @IBAction func buttonZero(_ sender: Any) {
        addNumber(value: "0")
    }
    @IBAction func buttonOne(_ sender: Any) {
        addNumber(value: "1")
    }
    @IBAction func buttonTwo(_ sender: Any) {
        addNumber(value: "2")
    }
    @IBAction func buttonThree(_ sender: Any) {
        addNumber(value: "3")
    }
    @IBAction func buttonFour(_ sender: Any) {
        addNumber(value: "4")
    }
    @IBAction func buttonFive(_ sender: Any) {
        addNumber(value: "5")
    }
    @IBAction func buttonSix(_ sender: Any) {
        addNumber(value: "6")
    }
    @IBAction func buttonSeven(_ sender: Any) {
        addNumber(value: "7")
    }
    @IBAction func buttonEight(_ sender: Any) {
        addNumber(value: "8")
    }
    @IBAction func buttonNine(_ sender: Any) {
        addNumber(value: "9")
    }
    
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in number{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0){
                return false
            }
            if (index == number.count-1) {
                return false
            }
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    
    func specialCharacter (char: Character) -> Bool {
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "-"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "%"){
            return true
        }
        return false
    }
    
    
    @IBAction func buttonEquals(_ sender: Any){
        
        if(validInput()){
            let checkedNumberForPercent = number.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedNumberForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            textResultLabel.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalide Input", message: "Calculator unable to do math based on input", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert,animated: true, completion: nil)
            }
        }
    
    @IBAction func buttonPlus(_ sender: Any){
        addNumber(value: "+")
    }
    @IBAction func buttonMinus(_ sender: Any){
        addNumber(value: "-")
    }
    @IBAction func buttonPercent(_ sender: Any){
        addNumber(value: "%")
    }
    @IBAction func buttonDivide(_ sender: Any){
        addNumber(value: "/")
    }
    @IBAction func buttonmMltiply(_ sender: Any){
        addNumber(value: "*")
    }

    @IBAction func buttonClear(_ sender: Any) {
        
        clearAll()
    }
    
    
}

