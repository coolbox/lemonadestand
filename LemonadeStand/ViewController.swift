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
    var plusLemonsBuyButton: UIButton!
    var minusLemonsBuyButton: UIButton!
    var plusIceCubesBuyButton: UIButton!
    var minusIceCubesBuyButton: UIButton!
    
    //  Step 2
    var stepTwoLabel: UILabel!
    var mixInstructionsLabel: UILabel!
    var mixLemonsLabel: UILabel!
    var mixLemonsNumberLabel: UILabel!
    var mixIceCubesLabel: UILabel!
    var mixIceCubesNumberLabel: UILabel!
    var plusLemonsMixButton: UIButton!
    var minusLemonsMixButton: UIButton!
    var plusIceCubesMixButton: UIButton!
    var minusIceCubesMixButton: UIButton!
    
    // Step 3
    var stepThreeLabel: UILabel!
    var instructionsLabel: UILabel!
    var startDayButton: UIButton!
    
    // Positioning
    let kEighth:CGFloat = 1.0/8.0
    let kHalf:CGFloat = 1.0/2.0
    let kQuarter:CGFloat = 1.0/4.0
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    
    // Money
    var credits = 10
    var lemons = 1
    var iceCubes = 1
    var winnings = 0
    var lemonsBought = 0
    var iceCubesBought = 0
    var lemonsMix = 0
    var iceCubesMix = 0

    //  Prices
    let priceOfLemon = 2
    let priceOfIceCube = 1
    
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
    
    // Button Presses
    func plusLemonsBuyButtonPressed (button: UIButton) {
        if credits <= 0 {
            showAlertWithText(header: "No More Credits", message: "Reset Game")
        } else {
            lemons += 1
            lemonsBought += 1
            credits -= priceOfLemon
            updateStep1Labels()
        }
    }

    func minusLemonsBuyButtonPressed (button: UIButton) {
        if lemonsBought <= 0 {
            showAlertWithText(header: "No more lemons ", message: "Nothing left to refund!")
        } else if lemonsBought > 0 && lemons == 0 {
            showAlertWithText(header: "No more lemons ", message: "You've mixed all your lemons!")
        } else {
            lemons -= 1
            lemonsBought -= 1
            credits += priceOfLemon
            updateStep1Labels()
        }
    }
    
    func plusIceCubesBuyButtonPressed (button: UIButton) {
        if credits <= 0 {
            showAlertWithText(header: "No More Credits", message: "Reset Game")
        }
        else {
            iceCubes += 1
            iceCubesBought += 1
            credits -= priceOfIceCube
            updateStep1Labels()
        }
    }
    
    func minusIceCubesBuyButtonPressed (button: UIButton) {
        if iceCubesBought <= 0 && iceCubes > 0 {
            showAlertWithText(header: "No more ice cubes ", message: "Nothing left to refund!")
        } else if iceCubesBought > 0 && iceCubes == 0 {
            showAlertWithText(header: "No more ice cubes ", message: "You've mixed all your ice cubes!")
        } else {
            iceCubes -= 1
            iceCubesBought -= 1
            credits += priceOfIceCube
            updateStep1Labels()
        }
    }
    
    func plusLemonsMixButtonPressed (button: UIButton) {
        if lemons <= 0 {
            showAlertWithText(header: "No More", message: "You've got no lemons left to mix!")
        }
        else {
            lemons -= 1
            lemonsMix += 1
            updateStep2Labels()
        }
    }
    
    func minusLemonsMixButtonPressed (button: UIButton) {
        if lemonsMix <= 0 {
            showAlertWithText(header: "No More", message: "You've got no lemons left to un-mix!")
        }
        else {
            lemons += 1
            lemonsMix -= 1
            updateStep2Labels()
        }
    }
    
    func plusIceCubesMixButtonPressed (button: UIButton) {
        if iceCubes <= 0 {
            showAlertWithText(header: "No More", message: "You've got no ice cubes left to mix!")
        }
        else {
            iceCubes -= 1
            iceCubesMix += 1
            updateStep2Labels()
        }
    }
    
    func minusIceCubesMixButtonPressed (button: UIButton) {
        if iceCubesMix <= 0 {
            showAlertWithText(header: "No More", message: "You've got no ice cubes left to un-mix!")
        }
        else {
            iceCubes += 1
            iceCubesMix -= 1
            updateStep2Labels()
        }
    }
    
    func startDayButtonPressed (button: UIButton) {
        println("startDayButtonPressed")
        println(button)
    }

    func setupFirstContainer(containerView: UIView){
        self.youHaveLabel = UILabel(
            frame: CGRect(
                x: containerView.bounds.origin.x * kHalf,
                y: containerView.bounds.origin.y,
                width: containerView.frame.width * (3 * kEighth),
                height: containerView.frame.height * kThird
            )
        )
        self.youHaveLabel.text = "You have:"
        self.youHaveLabel.textColor = UIColor.redColor()
        self.youHaveLabel.font = UIFont(name: "Arial", size: 18)
        self.youHaveLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.youHaveLabel)
        
        self.moneyLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (3 * kEighth),
                y: containerView.bounds.origin.y,
                width: containerView.frame.width * (5 * kEighth),
                height: containerView.frame.height * kThird
            )
        )
        self.moneyLabel.text = "$10"
        self.moneyLabel.textColor = UIColor.greenColor()
        self.moneyLabel.font = UIFont(name: "Arial", size: 18)
        self.moneyLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.moneyLabel)
        
        self.totalLemonsLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (3 * kEighth),
                y: containerView.frame.height * kThird,
                width: containerView.frame.width * (5 * kEighth),
                height: containerView.frame.height * kThird
            )
        )
        self.totalLemonsLabel.text = "1 Lemon(s)"
        self.totalLemonsLabel.textColor = UIColor.blackColor()
        self.totalLemonsLabel.font = UIFont(name: "Arial", size: 18)
        self.totalLemonsLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.totalLemonsLabel)
        
        self.totalIceCubesLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (3 * kEighth),
                y: containerView.frame.height * (2 * kThird),
                width: containerView.frame.width * (5 * kEighth),
                height: containerView.frame.height * kThird
            )
        )
        self.totalIceCubesLabel.text = "1 Ice Cube(s)"
        self.totalIceCubesLabel.textColor = UIColor.blackColor()
        self.totalIceCubesLabel.font = UIFont(name: "Arial", size: 18)
        self.totalIceCubesLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.totalIceCubesLabel)
    }
    
    func setupSecondContainer(containerView: UIView){
        self.stepOneLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y * kThird, width: containerView.frame.width, height: containerView.frame.height * kThird))
        self.stepOneLabel.text = "Step 1: Purchase Supplies"
        self.stepOneLabel.textColor = UIColor.blueColor()
        self.stepOneLabel.font = UIFont(name: "Arial", size: 18)
        self.stepOneLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepOneLabel)
        
        self.lemondsPriceLabel = UILabel(
            frame: CGRect(
                x: containerView.bounds.origin.x,
                y: containerView.frame.height * kThird,
                width: containerView.frame.width * kHalf,
                height: containerView.frame.height * kThird
            )
        )
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
        
        // Buy lemons
        self.plusLemonsBuyButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * kHalf,
                y: containerView.frame.height * kThird,
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kThird
            )
        )
        self.plusLemonsBuyButton.setTitle("+", forState: UIControlState.Normal)
        self.plusLemonsBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.plusLemonsBuyButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.plusLemonsBuyButton.backgroundColor = UIColor.redColor()
        self.plusLemonsBuyButton.addTarget(self, action: "plusLemonsBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.plusLemonsBuyButton)
        
        // Sell lemons
        self.minusLemonsBuyButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * (7 * kEighth),
                y: containerView.frame.height * kThird,
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kThird
            )
        )
        self.minusLemonsBuyButton.setTitle("-", forState: UIControlState.Normal)
        self.minusLemonsBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.minusLemonsBuyButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.minusLemonsBuyButton.backgroundColor = UIColor.redColor()
        self.minusLemonsBuyButton.addTarget(self, action: "minusLemonsBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.minusLemonsBuyButton)
        
        //  Lemons Quantity: purchaseLemonsLabel
        self.purchaseLemonsLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (5 * kEighth),
                y: containerView.frame.height * kThird,
                width: (containerView.frame.width * kHalf) * (2 * kQuarter),
                height: containerView.frame.height * kThird
            )
        )
        self.purchaseLemonsLabel.text = "0"
        self.purchaseLemonsLabel.textColor = UIColor.blackColor()
        self.purchaseLemonsLabel.font = UIFont(name: "Arial", size: 20)
        self.purchaseLemonsLabel.textAlignment = NSTextAlignment.Center
        self.purchaseLemonsLabel.backgroundColor = UIColor.greenColor()
        containerView.addSubview(self.purchaseLemonsLabel)
        
        // Buy ice cubes
        self.plusIceCubesBuyButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * kHalf,
                y: containerView.frame.height * (2 * kThird),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kThird
            )
        )
        self.plusIceCubesBuyButton.setTitle("+", forState: UIControlState.Normal)
        self.plusIceCubesBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.plusIceCubesBuyButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.plusIceCubesBuyButton.backgroundColor = UIColor.redColor()
        self.plusIceCubesBuyButton.addTarget(self, action: "plusIceCubesBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.plusIceCubesBuyButton)
        
        // Sell ice cubes
        self.minusIceCubesBuyButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * (7 * kEighth),
                y: containerView.frame.height * (2 * kThird),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kThird
            )
        )
        self.minusIceCubesBuyButton.setTitle("-", forState: UIControlState.Normal)
        self.minusIceCubesBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.minusIceCubesBuyButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.minusIceCubesBuyButton.backgroundColor = UIColor.redColor()
        self.minusIceCubesBuyButton.addTarget(self, action: "minusIceCubesBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.minusIceCubesBuyButton)
        
        //  Ice Cubes Quantity: purchaseIceCubesLabel
        self.purchaseIceCubesLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (5 * kEighth),
                y: containerView.frame.height * (2 * kThird),
                width: (containerView.frame.width * kHalf) * (2 * kQuarter),
                height: containerView.frame.height * kThird
            )
        )
        self.purchaseIceCubesLabel.text = "0"
        self.purchaseIceCubesLabel.textColor = UIColor.blackColor()
        self.purchaseIceCubesLabel.font = UIFont(name: "Arial", size: 20)
        self.purchaseIceCubesLabel.textAlignment = NSTextAlignment.Center
        self.purchaseIceCubesLabel.backgroundColor = UIColor.greenColor()
        containerView.addSubview(self.purchaseIceCubesLabel)
    }
    
    func setupThirdContainer(containerView: UIView){
        self.stepTwoLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y * kQuarter, width: containerView.frame.width, height: containerView.frame.height * kQuarter))
        self.stepTwoLabel.text = "Step 2: Mix your lemonade"
        self.stepTwoLabel.textColor = UIColor.blueColor()
        self.stepTwoLabel.font = UIFont(name: "Arial", size: 18)
        self.stepTwoLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepTwoLabel)
        
        self.mixInstructionsLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * kQuarter,
                y: containerView.frame.height * kQuarter,
                width: containerView.frame.width * (3 * kQuarter),
                height: containerView.frame.height * kQuarter
            )
        )
        self.mixInstructionsLabel.text = "Do your customers prefer more ice or more lemon today?"
        self.mixInstructionsLabel.textColor = UIColor.blackColor()
        self.mixInstructionsLabel.font = UIFont(name: "Arial", size: 15)
        self.mixInstructionsLabel.backgroundColor = UIColor.whiteColor()
        self.mixInstructionsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.mixInstructionsLabel.numberOfLines = 2
        containerView.addSubview(self.mixInstructionsLabel)
        
        self.mixLemonsLabel = UILabel(
            frame: CGRect(
                x: containerView.bounds.origin.x,
                y: containerView.frame.height * (2 * kQuarter),
                width: containerView.frame.width * kHalf,
                height: containerView.frame.height * kQuarter
            )
        )
        self.mixLemonsLabel.text = "Lemons:"
        self.mixLemonsLabel.textColor = UIColor.blackColor()
        self.mixLemonsLabel.font = UIFont(name: "Arial", size: 18)
        self.mixLemonsLabel.textAlignment = NSTextAlignment.Right
        self.mixLemonsLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.mixLemonsLabel)
        
        self.mixIceCubesLabel = UILabel(
            frame: CGRect(
                x: containerView.bounds.origin.x,
                y: containerView.frame.height * (3 * kQuarter),
                width: containerView.frame.width * kHalf,
                height: containerView.frame.height * kQuarter
            )
        )
        self.mixIceCubesLabel.text = "Ice Cubes:"
        self.mixIceCubesLabel.textColor = UIColor.blackColor()
        self.mixIceCubesLabel.font = UIFont(name: "Arial", size: 18)
        self.mixIceCubesLabel.textAlignment = NSTextAlignment.Right
        self.mixIceCubesLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.mixIceCubesLabel)
        
        // Plus lemons
        self.plusLemonsMixButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * kHalf,
                y: containerView.frame.height * (2 * kQuarter),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kQuarter
            )
        )
        self.plusLemonsMixButton.setTitle("+", forState: UIControlState.Normal)
        self.plusLemonsMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.plusLemonsMixButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.plusLemonsMixButton.backgroundColor = UIColor.redColor()
        self.plusLemonsMixButton.addTarget(self, action: "plusLemonsMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.plusLemonsMixButton)
        
        // Minus lemons
        self.minusLemonsMixButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * (7 * kEighth),
                y: containerView.frame.height * (2 * kQuarter),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kQuarter
            )
        )
        self.minusLemonsMixButton.setTitle("-", forState: UIControlState.Normal)
        self.minusLemonsMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.minusLemonsMixButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.minusLemonsMixButton.backgroundColor = UIColor.redColor()
        self.minusLemonsMixButton.addTarget(self, action: "minusLemonsMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.minusLemonsMixButton)
        
        //  Lemons Quantity: mixLemonsNumberLabel
        self.mixLemonsNumberLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (5 * kEighth),
                y: containerView.frame.height * (2 * kQuarter),
                width: (containerView.frame.width * kHalf) * (2 * kQuarter),
                height: containerView.frame.height * kQuarter
            )
        )
        self.mixLemonsNumberLabel.text = "0"
        self.mixLemonsNumberLabel.textColor = UIColor.blackColor()
        self.mixLemonsNumberLabel.font = UIFont(name: "Arial", size: 20)
        self.mixLemonsNumberLabel.textAlignment = NSTextAlignment.Center
        self.mixLemonsNumberLabel.backgroundColor = UIColor.greenColor()
        containerView.addSubview(self.mixLemonsNumberLabel)
        
        // Plus ice cubes
        self.plusIceCubesMixButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * kHalf,
                y: containerView.frame.height * (3 * kQuarter),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kQuarter
            )
        )
        self.plusIceCubesMixButton.setTitle("+", forState: UIControlState.Normal)
        self.plusIceCubesMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.plusIceCubesMixButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.plusIceCubesMixButton.backgroundColor = UIColor.redColor()
        self.plusIceCubesMixButton.addTarget(self, action: "plusIceCubesMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.plusIceCubesMixButton)
        
        // Minus ice cubes
        self.minusIceCubesMixButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * (7 * kEighth),
                y: containerView.frame.height * (3 * kQuarter),
                width: (containerView.frame.width * kHalf) * kQuarter,
                height: containerView.frame.height * kQuarter
            )
        )
        self.minusIceCubesMixButton.setTitle("-", forState: UIControlState.Normal)
        self.minusIceCubesMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.minusIceCubesMixButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.minusIceCubesMixButton.backgroundColor = UIColor.redColor()
        self.minusIceCubesMixButton.addTarget(self, action: "minusIceCubesMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.minusIceCubesMixButton)
        
        //  Ice cubes Quantity: mixIceCubesNumberLabel
        self.mixIceCubesNumberLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * (5 * kEighth),
                y: containerView.frame.height * (3 * kQuarter),
                width: (containerView.frame.width * kHalf) * (2 * kQuarter),
                height: containerView.frame.height * kQuarter
            )
        )
        self.mixIceCubesNumberLabel.text = "0"
        self.mixIceCubesNumberLabel.textColor = UIColor.blackColor()
        self.mixIceCubesNumberLabel.font = UIFont(name: "Arial", size: 20)
        self.mixIceCubesNumberLabel.textAlignment = NSTextAlignment.Center
        self.mixIceCubesNumberLabel.backgroundColor = UIColor.greenColor()
        containerView.addSubview(self.mixIceCubesNumberLabel)
    }
    
    func setupFourthContainer(containerView: UIView){
        self.stepThreeLabel = UILabel(frame: CGRect( x: containerView.bounds.origin.x, y: containerView.bounds.origin.y, width: containerView.frame.width, height: containerView.frame.height * kQuarter))
        self.stepThreeLabel.text = "Step 3: Start selling your brew"
        self.stepThreeLabel.textColor = UIColor.blueColor()
        self.stepThreeLabel.font = UIFont(name: "Arial", size: 18)
        self.stepThreeLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.stepThreeLabel)
        
        self.instructionsLabel = UILabel(
            frame: CGRect(
                x: containerView.frame.width * kQuarter,
                y: containerView.frame.height * kQuarter,
                width: containerView.frame.width * (3 * kQuarter),
                height: containerView.frame.height * (3 * kEighth)
            )
        )
        self.instructionsLabel.text = "At the end of the day you will either make or lose money. If you don't have enough money to buy new inventory then you lose the game."
        self.instructionsLabel.textColor = UIColor.blackColor()
        self.instructionsLabel.font = UIFont(name: "Arial", size: 13)
        self.instructionsLabel.backgroundColor = UIColor.whiteColor()
        self.instructionsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.instructionsLabel.numberOfLines = 4
        containerView.addSubview(self.instructionsLabel)
        
        // Start button: startDayButton
        self.startDayButton = UIButton(
            frame: CGRect(
                x: containerView.frame.width * (2 * kEighth),
                y: containerView.frame.height * (5 * kEighth),
                width: containerView.frame.width * (4 * kEighth),
                height: containerView.frame.height * (3 * kEighth)
            )
        )
        self.startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
        self.startDayButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.startDayButton.titleLabel?.font = UIFont(name: "Arial", size: 30)
        self.startDayButton.backgroundColor = UIColor.yellowColor()
        self.startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.startDayButton)
    }

    func updateTopLabels () {
        self.moneyLabel.text = "$\(credits)"
        self.totalLemonsLabel.text = "\(lemons) Lemon(s)"
        self.totalIceCubesLabel.text = "\(iceCubes) Ice Cube(s)"
    }
    
    func updateStep1Labels () {
        updateTopLabels()
        
        // Step 1:
        self.purchaseLemonsLabel.text = "\(lemonsBought)"
        self.purchaseIceCubesLabel.text = "\(iceCubesBought)"
    }
    
    func updateStep2Labels () {
        updateTopLabels()
        
        // Step 2
        self.mixLemonsNumberLabel.text = "\(lemonsMix)"
        self.mixIceCubesNumberLabel.text = "\(iceCubesMix)"
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

