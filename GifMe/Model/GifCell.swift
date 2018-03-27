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
    
        myActivity.isHidden = false
        myActivity.startAnimating()
        // 3 символа и после каждого символа подгрузка
        // активити индикатор крутится при прокрутке
        // картинка при подгрузке вылезает анимационно с альфой
        
        let url = URL(string: myGif)
        imageGif.alpha = 0.0
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.myActivity.isHidden = true
                self.imageGif.image = UIImage.gif(data: data!)
                UIView.animate(withDuration: 2.0, animations: {
                    self.imageGif.alpha = 1.0
                })
                
            }
        }
    }
}
