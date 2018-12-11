//
//  DataParser.swift
//  tlmqPictures
//
//  Created by dev on 23/10/2018.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit

class DataParser: NSObject {

    let dataUrl = "http://stage-api-mbe.tlmq.fr/rh/pictures.json"
    
    
    /**
     * Parse the data
     */
    
    func getData() {
     // Using URL Session since it's a simple get from the server
        let url = URL(string: dataUrl)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let pictures = json as? [[String: Any]] ?? []
                print(pictures)
                
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
}
