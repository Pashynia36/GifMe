//
//  GifCell.swift
//  GifMe
//
//  Created by Pavlo Novak on 3/27/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell {
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var imageGif: UIImageView!
    
    func prepareCell(myGif: String) {
    
        
        let url = URL(string: myGif)
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.myActivity.isHidden = true
                self.imageGif.image = UIImage.gif(data: data!)
            }
        }
    }
}
