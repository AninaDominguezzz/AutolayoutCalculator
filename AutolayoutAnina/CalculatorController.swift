
import UIKit

class CalculatorController: UIViewController {

    @IBOutlet weak var operationTextField: UITextField!
    var userTypingFinished: Bool = true
    var numArray = [Double]()
    var operatorArray = [String]()
    
    @IBAction func numTapped(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if userTypingFinished {
                operationTextField.text = numValue
                userTypingFinished = false
            } else {
                operationTextField.text = operationTextField.text! + numValue
            }
        }
    }
    
    @IBAction func calcTapped(_ sender: UIButton) {
        userTypingFinished = true
        if let num = Double(operationTextField.text!) {
            numArray.append(num)
            if let operationMethod = sender.currentTitle {
                operatorArray.append(operationMethod)
                if let resultNum = calc() {
                    numArray.removeAll()
                    numArray.append(resultNum)
                    operatorArray.removeFirst()
                    operationTextField.text = String(numArray[0])
                }
            }
        } else {
            operationTextField.text = ""
            operationTextField.placeholder = "El número introducido no es correcto"
            numArray.removeAll()
            operatorArray.removeAll()
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
            operationTextField.text = ""
            operationTextField.placeholder = "0"
            numArray.removeAll()
            operatorArray.removeAll()
    }
    
    func calc() -> Double? {
        if numArray.count == 2 {
            if operatorArray[0].contains("+") {
                return numArray[0] + numArray[1]
            } else if operatorArray[0].contains("-") {
                return numArray[0] - numArray[1]
            } else if operatorArray[0].contains("*") {
                return numArray[0] * numArray[1]
            } else if operatorArray[0].contains("/") {
                return numArray[0] / numArray[1]
            } else if operatorArray[0].contains("=") {
                return numArray[0]
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

