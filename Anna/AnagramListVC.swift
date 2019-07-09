//
//  AnagramListVC.swift
//  Anna
//
//  Created by Mohcine Belarrem on 09/07/2019.
//  Copyright © 2019 belarrem. All rights reserved.
//

import UIKit

class AnagramListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var permutations = [String]()
    
    @IBOutlet weak var tableview: UITableView!
    
    static let anagramCellIdenitifier = "anagramCell"
    
    var word : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        var arr = Array(word.lowercased())
        scramble(arr.count,&arr)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permutations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnagramListVC.anagramCellIdenitifier)
        cell?.textLabel?.text = permutations[indexPath.row]
        return cell!
    }
    
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func scramble(_ n:Int, _ a: inout Array<Character>) {
        if n == 1 {
            //print(String(a))
            permutations.append(String(a))
            return
            
        }
        for i in 0..<n-1 {
            scramble(n-1,&a)
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        scramble(n-1,&a)
    }
    
}
