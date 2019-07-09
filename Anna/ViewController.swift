//
//  ViewController.swift
//  Anna
//
//  Created by Mohcine Belarrem on 08/07/2019.
//  Copyright © 2019 belarrem. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textfield: UITextField!
    
    static let showAnagramCheckerSegue = "showAnagramChecker"
    static let showHistorySegue = "showHistory"
    static let showAnagramListSegue = "showAnagramList"
    
    var historyWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textfield.text!.count < 2 {
            showEmptyTextfieldAlert()
        } else {
            processWord(word: textfield.text!)
        }

        textfield.resignFirstResponder()
        return true
    }

    @IBAction func showAnagramsList(_ sender: Any) {
        
        if textfield.text!.count < 2 {
            showEmptyTextfieldAlert()
            return
        }
        
        performSegue(withIdentifier: ViewController.showAnagramListSegue, sender: self)
    }
    
    @IBAction func showAnagramChecker(_ sender: Any) {
        
        if textfield.text!.count < 2 {
            showEmptyTextfieldAlert()
            return
        }
        
        performSegue(withIdentifier: ViewController.showAnagramCheckerSegue, sender: self)
    }
    
    @IBAction func showHistory(_ sender: Any) {
        
        performSegue(withIdentifier: ViewController.showHistorySegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let word = textfield.text!
        processWord(word: word)
        
        if segue.identifier == ViewController.showAnagramCheckerSegue {
            let destination = segue.destination.children.first as! AnagramCheckerVC
            destination.originalWord = word
        }
        
        if segue.identifier == ViewController.showAnagramListSegue {
            let destination = segue.destination.children.first as! AnagramListVC
            destination.word = word
        }
        
    }
    
    
    func processWord(word : String) {
        HistoryManager.shared.append(newElement: word)
    }
    
    @IBAction func unwindFromHistory(segue: UIStoryboardSegue) {
        textfield.text = historyWord
    }
}






