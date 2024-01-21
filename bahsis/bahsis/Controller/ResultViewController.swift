//
//  ResultViewController.swift
//  bahsis
//
//  Created by Tolga Yakar on 20.01.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var individualBillAmount: Double = 0.0
    var percentageAmount: String = ""
    var personAmount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(format: "%.2f", individualBillAmount)
        descLabel.text = "Split between \(personAmount) people, with \(percentageAmount)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // Go back to the previous controller.
        self.dismiss(animated: true)
    }
    
}
