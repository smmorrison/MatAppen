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
    var food : Food?
    
    
    @IBOutlet weak var apple: UILabel!
    @IBOutlet weak var cake: UILabel!
    @IBOutlet weak var pear: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var taco: UILabel!
    @IBOutlet weak var tomato: UILabel!
    @IBOutlet weak var cherry: UILabel!
    @IBOutlet weak var sushi: UILabel!
    @IBOutlet weak var iceCream: UILabel!
    @IBOutlet weak var eggplant: UILabel!
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var bread: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var coffee: UILabel!
    @IBOutlet weak var burger: UILabel!
    @IBOutlet weak var pizza: UILabel!
    @IBOutlet weak var cheese: UILabel!
    @IBOutlet weak var beer: UILabel!
    @IBOutlet weak var choclate: UILabel!
    @IBOutlet weak var hotdog: UILabel!
    @IBOutlet weak var popcorn: UILabel!
    @IBOutlet weak var chicken: UILabel!
    @IBOutlet weak var orange: UILabel!
    @IBOutlet weak var lemon: UILabel!
    @IBOutlet weak var corn: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


class ResultViewAnimation : UIImageView {
    
    
    
}
















