//
//  SettingViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/12.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
    }
    

    func initViews() {
        tableView.register(UINib(nibName: "SettingViewCell", bundle: nil), forCellReuseIdentifier: "setting")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting") as! SettingViewCell
        let section = indexPath.row
        cell.selectionStyle = .none
        
        switch section {
        case 0: //FAQ
                cell.settingLabel.text = "よくあるご質問(FAQ)"
                cell.iconImageView.image = UIImage(systemName: "info.circle.fill")
        case 1: //意見・要望
                cell.settingLabel.text = "意見・要望"
                cell.iconImageView.image = UIImage(systemName: "envelope.fill")
        case 2: //バージョン表記
                cell.settingLabel.text = "バージョン v1.0.0"
                cell.iconImageView.image = UIImage(systemName: "square.grid.2x2.fill")
                cell.arrowImageView.isHidden = true
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.row
        switch section {
        case 0: //FAQ
            performSegue(withIdentifier: "FAQ", sender: nil)
        case 1: //改善・要望
            performSegue(withIdentifier: "Contact", sender: nil)
        default:
            break
        }
    }
}
