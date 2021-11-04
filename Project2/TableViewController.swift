//
//  TableViewController.swift
//  Project2
//
//  Created by mohammad.alsharif on 24/03/1443 AH.
//

import UIKit

// Creat a Struct
struct Task {
    var title : String
}

// Creat a Class
class List {
    var items = [Task]()
}

class TableViewController: UITableViewController, UpdateListDelegate {
    
    // Creat a function To do the update item
    func updateList(updateName: String, index: Int) {
        list.items[index].title = updateName
        tableView.reloadData()
    }
    
    var oneIndex = 0
    var list = List()
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ListID")
        tableView.rowHeight = 50
    }

    // MARK: - Table view data source
    

    // A function that returns the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // It is used to determine the number of rows or cells in each group
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return list.items.count
    }

    // Creat a function To do the Delete item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
                list.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListID", for: indexPath) as! TableViewCell
        
            cell.listLabel.text = list.items[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User Select : \(indexPath.row)")
        oneIndex = indexPath.row
        
        let updateVC = storyboard?.instantiateViewController(withIdentifier: "updateID") as! UbdateList
        updateVC.ubdating = list.items[indexPath.row].title
        updateVC.delegate = self
        updateVC.currentPosetion = indexPath.row
        navigationController?.show(updateVC, sender: nil)
    }
    
    // Creat a Button To Add List
    @IBAction func Add(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "addSegue"){
            let addVC = segue.destination as! AddList
            addVC.list = list
        }
    }
    

}
