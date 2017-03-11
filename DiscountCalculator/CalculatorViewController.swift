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
    
    override func viewDidLoad() {
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
        priceTextField.text = priceString
        flatDiscountTextField.text = flatDiscountString
        percentDiscountTextField.text = percentDiscountString
        additionalDiscountTextField.text = additionalDiscountString
        taxTextField.text = taxString
    }
    
    //swipe func
    func handleSwipe(_ sender: UIGestureRecognizer) {
        self.performSegue(withIdentifier: "summary", sender: self)
    }
    
    //pass data to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //let us have access to the Summary view controller variables to pass data around
        let DestinationViewController : SummaryViewController  = segue.destination as! SummaryViewController
        
        //pass raw data as string
        DestinationViewController.priceString = self.priceString
        DestinationViewController.flatDiscountString = self.flatDiscountString
        DestinationViewController.percentDiscountString = self.percentDiscountString
        DestinationViewController.additionalDiscountString = self.additionalDiscountString
        DestinationViewController.taxString = self.taxString
        
        DestinationViewController.discountedPriceString = discountedPriceString
        
    }
    
    func calculate()
    {
    
        getData()
        
        let price = Float(priceString)!
        let discountRate = Float(percentDiscountString)!
        let additionalDiscount = Float(additionalDiscountString)!
        let taxRate = Float(taxString)!
        let flatDiscount = Float(flatDiscountString)!
        
        let discountPrice = price * (discountRate/100 + additionalDiscount/100)
        let tax = price * (taxRate/100)
        let discountedPrice = price + tax - discountPrice - flatDiscount
    
        originalPriceDisplayLabel.text = "Original Price: $\(price + tax)"
        discountedPriceString = "Discounted Priced: $\(discountedPrice)"
        discountedPriceDisplayLabel.text = discountedPriceString
     }
    
    func getData()
    {
        priceString = priceTextField.text!
        flatDiscountString = flatDiscountTextField.text!
        percentDiscountString = percentDiscountTextField.text!
        additionalDiscountString = additionalDiscountTextField.text!
        taxString = taxTextField.text!
        
    }
    
    //MARK: calculate
    @IBAction func calculateButton(_ sender: Any)
    {
        calculate()
    }

    
    
}



















