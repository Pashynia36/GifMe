//
//  GiffService.swift
//  GifMe
//
//  Created by Pavlo Novak on 3/28/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import Foundation
import Alamofire

class GiffService {
    
    class func decoder(text: String) -> GifModel {
        
        var url: String = ""
        var gifsWeGot: GifModel?
        let firstHalf: String = "http://api.giphy.com/v1/gifs/search?q="
        let secondHalf: String = "&api_key=bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u"
        var newLine: String = ""
        newLine = text
        if newLine.trimmingCharacters(in: .whitespaces).isEmpty {
        } else {
            newLine = newLine.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        }
        url = firstHalf + newLine + secondHalf
        if let decodeURL = URL(string: url) {
            Alamofire.request(decodeURL).responseJSON { (response) in
                do {
                    gifsWeGot = try JSONDecoder().decode(GifModel.self, from: response.data!)
                    DispatchQueue.main.async {
                        return gifsWeGot
                    }
                } catch {
                    print("error")
                }
            }
        }
        return gifsWeGot!
    }
}
