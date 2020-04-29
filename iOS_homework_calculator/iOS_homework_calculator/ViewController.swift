//
//  ViewController.swift
//  iOS_homework_calculator
//
//  Created by 김성은 on 30/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var allclearButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let radius = zeroButton.frame.width * 0.5
        
        zeroButton.layer.cornerRadius = radius
        oneButton.layer.cornerRadius = radius
        twoButton.layer.cornerRadius = radius
        threeButton.layer.cornerRadius = radius
        fourButton.layer.cornerRadius = radius
        fiveButton.layer.cornerRadius = radius
        sixButton.layer.cornerRadius = radius
        sevenButton.layer.cornerRadius = radius
        eightButton.layer.cornerRadius = radius
        nineButton.layer.cornerRadius = radius
        plusButton.layer.cornerRadius = radius
        minusButton.layer.cornerRadius = radius
        multiplyButton.layer.cornerRadius = radius
        divisionButton.layer.cornerRadius = radius
        allclearButton.layer.cornerRadius = radius
        resultButton.layer.cornerRadius = radius
        
    }


}

