//
//  ResultViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/04.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class TategakiResultViewController: UIViewController {
    @IBOutlet private weak var contentView: UIView!
    var resultText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView() {
        let displayLabel: TTTAttributedLabel = TTTAttributedLabel(frame: CGRect(x: 0, y: 0, width: contentView.bounds.height, height: contentView.bounds.width))
        displayLabel.center = contentView.center
        displayLabel.verticalAlignment = .top
        displayLabel.font = UIFont(name: "HiraginoSans-W6", size: 100.0)
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.textAlignment = .center
        displayLabel.numberOfLines = 0
    
        displayLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        displayLabel.setText(resultText) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString!.addAttribute(NSAttributedString.Key.init(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0, mutableAttributedString!.length))
            return mutableAttributedString
        }
        contentView.addSubview(displayLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
