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
    
    var url: String = ""
    var gifsWeGot: GifModel?
    let firstHalf: String = "http://api.giphy.com/v1/gifs/search?q="
    let secondHalf: String = "&api_key=bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u"
    var newLine: String
    
    func decoder() -> GifModel {
        
        if newLine.trimmingCharacters(in: .whitespaces).isEmpty {
        } else {
            newLine = newLine.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        }
        url = firstHalf + newLine + secondHalf
        if let decodeURL = URL(string: url) {
            Alamofire.request(decodeURL).responseJSON { (response) in
                do {
                    self.gifsWeGot = try JSONDecoder().decode(GifModel.self, from: response.data!)
                    DispatchQueue.main.async {
                        return self.gifsWeGot
                    }
                } catch {
                    print("error")
                }
            }
        }
        return gifsWeGot!
    }
    
    init(newLine: String) {
        self.newLine = newLine
    }
}
