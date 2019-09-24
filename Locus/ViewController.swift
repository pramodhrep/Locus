//
//  ViewController.swift
//  Locus
//
//  Created by Pramod Repaka on 2019-09-18.
//  Copyright © 2019 Pramod Repaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 1
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var txtScore: UILabel!
    @IBOutlet var txtRound: UILabel!
    @IBOutlet var TargetVal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtScore.text = "\(score)"
        txtRound.text = "\(round)"
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        updateLabels()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
        var difference: Int
        
        difference = currentValue - targetValue
        
        if difference < 0 {
            difference = difference * (-1)
        } else if difference == 0 {
            score += 1
        }
        
        round += 1
        
        let message = "The value of slider is : \(currentValue)" +
            "\n The Target value is \(targetValue)" +
            "\n The Difference is: \(difference)"
        let alert = UIAlertController(title: "Locus Result!",message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "ok",style: .default,handler: { _ in
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        startNewRound()
        TargetVal.text = String(targetValue)
        txtScore.text = "0"
        txtRound.text = "1"
    }
    
    func updateLabels(){
        TargetVal.text = String(targetValue)
        txtScore.text = String(score)
        txtRound.text = String(round)
    }
}

