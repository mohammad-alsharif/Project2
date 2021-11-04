//
//  AddList.swift
//  Project2
//
//  Created by mohammad.alsharif on 25/03/1443 AH.
//

import Foundation
import UIKit

class AddList: UIViewController {
    var list : List!
    
    @IBOutlet weak var textFieldAdd: UITextField!

    // Creat a function to hide the keyboard when clicking on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func Create(_ sender: Any) {
        if textFieldAdd.text == "" {
            // Here we set a condition not to add an empty cell
        } else {
            list.items.append(Task(title: textFieldAdd.text!))
            navigationController?.popViewController(animated: true)
        }
    }
    
}
