//
//  ContactViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/14.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit
import Firebase

class ContactViewController: UIViewController {

    @IBOutlet private weak var textView: PlaceHolderTextView!
    @IBOutlet private weak var sendButton: UIButton!
    var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
    }
    
    func initViews() {
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.cornerRadius = 5.0
        
        sendButton.layer.cornerRadius = 10.0
    }

    @IBAction func onTapSend(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "送信の確認", message: "本当に送信してよろしいですか？", preferredStyle: .alert)
        let OkAction: UIAlertAction = UIAlertAction(title: "はい", style: .default) { (action:UIAlertAction) in
            //送信の記述
            self.sendDB()
            let alert2: UIAlertController = UIAlertController(title: "送信完了", message: "送信しました。", preferredStyle: .alert)
            let okAction2: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{(action:UIAlertAction!) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.textView.text = ""
                    self.navigationController?.popViewController(animated: true)
                }
            }
                )
            alert2.addAction(okAction2)
            self.present(alert2, animated: true, completion: nil)
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "いいえ", style: .cancel, handler: nil)
        alert.addAction(OkAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendDB() {
        activityIndicator.startAnimating()
        
        if let message = textView.text {
            let date = Date()
            if let deviceID = UIDevice.current.identifierForVendor?.uuidString {
                Database.database().reference().child("opinion").child(deviceID + date.description).setValue(message)
            }
        }
        activityIndicator.stopAnimating()
    }
    
}

extension ContactViewController: UITableViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
}
