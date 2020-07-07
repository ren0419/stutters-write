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
    @IBOutlet private weak var tategakiButton: UIButton!
    @IBOutlet private weak var yokogakiButton: UIButton!
    
    var notationMethod : Int?
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
        
        tategakiButton.layer.cornerRadius = 10.0
        tategakiButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        yokogakiButton.layer.cornerRadius = 10.0
        yokogakiButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        notationMethod = 1
    }
    
    
    @IBAction func onTapTategaki(_ sender: Any) {
        
        tategakiButton.isEnabled = false
        yokogakiButton.isEnabled = true
        tategakiButton.backgroundColor = UIColor.primary
        yokogakiButton.backgroundColor = UIColor.notPrimary
        notationMethod = 1
        
    }
    
    
    @IBAction func onTapYokogaki(_ sender: Any) {

        tategakiButton.isEnabled = true
        yokogakiButton.isEnabled = true
        tategakiButton.backgroundColor = UIColor.notPrimary
        yokogakiButton.backgroundColor = UIColor.primary
        notationMethod = 2

    }
    
    @IBAction func onTapDisplayButton(_ sender: Any) {
        
        switch notationMethod {
        case 1:
            performSegue(withIdentifier: "tategaki", sender: nil)
        case 2:
            performSegue(withIdentifier: "yokogaki", sender: nil)
        default:
            return
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let text = textView.text ?? ""
        
        switch notationMethod {
        case 1:
            let resultVC = segue.destination as! TategakiResultViewController
            resultVC.resultText = text
        case 2:
            let resultVC = segue.destination as! YokogakiResultViewController
            resultVC.resultText = text
        default:
            return
        }
        
    }
    
}

extension InputViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
}
