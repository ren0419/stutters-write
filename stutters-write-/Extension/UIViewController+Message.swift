//
//  UIViewController+Message.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/07.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

extension UIViewController {

    func showMessage(title: String?, message: String, _ dismissHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            dismissHandler?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    

}
