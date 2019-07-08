//
//  HistoryVC.swift
//  Anna
//
//  Created by Mohcine Belarrem on 09/07/2019.
//  Copyright © 2019 belarrem. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var selectedIndexPath : IndexPath!
    
    static let showMainMenuSegue = "showMainMenu"
    static let historyCellIdentifier = "historyCell"
    
    @IBOutlet weak var tableview: UITableView!
    
    let words = ["Pan","Horse","Pan","Pale","Anfield", "Elvis","Bart","Arc","Night"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryVC.historyCellIdentifier)
        cell?.textLabel?.text = words[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: HistoryVC.showMainMenuSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HistoryVC.showMainMenuSegue {
            let destination = segue.destination as! ViewController
            destination.historyWord = words[selectedIndexPath.row]
        }
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
