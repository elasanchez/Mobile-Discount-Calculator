//
//  CalculatorViewController.swift
//  DiscountCalculator
//
//  Created by Luigi on 3/10/17.
//  Copyright © 2017 Luigi. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController
{
    
    //MARK: Components
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var flatDiscountTextField: UITextField!
    @IBOutlet weak var percentDiscountTextField: UITextField!
    @IBOutlet weak var additionalDiscountTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!


    @IBOutlet weak var originalPriceDisplayLabel: UILabel!
    @IBOutlet weak var discountedPriceDisplayLabel: UILabel!
    
    
    var priceString = String()
    var flatDiscountString = String()
    var percentDiscountString = String()
    var additionalDiscountString = String()
    var taxString = String()
    var discountedPriceString = String()
    
    let data = discountProcess.shared
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        //  let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        swipeLeft.direction = .left
        //swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeLeft)
        //view.addGestureRecognizer(swipeRight)
       
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if(data.price != 0)
        {
            priceTextField.text = String(data.price)
            flatDiscountTextField.text = String(data.flatDiscount)
            percentDiscountTextField.text = String(data.percentDiscount)
            additionalDiscountTextField.text = String(data.additionalDiscount)
            taxTextField.text = String(data.tax)

        }
    }
    //When user clicks outside of the textbox, endEditing
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //swipe func
    func handleSwipe(_ sender: UIGestureRecognizer) {
        self.performSegue(withIdentifier: "summary", sender: self)
    }
    //we can also store the data in the MODEL
    /*
     
     //declaration
     static let shared:DiscountCalc = DiscounCalc()
     
     //accessing
     let passedData = DiscountCalc.shared
     */

    
    func getData()
    {
        //validate the textfields
        
        priceString = priceTextField.text!
        flatDiscountString = flatDiscountTextField.text!
        percentDiscountString = percentDiscountTextField.text!
        additionalDiscountString = additionalDiscountTextField.text!
        taxString = taxTextField.text!
        
        let price = Float(priceString)!
        let flatDiscount = Float(flatDiscountString)!
        let discountRate = Float(percentDiscountString)!
        let additionalDiscount = Float(additionalDiscountString)!
        let taxRate = Float(taxString)!
        
        data.price = price
        data.flatDiscount  = flatDiscount
        data.percentDiscount = discountRate
        data.additionalDiscount = additionalDiscount
        data.tax = taxRate
        
    }
    
    //MARK: calculate
    @IBAction func calculateButton(_ sender: Any)
    {
        getData()
        data.calculate()
        
        if(data.originalTotalPrice >= 0 && data.discountedPrice >= 0)
        {
            originalPriceDisplayLabel.text = "Original Price: $\(data.originalTotalPrice)"
            discountedPriceDisplayLabel.text = "Discounted Price: $\(data.discountedPrice)"
        }
        else
        {
            originalPriceDisplayLabel.text = "Invalid transaction,"
            discountedPriceDisplayLabel.text = "try again."
        }
        
    }
  
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue)
    {
        
    }
 
}



















