//
//  ViewController.swift
//  Calculator
//
//  Created by Darko Krstevski on 30.12.23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnPositiveNegative: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnComma: UIButton!
    @IBOutlet weak var btnEquals: UIButton!
    
    
    var result: Float?
    var first: Float?
    var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtField.text = ""
        print("ViewDidLoad")
        print(txtField.frame.debugDescription)
        result = 0
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
        print(txtField.frame.debugDescription)
    }
    
    @IBAction func buttonTouchPad(_ sender: Any) {
        if let touchedButton : UIButton = sender as? UIButton{
            var body = 0
            switch touchedButton.tag{
            case 0: print("0")
                txtField.text = (txtField.text ?? "") + "0"
            case 1: print("1")
                txtField.text = (txtField.text ?? "") + "1"
            case 2: print("2")
                txtField.text = (txtField.text ?? "") + "2"
            case 3: print("3")
                txtField.text = (txtField.text ?? "") + "3"
            case 4: print("4")
                txtField.text = (txtField.text ?? "") + "4"
            case 5: print("5")
                txtField.text = (txtField.text ?? "") + "5"
            case 6: print("6")
                txtField.text = (txtField.text ?? "") + "6"
            case 7: print("7")
                txtField.text = (txtField.text ?? "") + "7"
            case 8: print("8")
                txtField.text = (txtField.text ?? "") + "8"
            case 9: print("9")
                txtField.text = (txtField.text ?? "") + "9"
                
            case 10: print("AC")
                txtField.text=""
                result = 0
                
            case 11: print("+/-")
                let number:String = txtField.text ?? "0"
                if Float(number) ?? 1 > 0 {
                    txtField.text = "-\(txtField.text ?? "0")"
                }else{
                    txtField.text = "+\(txtField.text ?? "0")"
                }
                
            case 12: print("%")
                result = (Float(txtField.text ?? "0") ?? 0) / 100
                txtField.text = ("\(result!)")
                
            case 13: print("/")
                first = (Float(txtField.text ?? "0") ?? 0)
                operation = "/"
                txtField.text = ""
                
            case 14: print("*")
                first = (Float(txtField.text ?? "0") ?? 0)
                operation = "*"
                txtField.text = ""
                
            case 15: print("+")
                first = (Float(txtField.text ?? "0") ?? 0)
                operation = "+"
                txtField.text = ""
                print(result!)
                
            case 16: print("-")
                first = (Float(txtField.text ?? "0") ?? 0)
                operation = "-"
                txtField.text = ""
                print(result!)
                
            case 18: print(",")
                txtField.text = "\(txtField.text ?? "0")."
                
                
            case 17: print("=")
                switch operation{
                case "/":
                    let second = (Float(txtField.text ?? "0") ?? 0)
                    
                    if second != 0 {
                        result = (first ?? 0) / second
                    } else{
                        txtField.text = "Error"
                    }
                case "+":
                    result = (first ?? 0) + (Float(txtField.text ?? "0") ?? 0)
                case "-":
                    result = (first ?? 0) - (Float(txtField.text ?? "0") ?? 0)
                case "*":
                    result = (first ?? 0) * (Float(txtField.text ?? "0") ?? 0)
                default:
                    return
                }
                
                if result!.truncatingRemainder(dividingBy: 1) == 0{
                    txtField.text = String(format: "%.0f", result!)
                }
                else{
                    txtField.text = ("\(result!)")
                }
                
            default: print("No button")
            }
        }
        else{
            print ("There were no pressed buttons!")
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
}
