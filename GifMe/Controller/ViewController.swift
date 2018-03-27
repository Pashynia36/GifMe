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

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    let firstHalf: String = "http://api.giphy.com/v1/gifs/search?q="
    let secondHalf: String = "&api_key=bXfg4xA0G9zOwL9bIe5HMgSIIuzIRw6u"
    var url: String = ""
    var gifsWeGot: GifModel?
    var previous: Int = 0
    var lastDate = Date()
    var newDate = Date()
    var buttonTapped: Bool = false
    var helloWorldTimer: Timer?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
    //Populate views   (populate with image)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GifCell
        if let i = gifsWeGot?.data[indexPath.row].images.original.url {
            cell.prepareCell(myGif: i)

        }
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count >= 2 {
            
            if let timer = helloWorldTimer {
                helloWorldTimer?.invalidate()
                helloWorldTimer = nil
                 print("invalidate")
            }
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkTime), userInfo: nil, repeats: false)
        }
        return true
        
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

