//
//  ViewController.swift
//  GifMe
//
//  Created by Pavlo Novak on 3/27/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//  API Key: bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    let firstHalf: String = "http://api.giphy.com/v1/gifs/search?q="
    let secondHalf: String = "&api_key=bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u"
    var url: String = ""
    var gifsWeGot: GifModel?
    var helloWorldTimer: Timer?
    var keyBoardSizeHeight: CGFloat = 0.0
    var constantCollectionHeight: CGFloat = 0.0
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Setting height of ColView depending on our height of screen
        constantCollectionHeight = UIScreen.main.bounds.height - ( textField.frame.size.height + 30 )
        collectionHeight.constant = constantCollectionHeight
        textField.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let i = gifsWeGot?.data.count {
            return i
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GifCell
        if let i = gifsWeGot?.data[indexPath.row].images.original.url {
            cell.prepareCell(myGif: i)

        }
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // We return height of CollView to regular
        collectionHeight.constant = constantCollectionHeight
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count >= 2 {
            
            if let _ = helloWorldTimer {
                helloWorldTimer?.invalidate()
                helloWorldTimer = nil
                 print("invalidate")
            }
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkTime), userInfo: nil, repeats: false)
        }
        return true
        
    }
    
    //MARK:- keyBoard show
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            // Taking keyboard's size, that appeared first(first appearing has bigger height)
            if keyBoardSizeHeight == 0.0 {
                keyBoardSizeHeight = keyboardSize.height
            }
            // Check if CollView's height is actual size
            if collectionHeight.constant == constantCollectionHeight {
                collectionHeight.constant = UIScreen.main.bounds.height - ( keyBoardSizeHeight + textField.frame.size.height + 30)
            }
        }
    }
    
    @objc func checkTime() {
        
        //contidion with time comparison
        decoder()
        print("checkTime")
    }
    
    func decoder() {
        
        var newLine = textField.text!
        if textField.text!.trimmingCharacters(in: .whitespaces).isEmpty {
        } else {
            newLine = newLine.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        }
        url = firstHalf + newLine + secondHalf
        if let decodeURL = URL(string: url) {
            Alamofire.request(decodeURL).responseJSON { (response) in
                do {
                    self.gifsWeGot = try JSONDecoder().decode(GifModel.self, from: response.data!)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
}

