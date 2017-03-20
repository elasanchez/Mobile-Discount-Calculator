//
//  GraphView.swift
//  BarGraph
//
//  Created by Luigi on 3/6/17.
//  Copyright © 2017 Luigi. All rights reserved.
//

import UIKit


//write an extension
extension CGContext {
    func setFillColor(_ hex: Int) {
        //Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor: CGFloat = CGFloat((hex >> 8) & 0xFF)/255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

class GraphView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     */
    
    //This is to have a shared data between classes?
    //let CalcData: DiscountCalc = DiscountCalc.shared
    
    let data = discountProcess.shared
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = -16.0
        let topGuide:CGFloat = 72.0
        let botGuide:CGFloat = screenHeight - 16
        
        
        //Draw Rectange
        //  context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        context.setFillColor(0x845160)
        context.fill(CGRect(x: leftGuide,y: topGuide, width: screenWidth - 32.0, height: screenHeight - 88.0))
        
        //in pts not pix
        let discountHeight:CGFloat =  (screenHeight - 88.0) * CGFloat((data.originalTotalPrice - data.discountedPrice)/data._originalTotalPrice);
        let discountedHeight:CGFloat = (screenHeight - 88.0) * CGFloat(data.discountedPrice/data._originalTotalPrice);
        
        context.setFillColor(0xf4eb42)
        context.fill(CGRect(x: screenWidth/2, y: discountHeight, width: screenWidth/2 - leftGuide, height: discountedHeight))
        context.setFillColor(0x447c2a)
        context.fill(CGRect(x: screenWidth/2,y: topGuide, width: screenWidth/2 - leftGuide, height: discountedHeight))
        
        
//        //Draw Text
//        let myText = "Cyan Box"
//        let subText = "Baby Bue..."
//        
//        //Text Attrivutes
//        let textAttributes = [
//            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
//            NSForegroundColorAttributeName: UIColor(red: 1.0, green:0.0, blue:1.0, alpha:1.0)
//        ]
//        
//        myText.draw(at: CGPoint(x:leftGuide + 16.0, y: topGuide + 16.00),
//                    withAttributes: textAttributes)
//        subText.draw(at: CGPoint(x:leftGuide + 16.00, y: topGuide + 32),
//                     withAttributes: textAttributes)
        
        
    }
    
    
}
