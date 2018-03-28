//
//  GifCell.swift
//  GifMe
//
//  Created by Pavlo Novak on 3/27/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit
import SDWebImage
import FLAnimatedImage

class GifCell: UICollectionViewCell {
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var imageGif: UIImageView!
    
    func prepareCell(myGif: String) {
        
        myActivity.isHidden = false
        myActivity.startAnimating()
        imageGif.alpha = 0.0
        DispatchQueue.global(qos: .background).async {
            self.imageGif.sd_setImage(with: URL(string: myGif))
            DispatchQueue.main.async {
                UIView.animate(withDuration: 2.0, animations: {
                    self.imageGif.alpha = 1.0
                })
                //self.myActivity.isHidden = true
            }
        }
    }
}
