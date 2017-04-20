//
//  InformationViewController.swift
//  MatAppen
//
//  Created by Samantha Morrison on 25/02/11.
//  Copyright © 2017 Samantha Morrison. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    @IBOutlet weak var healthValueLabel: UILabel!
    var food : Food?
    
    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var burger: UIImageView!
    var dynamicAnimator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var items: [UIImageView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
                       animations: {self.healthValueLabel.center.x += self.view.bounds.width}, completion: nil)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        items = [icecream, burger]
        gravity = UIGravityBehavior(items: [icecream, burger])
        dynamicAnimator.addBehavior(gravity)

    }
    
    //  Setting all views with data from Food-object. Sending new API-request if any values are missing.
    func loadData () {
        if let name = food?.name {
            resultTitleLabel.text = name
        } else {
            NSLog("ResultView: Failed to load title.")
        }
        
        if let energy = food?.energyValue,
            let fat = food?.fat,
            let protein = food?.protein,
            let carbohydrates = food?.carbohydrates {
            energyLabel.text = "Energivärde: \(energy) kcal"
            fatLabel.text = "Fett: \(fat)"
            proteinLabel.text = "Protein: \(protein)"
            carbohydratesLabel.text = "Kolhydrater: \(carbohydrates)"
            healthValueLabel.text = "Nyttighetsvärde: \(fat * protein / 2)"
            NSLog("ResultView: Data set to views")
        } else {
            energyLabel.text = "Energivärde: Laddar..."
            fatLabel.text = "Fett: Laddar..."
            proteinLabel.text = "Protein: Laddar..."
            carbohydratesLabel.text = "Kolhydrater: Laddar..."
            apiHelper.getAllValues(food: food!, block: {_ in
                DispatchQueue.main.async {
                    NSLog("ResultView: Data from API recieved.")
                    self.loadData()
                }
            })
            NSLog("ResultView: Waiting for data from API.")
        }
        
    }
    
}
    
