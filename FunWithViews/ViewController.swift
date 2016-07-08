//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topLeftView = DiceView(width: 1, height: 1)
    let topMiddleView = DiceView(width: 5, height: 1)
    let topRightView = DiceView(width: 9, height: 1)
    let midLeftView = DiceView(width: 1, height: 5)
    let centerView = DiceView(width: 5, height: 5)
    let midRightView = DiceView(width: 9, height: 5)
    let botLeftView = DiceView(width: 1, height: 9)
    let botRightView = DiceView(width: 9, height: 9)
    
    let label0 = DiceLabel(width: 1)
    let label1 = DiceLabel(width: 3)
    let label2 = DiceLabel(width: 5)
    let label3 = DiceLabel(width: 7)
    let label4 = DiceLabel(width: 9)
    let label5 = DiceLabel(width: 11)
    
    let diceButton = UIButton(frame: CGRectMake(
        UIScreen.mainScreen().bounds.width / 10 * 4.5,
        UIScreen.mainScreen().bounds.height / 24 * 21,
        UIScreen.mainScreen().bounds.width / 10,
        UIScreen.mainScreen().bounds.width / 10 ))

    var currentRoll = 0
    var previousRolls: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    
    func initViews() {
        
    // INITIAL VIEW
        view.backgroundColor = UIColor.lightGrayColor()
        
    // VIEWS TO REPRESENT DICE
        view.addSubview(topLeftView)
        view.addSubview(topRightView)
        view.addSubview(midLeftView)
        view.addSubview(centerView)
        view.addSubview(midRightView)
        view.addSubview(botLeftView)
        view.addSubview(botRightView)
        
        
    // LABELS TO STORE DIE ROLLS
        view.addSubview(label0)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
    // DICE BUTTON
        diceButton.setTitle("🎲", forState: .Normal)
        diceButton.titleLabel?.shadowOffset = CGSize(width: 10,height: 10)
        diceButton.titleLabel?.shadowColor = UIColor.blackColor()
        diceButton.titleLabel?.textAlignment = NSTextAlignment.Center
        diceButton.titleLabel?.font = UIFont.systemFontOfSize(UIScreen.mainScreen().bounds.width / 10)
        diceButton.addTarget(self, action: #selector(diceButtonAction), forControlEvents: .TouchUpInside)
        view.addSubview(diceButton)
        
    }
    
    func diceButtonAction(sender: UIButton!) {
        updatePreviousRolls()
        currentRoll = randomDiceRoll()
        updateDiceViews()
    }
    
    func updatePreviousRolls() {
        let labels = [label0,
                      label1,
                      label2,
                      label3,
                      label4,
                      label5
        ]
        
        if currentRoll != 0 {
            previousRolls.append(currentRoll)
            if previousRolls.count > 6 {
                previousRolls.removeAtIndex(0)
            }
        }
        
        for (index, label) in labels.enumerate() {
            if previousRolls.count > index {
                label.hidden = false
                label.text = String(previousRolls[index])
            } else {
                label.hidden = true
            }
        }
    }
    
    func updateDiceViews() {
        topLeftView.hidden = true
        topRightView.hidden = true
        midLeftView.hidden = true
        centerView.hidden = true
        midRightView.hidden = true
        botLeftView.hidden = true
        botRightView.hidden = true
    
        switch currentRoll {
        case 1:
            centerView.hidden = false
        case 2:
            midLeftView.hidden = false
            midRightView.hidden = false
        case 3:
            topLeftView.hidden = false
            centerView.hidden = false
            botRightView.hidden = false
        case 4:
            topLeftView.hidden = false
            topRightView.hidden = false
            botLeftView.hidden = false
            botRightView.hidden = false
        case 5:
            topLeftView.hidden = false
            topRightView.hidden = false
            centerView.hidden = false
            botLeftView.hidden = false
            botRightView.hidden = false
        case 6:
            topLeftView.hidden = false
            topRightView.hidden = false
            midLeftView.hidden = false
            midRightView.hidden = false
            botLeftView.hidden = false
            botRightView.hidden = false
        default: break
        }
    }

}
