//
//  ViewController.swift
//  Translator_AlexanderHa
//
//  Created by Alexander Ha on 11/8/20.
//  Copyright © 2020 Alexander Ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var labelView: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var picker: UIPickerView!
    
    var images = [UIImage]()
    let items = ["apple", "egg", "grapes", "sausage", "wine"]
    let translatedItems = ["Táo", "Trứng", "Nho", "Lạp xưởng", "Rượu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    //MARK: - View Setup methods
    
    func setupView() {
        picker.delegate = self
        picker.dataSource = self
        labelView.font = UIFont.boldSystemFont(ofSize: 30)
        setupImage()
    }
    
    func setupImage() {
        //loops through items array to appe
        for item in items {
            if let image = UIImage(named: item) {
                images.append(image)
            } else {
                print("Cannot retrieve image")
            }
        }
        imageView.image = images[0]
    }
    
    //MARK: - PickerView methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row].capitalized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = images[row]
        labelView.text = translatedItems[row]
    }
}



