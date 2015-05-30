//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Peter Roome on 28/05/2015.
//  Copyright (c) 2015 Betahive Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //  Labels
    var youHaveLabel: UILabel!
    var moneyLabel: UILabel!
    var totalLemonsLabel: UILabel!
    var totalIceCubesLabel: UILabel!
    
    //  Step 1
    var stepOneLabel: UILabel!
    var lemondsPriceLabel: UILabel!
    var purchaseLemonsLabel: UILabel!
    var iceCubesPriceLabel: UILabel!
    var purchaseIceCubesLabel: UILabel!
    
    //  Step 2
    var stepTwoLabel: UILabel!
    var mixInstructionsLabel: UILabel!
    var mixLemonsLabel: UILabel!
    var mixLemonsNumberLabel: UILabel!
    var mixIceCubesLabel: UILabel!
    var mixIceCubesNumberLabel: UILabel!
    
    // Step 3
    var stepThreeLabel: UILabel!
    var instructionsLabel: UILabel!
    
    // Positioning
    let kEighth:CGFloat = 1.0/8.0
    let kHalf:CGFloat = 1.0/2.0
    let kQuarter:CGFloat = 1.0/4.0
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height / 4))
        self.firstContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.height * kQuarter, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height / 4))
        self.secondContainer.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.height * (2 * kQuarter), width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height / 4))
        self.thirdContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.height * (3 * kQuarter), width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height / 4))
        self.fourthContainer.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView){
        self.youHaveLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y * kThird, width: containerView.frame.width * kHalf, height: containerView.frame.height * kThird))
        self.youHaveLabel.text = "You have:"
        self.youHaveLabel.textColor = UIColor.redColor()
        self.youHaveLabel.font = UIFont(name: "Arial", size: 18)
        self.youHaveLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.youHaveLabel)
    }
    
    func setupSecondContainer(containerView: UIView){
        self.stepOneLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y * kThird, width: containerView.frame.width, height: containerView.frame.height * kThird))
        self.stepOneLabel.text = "Step 1: Purchase Supplies"
        self.stepOneLabel.textColor = UIColor.blueColor()
        self.stepOneLabel.font = UIFont(name: "Arial", size: 18)
        self.stepOneLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepOneLabel)
        
        self.lemondsPriceLabel = UILabel(frame: CGRect(x: containerView.bounds.origin.x, y: containerView.frame.height * kThird, width: containerView.frame.width * kHalf, height: containerView.frame.height * kThird))
        self.lemondsPriceLabel.text = "Lemons for $2:"
        self.lemondsPriceLabel.textColor = UIColor.blackColor()
        self.lemondsPriceLabel.font = UIFont(name: "Arial", size: 18)
        self.lemondsPriceLabel.textAlignment = NSTextAlignment.Right
        self.lemondsPriceLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.lemondsPriceLabel)
        
        self.iceCubesPriceLabel = UILabel(frame: CGRect(x: containerView.bounds.origin.x, y: containerView.frame.height * ( 2 * kThird), width: containerView.frame.width * kHalf, height: containerView.frame.height * kThird))
        self.iceCubesPriceLabel.text = "Ice Cubes for $1:"
        self.iceCubesPriceLabel.textColor = UIColor.blackColor()
        self.iceCubesPriceLabel.font = UIFont(name: "Arial", size: 18)
        self.iceCubesPriceLabel.textAlignment = NSTextAlignment.Right
        self.iceCubesPriceLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.iceCubesPriceLabel)

    }
    
    func setupThirdContainer(containerView: UIView){
        self.stepTwoLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y * kQuarter, width: containerView.frame.width, height: containerView.frame.height * kQuarter))
        self.stepTwoLabel.text = "Step 2: Mix your lemonade"
        self.stepTwoLabel.textColor = UIColor.blueColor()
        self.stepTwoLabel.font = UIFont(name: "Arial", size: 18)
        self.stepTwoLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepTwoLabel)
        
        self.mixInstructionsLabel = UILabel(frame: CGRect(x: containerView.frame.width * kQuarter, y: containerView.frame.height * kQuarter, width: containerView.frame.width * (3 * kQuarter), height: containerView.frame.height * kQuarter))
        self.mixInstructionsLabel.text = "Do your customers prefer more ice or more lemon today?"
        self.mixInstructionsLabel.textColor = UIColor.blackColor()
        self.mixInstructionsLabel.font = UIFont(name: "Arial", size: 15)
        self.mixInstructionsLabel.backgroundColor = UIColor.whiteColor()
        self.mixInstructionsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.mixInstructionsLabel.numberOfLines = 2
        containerView.addSubview(self.mixInstructionsLabel)
        
        self.mixLemonsLabel = UILabel(frame: CGRect(x: containerView.frame.width * kSixth, y: containerView.frame.height * ( 2 * kQuarter), width: containerView.frame.width * kThird, height: containerView.frame.height * kQuarter))
        self.mixLemonsLabel.text = "Lemons:"
        self.mixLemonsLabel.textColor = UIColor.blackColor()
        self.mixLemonsLabel.font = UIFont(name: "Arial", size: 18)
        self.mixLemonsLabel.textAlignment = NSTextAlignment.Right
        self.mixLemonsLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.mixLemonsLabel)
        
        self.mixIceCubesLabel = UILabel(frame: CGRect(x: containerView.frame.width * kSixth, y: containerView.frame.height * ( 3 * kQuarter), width: containerView.frame.width * kThird, height: containerView.frame.height * kQuarter))
        self.mixIceCubesLabel.text = "Ice Cubes:"
        self.mixIceCubesLabel.textColor = UIColor.blackColor()
        self.mixIceCubesLabel.font = UIFont(name: "Arial", size: 18)
        self.mixIceCubesLabel.textAlignment = NSTextAlignment.Right
        self.mixIceCubesLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.mixIceCubesLabel)
    }
    
    func setupFourthContainer(containerView: UIView){
        self.stepThreeLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y, width: containerView.frame.width, height: containerView.frame.height * kQuarter))
        self.stepThreeLabel.text = "Step 3: Start selling your brew"
        self.stepThreeLabel.textColor = UIColor.blueColor()
        self.stepThreeLabel.font = UIFont(name: "Arial", size: 18)
        self.stepThreeLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepThreeLabel)
        
        self.instructionsLabel = UILabel(frame: CGRect( x: containerView.frame.width * kQuarter, y: containerView.frame.height * kQuarter, width: containerView.frame.width * ( 2 * kThird), height: containerView.frame.height * (3 * kEighth)))
        self.instructionsLabel.text = "At the end of the day you will either make or lose money. If you don't have enough money to buy new inventory then you lose the game."
        self.instructionsLabel.textColor = UIColor.blackColor()
        self.instructionsLabel.font = UIFont(name: "Arial", size: 13)
        self.instructionsLabel.backgroundColor = UIColor.whiteColor()
        self.instructionsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.instructionsLabel.numberOfLines = 4
        containerView.addSubview(self.instructionsLabel)
    }

}

