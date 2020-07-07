//
//  YokogakiResultViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/06.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet private weak var contentView: UIView!
    var resultText: String?
    var stringColor: StringColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }

    func initView() {
        let displayLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.bounds.height, height: contentView.bounds.width))
        displayLabel.center = contentView.center
        displayLabel.font = UIFont(name: "HiraginoSans-W6", size: 200.0)
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.textAlignment = .center
        displayLabel.numberOfLines = 0
        displayLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        displayLabel.text = resultText
        self.view.backgroundColor = UIColor.primary
        contentView.backgroundColor = UIColor.primary
        displayLabel.backgroundColor = UIColor.primary
        
        switch stringColor {
        case .white:
            displayLabel.textColor = UIColor.white
        case .black:
            displayLabel.textColor = UIColor.black
        case .none:
            return
        }
        contentView.addSubview(displayLabel)

    }
    

   
}
