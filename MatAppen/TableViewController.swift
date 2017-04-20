//
//  TableViewController.swift
//  MatAppen
//
//  Created by Samantha Morrison on 25/02/11.
//  Copyright © 2017 Samantha Morrison. All rights reserved.
//

import UIKit

class Food {
    var name : String?
    var number : Int
    var energyValue : Int?
    var protein : Int?
    var fat : Int?
    var carbohydrates : Int?
    
    init(number : Int) {
        self.number = number
    }
    
    init(name : String, number : Int) {
        self.name = name
        self.number = number
    }
}

class TableViewCell : UITableViewCell {
    
    @IBOutlet weak var searchItemTitle: UILabel!
    @IBOutlet weak var searchItemEnergyValue: UILabel!
}

class TableViewController: UITableViewController {
    
    var data : [Food] = []
    var favorites : [Food] = []
    var searchWord : String = ""
    let userDef : UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "background_image"))
        self.tableView.backgroundView = imageView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.searchItemTitle.text = data[indexPath.row].name
        cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
        
        if let energy = data[indexPath.row].energyValue {
            cell.searchItemEnergyValue.text = "\(energy) kcal"
        } else {
            apiHelper.getAllValues(food: data[indexPath.row], block: {newFoodObject in
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            })
            cell.searchItemEnergyValue.text = "-"
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rvc : ResultViewController = segue.destination as! ResultViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            rvc.food = data[indexPath.row]
        }
        
    }
}
