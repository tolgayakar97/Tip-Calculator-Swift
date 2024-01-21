//
//  ViewController.swift
//  bahsis
//
//  Created by Tolga Yakar on 20.01.2024.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumber: UILabel!
    
    let billController = BillController()
    let formatter = NumberFormatter()

    var percentage: Double = 0.0
    var bill: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Deselect each button.
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        sender.isSelected = true //Selecting the current tip amount.
        
        //Getting the selected buttons title with currentTitle prop. Because the title is going to have % at the end, dropLast() method is used to remove it. But dropLast() returns Substring, typecasting to String was used.
        
        let amount = String(sender.currentTitle!.dropLast())
        
        //Converting amount value to a double value(for ex: 0.1 for 10%)
        percentage = Double(amount)! / 100.0
        
        //Disable keypad when tipChanged is pressed.
        billTextField.endEditing(true)
        
        //MARK - converting string to double
        
        //Because billTextField has "," inside (for example: 123,4), Double(billTextField!)! cannot be implemented. In order to convert this value to Double, an instance of NumberFormatter has created and setting its numberStyle prop to decimal. And with that formatter, billTextFields value can be converted to Double.
        
        formatter.numberStyle = .decimal
        bill = Double(truncating: formatter.number(from: billTextField.text!)!)
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //Setting billControllers values for calculation.
        billController.billAmount = bill
        billController.percentageAmount = percentage
        billController.personAmount = Int(splitNumber.text!)!
        
        self.performSegue(withIdentifier: "go", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "go") {
            let destination = segue.destination as! ResultViewController
            destination.individualBillAmount = billController.calculate()
            destination.percentageAmount = String(format: "%.0f", billController.percentageAmount * 100)
            destination.personAmount = billController.personAmount
        }
    }
}

