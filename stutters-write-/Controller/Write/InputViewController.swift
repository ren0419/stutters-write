//
//  InputViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/04.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet private weak var textView: PlaceHolderTextView!
    @IBOutlet private weak var displayButton: UIButton!
    @IBOutlet private weak var tabView: UIView!
    @IBOutlet private weak var whiteButton: UIButton!
    @IBOutlet private weak var blackButton: UIButton!
    @IBOutlet private weak var saveSwitch: UISwitch!
    @IBOutlet private weak var bWhiteButton: UIButton!
    @IBOutlet private weak var bGreenButton: UIButton!
    var property = NotationProperty()
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        textView.layer.cornerRadius = 5.0
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        
        displayButton.layer.cornerRadius = 10.0
        tabView.layer.cornerRadius = 5.0
        
        whiteButton.layer.cornerRadius = 10.0
        whiteButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        blackButton.layer.cornerRadius = 10.0
        blackButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        bWhiteButton.layer.cornerRadius = 10.0
        bWhiteButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        bWhiteButton.layer.borderWidth = 0.2
        bGreenButton.layer.cornerRadius = 10.0
        bGreenButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
    }
    
    
    @IBAction func onTapBackWhite(_ sender: Any) {
        bWhiteButton.layer.borderWidth = 1.5
        bGreenButton.layer.borderWidth = 0
        bWhiteButton.isEnabled = false
        bGreenButton.isEnabled = true
        whiteButton.backgroundColor = .notPrimary
        blackButton.backgroundColor = .white
        blackButton.layer.borderWidth = 1.5
        blackButton.isEnabled = false
        whiteButton.isEnabled = false
    }
    
    @IBAction func onTapBackGreen(_ sender: Any) {
        bGreenButton.layer.borderWidth = 1.5
        bWhiteButton.layer.borderWidth = 0.2
        bGreenButton.isEnabled = false
        bWhiteButton.isEnabled = true
        whiteButton.isEnabled = true
        blackButton.isEnabled = true
        whiteButton.backgroundColor = .primary
        blackButton.backgroundColor = .notPrimary
        blackButton.layer.borderWidth = 0
    }
    
    
    
    @IBAction func onTapWhite(_ sender: Any) {
        whiteButton.isEnabled = false
        blackButton.isEnabled = true
        whiteButton.backgroundColor = .primary
        blackButton.backgroundColor = .notPrimary
        property.color = .white
        property.save = true
    }
    
    
    @IBAction func onTapBlack(_ sender: Any) {
        whiteButton.isEnabled = true
        blackButton.isEnabled = true
        whiteButton.backgroundColor = .notPrimary
        blackButton.backgroundColor = .primary
        property.color = .black
        property.save = false
    }
    
    @IBAction func onTapDisplayButton(_ sender: Any) {
        if textView.text == "" {
            showMessage(title: "伝えたいことを\n入力してください", message: "")
            return
        }
        
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let text = textView.text
        
        if saveSwitch.isOn {
        var saves = userDefaults.array(forKey: "saves") as? [String] ?? []
        saves.append(textView.text)
        userDefaults.set(saves, forKey: "saves")
        }
        
        let resultVC = segue.destination as! ResultViewController
        resultVC.resultText = text
        resultVC.stringColor = property.color

    }
    
}

extension InputViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
}
