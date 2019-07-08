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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        processWord()
        textfield.resignFirstResponder()
        return true
    }

    @IBAction func showAnagramsList(_ sender: Any) {
        
        
    }
    
    @IBAction func showAnagramChecker(_ sender: Any) {
        
    }
    
    @IBAction func showHistory(_ sender: Any) {
        
    }
    
    
    func processWord() {
        //TODO:
        //Process Word
        //Add it to History
    }
    
    
}



