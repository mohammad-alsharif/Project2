//
//  UpdateList.swift
//  Project2
//
//  Created by mohammad.alsharif on 27/03/1443 AH.
//

import UIKit

protocol UpdateListDelegate {
    func updateList(updateName: String, index: Int)
}

class UbdateList: UIViewController {
    
    @IBOutlet weak var textFieldUpdate: UITextField!
    
    var delegate: UpdateListDelegate!
    var ubdating: String?
    var currentPosetion = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldUpdate.text = ubdating
    
    }
    
    @IBAction func Ubdate(_ sender: UIButton) {
        let newUpdate = textFieldUpdate.text!
        delegate.updateList(updateName: newUpdate, index: currentPosetion)

        
        self.navigationController?.popViewController(animated: true)
    }
    
}
