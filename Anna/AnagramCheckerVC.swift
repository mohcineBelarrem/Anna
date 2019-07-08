//
//  AnagramCheckerVC.swift
//  Anna
//
//  Created by Mohcine Belarrem on 08/07/2019.
//  Copyright © 2019 belarrem. All rights reserved.
//

import UIKit

class AnagramCheckerVC: UIViewController, UITextFieldDelegate {
    
    var originalWord = ""
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
    }
    

    @IBAction func checkAnagram(_ sender: Any) {
        
        textfield.resignFirstResponder()
        
        let text = textfield.text ?? ""
        
        guard text.count >= 2 else {
            self.showEmptyTextfieldAlert()
            return
        }
        
        let isAnagram = originalWord.lowercased().sorted() == text.lowercased().sorted()
        
        let message = isAnagram ? "The word \(text) is a permutation of the word \(originalWord)" : "The words are not permuations of each other"
        let title  =  isAnagram ? "Anagram" : "No Anagram"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        
        self.present(alert, animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnagram(self)
        return true
    }
    
    @IBAction func done(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    

}


extension UIViewController {
    
    func showEmptyTextfieldAlert() {
        
        let alert = UIAlertController(title: "Empty Text Field", message: "Please Type a word that's at least 2 letters long", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)

        
    }
}
