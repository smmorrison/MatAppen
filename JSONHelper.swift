//
//  JSONHelper.swift
//  MatAppen
//
//  Created by Samantha Morrison on 25/02/14.
//  Copyright © 2017 Samantha Morrison. All rights reserved.
//

import Foundation

func getSeacrhedResults(searchedWord : String, setData: @escaping ([[String:Any]]) -> Void){
    
    let returnData : [[String:Any]] = [[:]]
    
    let urlString = "http://www.matapi.se/foodstuff?query=\(searchedWord)&format=json&pretty=1"
    
    if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: safeUrlString) {
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            (maybeData: Data?, response: URLResponse?, error: Error?) in
            
            if let actualData = maybeData {
                let jsonOptions = JSONSerialization.ReadingOptions()
                do {
                    if let recievedData = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]] {
                        
                        print(recievedData)
                        setData(recievedData)
                    } else {
                        NSLog("Failed to cast from json.")
                    }
                }
                catch let parseError {
                    NSLog("Failed to parse json: \(parseError)")
                }
            } else {
                NSLog("No data received.")
            }
        }
        task.resume()
        
    } else {
        NSLog("Failed to create url.")
    }
    print(returnData)
}
