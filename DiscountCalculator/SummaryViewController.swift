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

    
    @IBOutlet weak var flatDiscountDisplay: UILabel!
    @IBOutlet weak var discountPercentageDisplay: UILabel!
    @IBOutlet weak var finalPricePercentageDisplay: UILabel!
    @IBOutlet weak var finalDisplayLabel: UILabel!
    @IBOutlet weak var finalDiscountedDisplay: UILabel!
 
    var data = discountProcess.shared
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        //swipeLeft.direction = .left
        swipeRight.direction = .right
        
        //view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
        
        
        if(data.discountedPrice >= 0 && data.originalTotalPrice >= 0)
        {
            finalDisplayLabel.text = "$ \(data.originalTotalPrice)"
            flatDiscountDisplay.text = "$ \(data.originalTotalPrice - data.discountedPrice)"
            discountPercentageDisplay.text = String(format: "%.2f",((data.originalTotalPrice - data.discountedPrice)/data.originalTotalPrice)*100) + "%"
            finalDiscountedDisplay.text = "$ \(data.discountedPrice)"
            finalPricePercentageDisplay.text = String(format: "%.2f",(data.discountedPrice/data.originalTotalPrice)*100) + "%"
        }

        
    }
    
    //swipe func
    func handleSwipe(_ sender: UIGestureRecognizer)
    {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
}





