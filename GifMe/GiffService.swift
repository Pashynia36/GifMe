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
    let firstHalf: String = "http://api.giphy.com/v1/gifs/search?q="
    let secondHalf: String = "&api_key=bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u"
    var gifsWeGot: GifModel?
    
    func decoder(nexLine: String, _ callBack: @escaping (_ model: GifModel) -> Void ) -> Void {
        
        var newLine = nexLine
        if newLine.trimmingCharacters(in: .whitespaces).isEmpty {
        } else {
            newLine = newLine.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        }
        url = firstHalf + newLine + secondHalf
        if let decodeURL = URL(string: url) {
            Alamofire.request(decodeURL).responseJSON { (response) in
                do {
                    self.gifsWeGot = try JSONDecoder().decode(GifModel.self, from: response.data!)
                    callBack(self.gifsWeGot!)
                } catch {
                    print("error")
                }
            }
        }
    }
}
