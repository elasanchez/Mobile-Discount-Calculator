//
//  dcModel.swift
//  DiscountCalculator
//
//  Created by Luigi on 3/18/17.
//  Copyright © 2017 Luigi. All rights reserved.
//

import Foundation


//discountProcess will be the model of the Discount Calculator
class discountProcess
{
    //MARK: singleton
    static let shared = discountProcess()
 
    var _price:Float
    var _flatDiscount:Float
    var _percentDiscount: Float
    var _additionalDiscount: Float
    var _tax : Float
    var _discountedPrice: Float
    var _originalTotalPrice: Float
    
     var price: Float {
        get
        {
            return self._price
        }
        set
        {
            _price = newValue
        }
    }
    var flatDiscount: Float {
        get
        {
            return self._flatDiscount
        }
        set
        {
            self._flatDiscount = newValue
        }
    }
    var percentDiscount: Float {
        get
        {
            return self._percentDiscount
        }
        set
        {
            self._percentDiscount = newValue
        }
    }
    var additionalDiscount: Float {
        get
        {
            return self._additionalDiscount
        }
        set
        {
            self._additionalDiscount = newValue
        }
    }
    var tax: Float {
        get
        {
            return self._tax
        }
        set
        {
            self._tax = newValue
        }
    }
    var discountedPrice: Float {
        get
        {
            return self._discountedPrice
        }
        set
        {
            self._discountedPrice = newValue
        }
    }
   internal var originalTotalPrice: Float{
        get
        {
            return self._originalTotalPrice
        }
        set
        {
            self._originalTotalPrice = newValue
        }
    }
    
    
    init(_ price: Float = 0, _ flatDiscount: Float = 0, _ percentDiscount: Float = 0,_ additionalDiscount:Float = 0, _ tax:Float = 0, _ originalPrice: Float = 0, _ discountedPrice: Float = 0)
    {
        print("In")
        self._price = price
        self._flatDiscount = flatDiscount
        self._percentDiscount = percentDiscount
        self._additionalDiscount = additionalDiscount
        self._tax = tax
        self._originalTotalPrice = originalPrice
        self._discountedPrice = discountedPrice
    }
    
    func calculate()
    {
        //get data from global var and store output in a variable
        let discountPrice = price * (percentDiscount/100 + additionalDiscount/100)
        let taxRate = price * (tax/100)
        self._discountedPrice = price + taxRate - discountPrice - flatDiscount
        print("discounted ")
        print(_discountedPrice)
        self._originalTotalPrice  = price + tax
        print("originaTotalPrice")
        print(_originalTotalPrice)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
