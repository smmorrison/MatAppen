//
//  ViewController.swift
//  MatAppen
//
//  Created by Samantha Morrison on 25/02/17.
//  Copyright © 2017 Samantha Morrison. All rights reserved.
//

import UIKit

let apiHelper = ApiHelper()


class ViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tvc : TableViewController = segue.destination as! TableViewController
        if let searchWord = searchField.text {
            tvc.searchWord = searchWord
            let query : String = "?query=\(searchWord)"
            apiHelper.getData(searchQuery: query, block: {downloadedData in
                DispatchQueue.main.async {
                    tvc.data = downloadedData
                    tvc.tableView.reloadData()
                }
            })
            
        }
    }
}
