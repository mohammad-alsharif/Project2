//
//  AddList.swift
//  Project2
//
//  Created by mohammad.alsharif on 25/03/1443 AH.
//

import Foundation
import UIKit

protocol AddListDelegate {
    func addNewList(list: String)
}

class AddList: UIViewController {
    var list : List!
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate : AddListDelegate!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Create(_ sender: Any) {
//        let TVC = storyboard?.instantiateViewController(withIdentifier: "newList") as! AddListDelegate
//        TVC.delegate = self
        list.items.append(Task(title: textField.text!))
        navigationController?.popViewController(animated: true)
    }
    
}
