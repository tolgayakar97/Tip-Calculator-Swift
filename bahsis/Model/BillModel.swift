//
//  BillModel.swift
//  bahsis
//
//  Created by Tolga Yakar on 21.01.2024.
//

import Foundation

class BillController
{
    private var _billAmount : Double?
    private var _percentageAmount : Double?
    private var _personAmount : Int?
    
    //MARK - Computed Properties
    
    var billAmount:  Double  {
        set
        {
            _billAmount = newValue
        }
        get
        {
            return _billAmount!
        }
    }
    
    var percentageAmount:  Double  {
        set
        {
            _percentageAmount = newValue
        }
        get
        {
            return _percentageAmount!
        }
    }
    
    var personAmount:  Int  {
        set
        {
            _personAmount = newValue
        }
        get
        {
            return _personAmount!
        }
    }
  
    
    func calculate() -> Double
    {
        billAmount = (billAmount * percentageAmount) + billAmount

        let result = billAmount / Double(personAmount)
        
        return result
    }
}
