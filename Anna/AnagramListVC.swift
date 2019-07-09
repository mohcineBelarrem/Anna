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
    var anagrams =  [Bool]()
    
    @IBOutlet weak var tableview: UITableView!
    
    static let anagramCellIdenitifier = "anagramCell"
    
    var word : String = ""
    
    var j = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
       
        DispatchQueue.global().async {
            
            self.anagrams = Array(repeating: false, count: self.factorial(self.word.count))
        
            var arr = Array(self.word.lowercased())
            self.scramble(arr.count,&arr)
            
        }
        
        navigationItem.title = "\(word) permutations"
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
        
        let color = anagrams[indexPath.row] ? UIColor.blue : UIColor.red
        cell?.textLabel?.textColor = color
        
        return cell!
    }
    
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func scramble(_ n:Int, _ a: inout Array<Character>) {
        if n == 1 {
            permutations.append(String(a))
            checkForAnagram(String(a), j)
            j += 1
            return
            
        }
        for i in 0..<n-1 {
            scramble(n-1,&a)
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        scramble(n-1,&a)
        
    }
    
    func checkForAnagram(_ word : String, _ j : Int) {
        
        let appId = "7389a8e4"
        let appKey = "498fab3db48aa6ed917f203fa303432a"
        let language = "en-gb"
        let fields = "definitions"
        let strictMatch = "true"
        let word_id = word.lowercased()
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)&strictMatch=\(strictMatch)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request) { [weak self] (data,response,error) in
            
            do {
                
                let st = NSString(data: data ?? Data(), encoding: String.Encoding.utf8.rawValue) ?? ""
                if st.contains("results") {
                    self?.anagrams[j] = true
                } else {
                    self?.anagrams[j] = false
                }
                
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            }
            
            }.resume()
    }
    
    func factorial(_ n : Int) -> Int {
        
        if n == 0 || n == 1 {
            return 1
        } else {
            return n * factorial(n-1)
        }
        
    }
    
}
