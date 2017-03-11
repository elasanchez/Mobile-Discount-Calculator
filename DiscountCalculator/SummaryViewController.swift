//
//  SummaryViewController.swift
//  DiscountCalculator
//
//  Created by Luigi on 3/10/17.
//  Copyright © 2017 Luigi. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController
{

    
    @IBOutlet weak var priceLabel: UILabel!
 
    var priceString = String()
    var flatDiscountString = String()
    var percentDiscountString = String()
    var additionalDiscountString = String()
    var taxString = String()
    var discountedPriceString = String()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        //swipeLeft.direction = .left
        swipeRight.direction = .right
        
        //view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
    }

    
    //pass data to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let DestinationViewController : CalculatorViewController  = segue.destination as! CalculatorViewController
        
        //pass raw data as string
        DestinationViewController.priceString = self.priceString
        DestinationViewController.flatDiscountString = self.flatDiscountString
        DestinationViewController.percentDiscountString = self.percentDiscountString
        DestinationViewController.additionalDiscountString = self.additionalDiscountString
        DestinationViewController.taxString = self.taxString
        
        DestinationViewController.discountedPriceString = discountedPriceString
    }
    
    //swipe func
    func handleSwipe(_ sender: UIGestureRecognizer)
    {
        performSegue(withIdentifier: "calculator", sender: self)
    }
}





