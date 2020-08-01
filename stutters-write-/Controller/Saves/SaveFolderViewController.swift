//
//  SaveFolderViewController.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/08.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class SaveFolderViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var saves: [[String]] = [[]]
    var postString: String?
    var postColor: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    func initViews() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let saveData = UserDefaults.standard.array(forKey: "saves") as? [[String]] else {
            saves = [["はじめまして","white"]]
            return
        }
        saves = saveData
        self.tableView.reloadData()
    }

    

}

extension SaveFolderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.dataSet(displayText: saves[indexPath.row][0])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            saves.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            UserDefaults.standard.set(saves, forKey: "saves")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       postString = saves[indexPath.row][0]
        postColor = saves[indexPath.row][1]
        performSegue(withIdentifier: "SaveToResult", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "SaveToResult") {
            guard let resultVC = segue.destination as? ResultViewController else {
                return
            }
        resultVC.resultText = postString
        resultVC.stringColor = postColor
    }
    }
    
}
